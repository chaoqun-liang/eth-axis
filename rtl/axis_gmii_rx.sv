/*

Copyright (c) 2015-2018 Alex Forencich

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

origin	https://github.com/alexforencich/verilog-ethernet.git
commit ebe31e811cee9db615a7d5ec8472f972f3368b90
Author: Alex Forencich <alex@alexforencich.com>
Date:   Thu Nov 8 13:15:47 2018 -0800

Modified by Jonathan Kimmitt to extract CRC bytes
 
lfsr submodule renamed rgmii_lfsr to avoid name clash with main project
*/

// Language: Verilog 2001

/*
 * AXI4-Stream GMII frame receiver (GMII in, AXI out)
 */
module axis_gmii_rx
(
    input  wire        clk,
    input  wire        rst,

    /*
     * GMII input
     */
    input  wire [7:0]  gmii_rxd,
    input  wire        gmii_rx_dv,
    input  wire        gmii_rx_er,

    /*
     * AXI output
     */
    output wire [7:0]  m_axis_tdata,
    output wire        m_axis_tvalid,
    output wire        m_axis_tlast,
    output wire        m_axis_tuser,

    /*
     * Control
     */
    input  wire        clk_enable,
    input  wire        mii_select,

    /*
     * Status
     */
    output wire        error_bad_frame,
    output wire        error_bad_fcs,

    /* debug */
    output reg [31:0]  fcs_reg
);

localparam [7:0]
    ETH_PRE = 8'h55,
    ETH_SFD = 8'hD5;

localparam [2:0]
    STATE_IDLE = 3'd0,
    STATE_PAYLOAD = 3'd1,
    STATE_WAIT_LAST = 3'd2,
    STATE_CRC = 3'd3;

reg [2:0] state_reg, state_next;

// datapath control signals
reg reset_crc;
reg update_crc;

reg mii_odd;
reg mii_locked;

reg [7:0] gmii_rxd_d0;
reg [7:0] gmii_rxd_d1;
reg [7:0] gmii_rxd_d2;
reg [7:0] gmii_rxd_d3;
reg [7:0] gmii_rxd_d4;

reg       gmii_rx_dv_d0;
reg       gmii_rx_dv_d1;
reg       gmii_rx_dv_d2;
reg       gmii_rx_dv_d3;
reg       gmii_rx_dv_d4;

reg       gmii_rx_er_d0;
reg       gmii_rx_er_d1;
reg       gmii_rx_er_d2;
reg       gmii_rx_er_d3;
reg       gmii_rx_er_d4;

reg [7:0] m_axis_tdata_reg, m_axis_tdata_next;
reg m_axis_tvalid_reg, m_axis_tvalid_next;
reg m_axis_tlast_reg, m_axis_tlast_next;
reg m_axis_tuser_reg, m_axis_tuser_next;

reg error_bad_frame_reg, error_bad_frame_next;
reg error_bad_fcs_reg, error_bad_fcs_next;
reg [31:0] fcs_next;
reg [31:0] crc_state;
reg [1:0] crc_cnt, crc_cnt_next;

wire [31:0] crc_next;

assign m_axis_tdata = m_axis_tdata_reg;
assign m_axis_tvalid = m_axis_tvalid_reg;
assign m_axis_tlast = m_axis_tlast_reg;
assign m_axis_tuser = m_axis_tuser_reg;

assign error_bad_frame = error_bad_frame_reg;
assign error_bad_fcs = error_bad_fcs_reg;

rgmii_lfsr #(
    .LFSR_WIDTH(32),
    .LFSR_POLY(32'h4c11db7),
    .LFSR_CONFIG("GALOIS"),
    .LFSR_FEED_FORWARD(0),
    .REVERSE(1),
    .DATA_WIDTH(8),
    .STYLE("AUTO")
)
eth_crc_8 (
    .data_in(gmii_rxd_d4),
    .state_in(crc_state),
    .data_out(),
    .state_out(crc_next)
);

always @* begin
    state_next = STATE_IDLE;

    reset_crc = 1'b0;
    update_crc = 1'b0;

    m_axis_tdata_next = 8'd0;
    m_axis_tvalid_next = 1'b0;
    m_axis_tlast_next = 1'b0;
    m_axis_tuser_next = 1'b0;

    error_bad_frame_next = 1'b0;
    error_bad_fcs_next = 1'b0;
    fcs_next = fcs_reg;
    crc_cnt_next = crc_cnt;

    if (!clk_enable) begin
        // clock disabled - hold state
        state_next = state_reg;
    end else if (mii_select && !mii_odd) begin
        // MII even cycle - hold state
        state_next = state_reg;
    end else begin
        case (state_reg)
            STATE_IDLE: begin
                // idle state - wait for packet
                reset_crc = 1'b1;

                if (gmii_rx_dv_d4 && !gmii_rx_er_d4 && gmii_rxd_d4 == ETH_SFD) begin
                    state_next = STATE_PAYLOAD;
                end else begin
                    state_next = STATE_IDLE;
                end
            end
            STATE_PAYLOAD: begin
                // read payload
                update_crc = 1'b1;

                m_axis_tdata_next = gmii_rxd_d4;
                m_axis_tvalid_next = 1'b1;

                if (gmii_rx_dv_d4 && gmii_rx_er_d4) begin
                    // error
                    m_axis_tlast_next = 1'b1;
                    m_axis_tuser_next = 1'b1;
                    error_bad_frame_next = 1'b1;
                    fcs_next = 32'HDEADBEEF;
                    state_next = STATE_WAIT_LAST;
                end else if (!gmii_rx_dv) begin
                    // end of packet
                    if (gmii_rx_er_d0 || gmii_rx_er_d1 || gmii_rx_er_d2 || gmii_rx_er_d3) begin
                        // error received in FCS bytes
                        m_axis_tuser_next = 1'b1;
                        error_bad_frame_next = 1'b1;
                    end else if ({gmii_rxd_d0, gmii_rxd_d1, gmii_rxd_d2, gmii_rxd_d3} == ~crc_next) begin
                        // FCS good
                        m_axis_tuser_next = 1'b0;
                    end else begin
                        // FCS bad
                        m_axis_tuser_next = 1'b1;
                        error_bad_frame_next = 1'b1;
                        error_bad_fcs_next = 1'b1;
                    end
                    crc_cnt_next = 2'b0;
                    state_next = STATE_CRC;
                end else begin
                    state_next = STATE_PAYLOAD;
                end
            end
            STATE_CRC: begin
                // wait for CRC
                update_crc = 1'b1;

                m_axis_tdata_next = gmii_rxd_d4;
                m_axis_tvalid_next = 1'b1;

                crc_cnt_next = crc_cnt + 1;
                if (&crc_cnt) begin
                    // end of packet + CRC bytes
                    fcs_next = crc_next;
                    m_axis_tlast_next = 1'b1;
                    state_next = STATE_IDLE;
                end else begin
                    fcs_next = 32'b0;
                    state_next = STATE_CRC;
                end
            end
            STATE_WAIT_LAST: begin
                // wait for end of packet

                if (~gmii_rx_dv) begin
                    state_next = STATE_IDLE;
                end else begin
                    state_next = STATE_WAIT_LAST;
                end
            end
            default:;
        endcase
    end
end

always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
        state_reg <= STATE_IDLE;

        m_axis_tvalid_reg <= 1'b0;

        error_bad_frame_reg <= 1'b0;
        error_bad_fcs_reg <= 1'b0;

        fcs_reg <= 32'hFFFFFFFF;
        crc_state <= 32'hFFFFFFFF;
        crc_cnt <= 2'b0;

        mii_locked <= 1'b0;
        mii_odd <= 1'b0;

        gmii_rx_dv_d0 <= 1'b0;
        gmii_rx_dv_d1 <= 1'b0;
        gmii_rx_dv_d2 <= 1'b0;
        gmii_rx_dv_d3 <= 1'b0;
        gmii_rx_dv_d4 <= 1'b0;
    end else begin
        state_reg <= state_next;

        m_axis_tvalid_reg <= m_axis_tvalid_next;

        error_bad_frame_reg <= error_bad_frame_next;
        error_bad_fcs_reg <= error_bad_fcs_next;

        fcs_reg <= fcs_next;
        crc_cnt <= crc_cnt_next;
        // datapath
        if (reset_crc) begin
            crc_state <= 32'hFFFFFFFF;
        end else if (update_crc) begin
            crc_state <= crc_next;
        end

        if (clk_enable) begin
            if (mii_select) begin
                mii_odd <= !mii_odd;

                if (mii_locked) begin
                    mii_locked <= gmii_rx_dv;
                end else if (gmii_rx_dv && {gmii_rxd[3:0], gmii_rxd_d0[7:4]} == ETH_SFD) begin
                    mii_locked <= 1'b1;
                    mii_odd <= 1'b1;
                end

                if (mii_odd) begin
                    gmii_rx_dv_d0 <= gmii_rx_dv & gmii_rx_dv_d0;
                    gmii_rx_dv_d1 <= gmii_rx_dv_d0 & gmii_rx_dv;
                    gmii_rx_dv_d2 <= gmii_rx_dv_d1 & gmii_rx_dv;
                    gmii_rx_dv_d3 <= gmii_rx_dv_d2 & gmii_rx_dv;
                    gmii_rx_dv_d4 <= gmii_rx_dv_d3 & gmii_rx_dv;
                end else begin
                    gmii_rx_dv_d0 <= gmii_rx_dv;
                end
            end else begin
                gmii_rx_dv_d0 <= gmii_rx_dv;
                gmii_rx_dv_d1 <= gmii_rx_dv_d0 & gmii_rx_dv;
                gmii_rx_dv_d2 <= gmii_rx_dv_d1 & gmii_rx_dv;
                gmii_rx_dv_d3 <= gmii_rx_dv_d2 & gmii_rx_dv;
                gmii_rx_dv_d4 <= gmii_rx_dv_d3 & gmii_rx_dv;
            end
        end
    end
end

always_ff @(posedge clk) begin
    // delay input
    if (clk_enable) begin
        if (mii_select) begin
            gmii_rxd_d0 <= {gmii_rxd[3:0], gmii_rxd_d0[7:4]};

            if (mii_odd) begin
                gmii_rxd_d1 <= gmii_rxd_d0;
                gmii_rxd_d2 <= gmii_rxd_d1;
                gmii_rxd_d3 <= gmii_rxd_d2;
                gmii_rxd_d4 <= gmii_rxd_d3;

                gmii_rx_er_d0 <= gmii_rx_er | gmii_rx_er_d0;
                gmii_rx_er_d1 <= gmii_rx_er_d0;
                gmii_rx_er_d2 <= gmii_rx_er_d1;
                gmii_rx_er_d3 <= gmii_rx_er_d2;
                gmii_rx_er_d4 <= gmii_rx_er_d3;
            end else begin
                gmii_rx_er_d0 <= gmii_rx_er;
            end
        end else begin
            gmii_rxd_d0 <= gmii_rxd;
            gmii_rxd_d1 <= gmii_rxd_d0;
            gmii_rxd_d2 <= gmii_rxd_d1;
            gmii_rxd_d3 <= gmii_rxd_d2;
            gmii_rxd_d4 <= gmii_rxd_d3;

            gmii_rx_er_d0 <= gmii_rx_er;
            gmii_rx_er_d1 <= gmii_rx_er_d0;
            gmii_rx_er_d2 <= gmii_rx_er_d1;
            gmii_rx_er_d3 <= gmii_rx_er_d2;
            gmii_rx_er_d4 <= gmii_rx_er_d3;
        end
        m_axis_tdata_reg <= m_axis_tdata_next;
        m_axis_tlast_reg <= m_axis_tlast_next;
        m_axis_tuser_reg <= m_axis_tuser_next;
    end else begin
        m_axis_tdata_reg <= m_axis_tdata_next;
        m_axis_tlast_reg <= m_axis_tlast_next;
        m_axis_tuser_reg <= m_axis_tuser_next;
    end
end

endmodule

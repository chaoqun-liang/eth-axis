
module mem_wrap_rx
   (
    input logic         clkA,
    input logic         clkB,
    input logic         weB,
    input logic         enaA,
    input logic         enaB,
    input logic [8:0]   addrA,
    input logic [10:0]  addrB,
    input logic [7:0]   diB, // port B is write only
   
    output logic [31:0] doA // port A is read only
    );

   logic                cenB; //chip enable port B
   logic                cenA; //chip enable port A
   //logic enB;

   logic [31:0]         bw;
   logic [31:0]         write_data;

   assign cenB = ~(weB & enaB); // enable write
   assign cenA = ~enaA;         // enable read
   //assign enB = (weB & enaB);
   
   always_comb begin
      if(weB & enaB) begin
         case(addrB[1:0])
           0: begin
              bw=4'b0001;
              write_data = {24'h000000, diB};
           end
           
           1: begin
              bw=4'b0010;
              write_data = {16'h0000, diB, 8'h00};
           end
           2: begin
              bw=4'b0100;
              write_data = {8'h00, diB, 16'h0000};
           end
           3: begin
              bw=4'b1000;
              write_data = {diB, 24'h000000};
           end
           
         endcase // case (addrB[1:0])
      end
   end
   
   `ifdef TARGET_GF22

   always_comb begin
      if(weB & enaB) begin
         case(addrB[1:0])
           0: begin
              bw=32'h000000FF;
              write_data = {24'h000000, diB};
           end
           
           1: begin
              bw=32'h0000FF00;
              write_data = {16'h0000, diB, 8'h00};
           end
           2: begin
              bw=32'h00FF0000;
              write_data = {8'h00, diB, 16'h0000};
           end
           3: begin
              bw=32'hFF000000;
              write_data = {diB, 24'h000000};
           end
           
         endcase // case (addrB[1:0])
      end
   end
   
   IN22FDX_R2PV_WFVG_W00512B032M04C128 GF22_inst
     (
      .CLK_A(clkA),        // Clock Input for READ Port
      .CLK_B(clkB),        // Clock Input for WRITE Port
      .CEN_A(cenA),        // Port-A chip enable (active low)
      .CEN_B(cenB),        // Port-B chip enable (active low)
      .DEEPSLEEP(1'b0),    
      .POWERGATE(1'b0),   
      .AW_A(addrA[8:2]),   // [6:0] Port-A Address Word line inputs
      .AC_A(addrA[1:0]),   // [1:0] Port-A Address Column inputs 
      .AW_B(addrB[10:4]),  // [6:0] Port-B Address Word line inputs 
      .AC_B(addrB[3:2]),   // [1:0] Port-B Address Column inputs 
      .D(write_data),             // [31:0] Port-B Data Inputs during write operation 
      .BW(bw),             // [31:0] Port-B Bit Write Input to enable independent data bit write 
      .T_LOGIC(1'b0),      
      .MA_SAWL(1'b0),  
      .MA_WL(1'b0),    
      .MA_WRAS(1'b0), 
      .MA_WRASD(1'b0), 
      .MA_TPA(1'b0),  
      .MA_TPB(1'b0),  
      .RWE(),          
      .RWFA(),         
      .Q(doA),             // [31:0] Port-A Data Output pins
      .OBSV_DBW(),     
      .OBSV_CTL_A(),   
      .OBSV_CTL_B()    
      );

   `else
// your code
   simple_dual_two_clocks simple_inst
     (
      .clkA(clkA),
      .enaA(enaA),
      .weA(4'b0000),
      .addrA(addrA[8:0]),
      .dinA(32'h00000000), //metto a 0
      .doutA(doA),
      .clkB(clkB),
      .enaB(enaB),
      .weB(bw),
      .addrB(addrB[10:2]),
      .dinB(write_data),
      .doutB()
      );
   `endif   
 
endmodule // mem_wrap_rx

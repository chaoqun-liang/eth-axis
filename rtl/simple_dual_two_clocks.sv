module simple_dual_two_clocks(
   input clka,
   input clkb,
   input ena,
   input enb,
   input wea,
   input [8:0] addra,
   input [8:0] addrb,
   input [31:0] da_i,
   output [31:0] db_o
   );
   logic [15:0] ram [511:0];
   //reg [15:0] dob;

   always_ff @(posedge clka)begin
      if (ena) begin
         if (wea)
            ram[addra] <= da_i;
      end
   end

   always_ff @(posedge clkb)begin
      if (enb) begin
         db_o <= ram[addrb];
      end
   end

endmodule
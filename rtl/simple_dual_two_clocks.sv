module simple_dual_two_clocks 
   #(
      parameter WIDTH = 512
   )
   (
   input logic clka,
   input logic clkb,
   input logic ena,
   input logic enb,
   input logic  wea,
   input logic [8:0] addra,
   input logic [8:0] addrb,
   input logic [31:0] da_i,
   output logic [31:0] db_o
   );
   
   logic [31:0] ram [WIDTH-1:0];

   //reg [15:0] dob;


   always_ff @(posedge clka)begin

      if (ena) begin
         if (wea)
            ram[addra] <= da_i;
      end
   end

   always_ff @(posedge clkb)begin
      if (enb) begin
         db_o <= ram [addrb];
      end
   end

endmodule

module Block_RAM
   (
    input logic        clkA_i,
    input logic        clkB_i,
    input logic        weB_i,
    input logic        enaA_i,
    input logic        enaB_i,
    input logic [9:0] addrA_i,
    input logic [9:0]  addrB_i,
    input logic [15:0] dB_i // port B is write only
    
    output logic [15:0] dA_o // port A is read only
   );

   logic [15:0] ram [1023:0];

always_ff @(posedge clkA_i) begin
   if (enaA_i) begin
      if (weB_i)
         ram[addrA] <= dB_i;
   end
end

always_ff @(posedge clkB_i) begin
   if (enaB_i) begin
   dA_o <= ram[addrB_i];
   end
end
   
   
endmodule // Block_RAM_wrap_tx

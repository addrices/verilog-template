module adder(
  input clk,
  input [7:0] a,
  input [7:0] b,
  output reg [7:0] c
);

always @(posedge clk) begin
  c <= a + b;
end

endmodule
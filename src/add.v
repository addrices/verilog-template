module adder(
  input clk,
  input [7:0] a,
  input [7:0] b,
  output reg [7:0] c
);
reg [8*8:1] aa;
initial begin
  if ($test$plusargs("trace") != 0)  begin
      $display("[%0t] Tracing to logs/vlt_dump.vcd...\n", $time);
      $dumpfile("logs/vlt_dump.vcd");
      $dumpvars();
  end
  if($value$plusargs("TEST=%s", aa))
    $display("value was %s", aa);
  else 
    $display("+TEST= not found");
  $display("[%0t] Model running...\n", $time);
end

always @(posedge clk) begin
  c <= a + b;
end

endmodule
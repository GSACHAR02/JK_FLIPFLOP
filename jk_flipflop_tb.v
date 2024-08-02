module jk_flipflop_tb();

  reg [1:0] j;
  reg clk;
  reg reset;
  wire [1:0] qn;

  // Instantiate the DUT (Device Under Test)
  jk_flipflop dut (
    .j(j),
    .clk(clk),
    .reset(reset),
    .qn(qn)
  );
  // Stimulus generation
  initial begin
    // Initialize reset
    reset = 1;
    #5 reset = 0; 
  end
 // Clock generation
  initial begin
    clk = 0;
    forever #10 clk = ~clk; 
  end
  initial
    begin
    #10 j = 2'b00; 
    #20 j = 2'b01; 
    #40 j = 2'b10; 
    #60 j = 2'b11; 

  end

endmodule

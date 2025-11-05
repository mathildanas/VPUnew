module testbench;
  // declare DUT signals
  logic signed [31:0] a;
  logic signed [31:0] b;
  logic signed [31:0] c;
  
  // instantiate DUT
  multiplier dut(
    .a(a),
    .b(b),
    .c(c)
  );
  
  // input signals
  initial begin
    a = 32'sh00000000;
    b = 32'sh00000001;
    #5;
    a = 32'sh00000001;
    b = 32'sh00000002;
    
    #5;
    a = 32'shFFFFFFFF;
    b = 32'sh00000002;
    
    #5;
    a = 32'shFFFFFFFF;
    b = 32'shFFFFFFFE;
    
    #5
    $finish;
  end
  
  // waveform
  initial begin
    $dumpfile ("wave.vcd"); // output file
    $dumpvars(0, testbench); // record all signals in module
  end
endmodule
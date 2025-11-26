// 32 bit signed integer multiplier

module multiplier (
  input  wire signed [31:0] a,  
  input  wire signed [31:0] b, 
  output wire signed [31:0] c   // 64 bit for overflow--i forgot what we decided upon last meeting for this scenario
);
  assign c = a * b;
endmodule
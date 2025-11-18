module cu (
  input [257:0] in,
  output reg [1:0] op,
  output reg [127:0] v1,
  output reg [127:0] v2
);
 
  always @(*) begin
    op[1:0] = in[257:256];
    v1[127:0] = in[255:128];
    v2[127:0] = in[127:0];
  end
endmodule
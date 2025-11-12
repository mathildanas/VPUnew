module testtwoscomp;
  reg [32:0] A;
  reg [32:0] B;
  reg a;
  wire [31:0] A_out;
  wire [31:0] B_out;
  wire [1:0] c;
  
  adderCU uut(
    .A(A),
    .B(B),
    .a(a),
    .A_out(A_out),
    .B_out(B_out),
    .c(c)
  );
  
  initial begin
  
    for (integer i = 0; i < 8; i = i + 1) begin
      {A[32], B[32], a} = i;
      #1;
      
      $display("As= %b, Bs= %b, a= %b, Ac= %b, Bc= %b", 
               A[32], B[32], a, c[1], c[0]);
    end
    $finish;
  end
endmodule

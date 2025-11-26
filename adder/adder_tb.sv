
module testdesign;

  reg [31:0] A;
  reg [31:0] B;
  reg Cin;

  wire [31:0] Sum; 
  wire Cout;
 
  thirty2bit uut (
    .Cin(Cin),
    .X(A),
    .Y(B),
    .Sum(Sum),
    .Cout(Cout)
  );
    
  initial begin
    Cin =$urandom %2; 
    A = $urandom;
    B = $urandom;

    #5; 

    $display("A = %d", A);
    $display("B = %d", B);
    $display("Cin = %d", Cin);
    $display("A+B = %d", Sum);
    $display("Cout = %d", Cout);
    
    $finish;
  end
endmodule

module onebitadd (
    input  wire A,
    input  wire B,
    input  wire Cin,
    output wire D,
    output wire Cout
);
    assign D = A ^ B ^ Cin;
    assign Cout = (A & B) | (B & Cin) | (A & Cin);
endmodule

module thirty2bit (
    input  wire Cin,
    input  wire [31:0] X,
    input  wire [31:0] Y,
    output wire [31:0] Sum,
    output wire Cout
);
    wire [32:0] carry;
    assign carry[0] = Cin;

    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : name4syntax
            onebitadd add (
                .A(X[i]),
                .B(Y[i]),
                .Cin(carry[i]),
                .D(Sum[i]),
                .Cout(carry[i+1])
            );
        end
    endgenerate

    assign Cout = carry[32];
endmodule

module adderCU (
    input  wire [32:0] A,
    input  wire [32:0] B,
    input  wire a,
    output wire [31:0] A_out,
  output wire [31:0] B_out,
  output wire [1:0] c // LINE JUST FOR TESTBENCH. CAN BE REMOVED FOR FINAL PRODUCT. It's just because I wanted to test the Ac and Bc outputs, based on the truth tables to simplify the verification process.
);
   
    wire As = A[32];
    wire Bs = B[32];

    wire Ac = As;          
    wire Bc = Bs ^ a;  

  assign A_out = (Ac) ? (~A[31:0] + 1) : A[31:0];
  assign B_out = (Bc) ? (~B[31:0] + 1) : B[31:0];
  assign c[1]= Ac;// LINE JUST FOR TESTBENCH.
  assign c[0]= Bc;// LINE JUST FOR TESTBENCH. 
endmodule

  
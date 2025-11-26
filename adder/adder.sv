module onebitadd (
    input  wire A,
    input  wire B,
    input  wire Cin,
    output wire D,
    output wire Cout
);
    assign D    = A ^ B ^ Cin;
    assign Cout = (A & B) | (B & Cin) | (A & Cin);
endmodule

module thirty2bit (
    input  wire        Cin,
    input  wire [31:0] X,
    input  wire [31:0] Y,
    output wire [31:0] Sum,
    output wire        Cout
);
    wire [32:0] carry;
    assign carry[0] = Cin;

    genvar i;
    generate
      for (i = 0; i < 32; i=i+1) 
          begin:name4syntax
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


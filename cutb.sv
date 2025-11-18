`timescale 1ns / 1ps

module cu_tb;

  reg [257:0] in;
  wire [1:0] op;
  wire [127:0] v1;
  wire [127:0] v2;

  cu uut (
    .in(in),
    .op(op),
    .v1(v1),
    .v2(v2)
  );

  initial begin
    $display("Time\t\tin[257:256]\top\tv1\t\t\tv2");
    $monitor("%0dns\t%b\t\t%b\t%h\t%h", $time, in[257:256], op, v1, v2);

    in = {2'b00, 128'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA, 128'hBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB};
    #10;

    in = {2'b01, 128'h11111111111111111111111111111111, 128'h22222222222222222222222222222222};
    #10;

    in = {2'b10, 128'hDEADBEEFDEADBEEFDEADBEEFDEADBEEF, 128'hFEEDFACEFEEDFACEFEEDFACEFEEDFACE};
    #10;

    in = {2'b11, 128'h0123456789ABCDEF0123456789ABCDEF, 128'hFEDCBA9876543210FEDCBA9876543210};
    #10;

    $finish;
  end

endmodule

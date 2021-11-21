`timescale 1ns / 1ps

module tb_evm();
    reg clk;
    reg rst;
    reg mode;
    reg cand1;
    reg cand2;
    reg cand3;
    reg cand4;
    wire [9:0] result;

    initial clk =1'b0;
    always 
        #5 clk = ~clk;
    initial #500000 $finish;

    votingMachine vM1(
    .clk(clk),
    .rst(rst),
    .mode(mode),
    .cand1(cand1),
    .cand2(cand2),
    .cand3(cand3),
    .cand4(cand4),
    .result(result)
    );

    // localparam CLK_PERIOD = 10;
    // always #(CLK_PERIOD/2) clk=~clk;

    initial begin
        $dumpfile("tb_evm.vcd");
        $dumpvars(0, tb_evm);
    end

    initial begin
        rst = 1;
        mode = 0;
        cand1 = 1'b1;
        cand2 = 1'b0;
        cand3 = 1'b0;
        cand4 = 1'b0;
        #10100
        $display("%b", result);
        $display("Input : %b%b%b%b",cand1, cand2, cand3, cand4);

        #100
        rst = 0;
        mode = 0;
        cand1 = 1'b1;
        cand2 = 1'b0;
        cand3 = 1'b0;
        cand4 = 1'b0;
        #10100
        $display("%b", result);
        $display("Input : %b%b%b%b",cand1, cand2, cand3, cand4);

        #100
        rst = 0;
        mode = 0;
        cand1 = 1'b1;
        cand2 = 1'b0;
        cand3 = 1'b0;
        cand4 = 1'b0;
        #10100
        $display("%b", result);
        $display("Input : %b%b%b%b",cand1, cand2, cand3, cand4);

        #100
        rst = 0;
        mode = 0;
        cand1 = 1'b0;
        cand2 = 1'b0;
        cand3 = 1'b0;
        cand4 = 1'b1;
        #10100
        $display("%b", result);
        $display("Input : %b%b%b%b",cand1, cand2, cand3, cand4);

        #100
        rst = 0;
        mode = 0;
        cand1 = 1'b1;
        cand2 = 1'b0;
        cand3 = 1'b0;
        cand4 = 1'b0;
        #10100
        $display("%b", result);
        $display("Input : %b%b%b%b",cand1, cand2, cand3, cand4);

        #100
        rst = 0;
        mode = 0;
        cand1 = 1'b0;
        cand2 = 1'b1;
        cand3 = 1'b0;
        cand4 = 1'b0;
        #10100
        $display("%b", result);
        $display("Input : %b%b%b%b",cand1, cand2, cand3, cand4);

        #100
        rst = 0;
        mode = 0;
        cand1 = 1'b0;
        cand2 = 1'b0;
        cand3 = 1'b1;
        cand4 = 1'b0;
        #10100
        $display("%b", result);
        $display("Input : %b%b%b%b",cand1, cand2, cand3, cand4);

        #100
        rst = 0;
        mode = 0;
        cand1 = 1'b0;
        cand2 = 1'b0;
        cand3 = 1'b0;
        cand4 = 1'b1;
        #10100
        $display("%b", result);
        $display("Input : %b%b%b%b",cand1, cand2, cand3, cand4);

        #100
        rst = 0;
        mode = 0;
        cand1 = 1'b1;
        cand2 = 1'b0;
        cand3 = 1'b0;
        cand4 = 1'b0;
        #10100
        $display("%b", result);
        $display("Input : %b%b%b%b",cand1, cand2, cand3, cand4);

        #100
        rst = 0;
        mode = 0;
        cand1 = 1'b0;
        cand2 = 1'b1;
        cand3 = 1'b0;
        cand4 = 1'b0;
        #10100
        $display("%b", result);
        $display("Input : %b%b%b%b",cand1, cand2, cand3, cand4);

        #100
        rst = 0;
        mode = 0;
        cand1 = 1'b0;
        cand2 = 1'b0;
        cand3 = 1'b1;
        cand4 = 1'b0;
        #10100
        $display("%b", result);
        $display("Input : %b%b%b%b",cand1, cand2, cand3, cand4);

        #100
        rst = 0;
        mode = 0;
        cand1 = 1'b0;
        cand2 = 1'b0;
        cand3 = 1'b0;
        cand4 = 1'b1;
        #10100
        $display("%b", result);
        $display("Input : %b%b%b%b",cand1, cand2, cand3, cand4);

        #100
        $display("---------------------------------------------");
        #100

        rst = 0;
        mode = 1;
        cand1 = 1'b1;
        cand2 = 1'b0;
        cand3 = 1'b0;
        cand4 = 1'b0;
        #10100
        $display("%b", result);
        $display("Input : %b%b%b%b",cand1, cand2, cand3, cand4);

        #100
        rst = 0;
        mode = 1;
        cand1 = 1'b0;
        cand2 = 1'b1;
        cand3 = 1'b0;
        cand4 = 1'b0;
        #10100
        $display("%b", result);
        $display("Input : %b%b%b%b",cand1, cand2, cand3, cand4);

        #100
        rst = 0;
        mode = 1;
        cand1 = 1'b0;
        cand2 = 1'b1;
        cand3 = 1'b0;
        cand4 = 1'b0;
        #10100
        $display("%b", result);
        $display("Input : %b%b%b%b",cand1, cand2, cand3, cand4);

        #100
        rst = 0;
        mode = 1;
        cand1 = 1'b0;
        cand2 = 1'b0;
        cand3 = 1'b0;
        cand4 = 1'b1;
        #10100
        $display("%b", result);
        $display("Input : %b%b%b%b",cand1, cand2, cand3, cand4);
  end



endmodule

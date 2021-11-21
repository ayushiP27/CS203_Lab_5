`timescale 1ns / 1ps

//The main module which will tie all the submodules to perform the task at hand.
module votingMachine(
input clk,
input rst,
input mode,
input cand1,
input cand2,
input cand3,
input cand4,
output [9:0] result
);

wire valVote1_wire;
wire valVote2_wire;
wire valVote3_wire;
wire valVote4_wire;

wire [9:0] cand1Votes_wire;
wire [9:0] cand2Votes_wire;
wire [9:0] cand3Votes_wire;
wire [9:0] cand4Votes_wire;

wire validVote;

assign validVote = valVote1_wire|valVote2_wire|valVote3_wire|valVote4_wire;

buttonDebouncer BD1(
.clk(clk),
.rst(rst),
.button(cand1),
.valVote(valVote1_wire)
);

buttonDebouncer BD2(
.clk(clk),
.rst(rst),
.button(cand2),
.valVote(valVote2_wire)
);

buttonDebouncer BD3(
.clk(clk),
.rst(rst),
.button(cand3),
.valVote(valVote3_wire)
);

buttonDebouncer BD4(
.clk(clk),
.rst(rst),
.button(cand4),
.valVote(valVote4_wire)
);

voteCounter VC1(
.clk(clk),
.rst(rst),
.mode(mode),
.cand1Val(valVote1_wire),
.cand2Val(valVote2_wire),
.cand3Val(valVote3_wire),
.cand4Val(valVote4_wire),
.cand1Votes(cand1Votes_wire),
.cand2Votes(cand2Votes_wire),
.cand3Votes(cand3Votes_wire),
.cand4Votes(cand4Votes_wire)
);

mode M1(
.clk(clk),
.rst(rst),
.mode(mode),
.valVote(validVote),
.cand1Votes(cand1Votes_wire),
.cand2Votes(cand2Votes_wire),
.cand3Votes(cand3Votes_wire),
.cand4Votes(cand4Votes_wire),
.candidate1(valVote1_wire),
.candidate2(valVote2_wire),
.candidate3(valVote3_wire),
.candidate4(valVote4_wire),
.noOfVotes(result)
);

endmodule

//This is to register the votes properly, to remove ambiguity as to if a button was pressed or not.
module buttonDebouncer(
input clk,
input rst,
input button,
output reg valVote
);
reg [9:0] counter;

always @(posedge clk)
begin
    if(rst)
        counter <= 0;
    else
    begin
        if(button & counter < 1001)
            counter <= counter + 1;
        else if(!button)
            counter <= 0;
    end
end


always @(posedge clk)
begin
    if(rst)
        valVote <= 1'b0;
    else
    begin
        if(counter == 1000)
            valVote <= 1'b1;
        else
            valVote <= 1'b0;
    end
end

endmodule

//This module will keep a count of the votes.
module voteCounter(
input clk,
input rst,
input mode,
input cand1Val,
input cand2Val,
input cand3Val,
input cand4Val,
output reg [9:0] cand1Votes,
output reg [9:0] cand2Votes,
output reg [9:0] cand3Votes,
output reg [9:0] cand4Votes
);

always @(posedge clk)
begin
    if(rst == 1)
    begin
        cand1Votes <= 0;
        cand2Votes <= 0;
        cand3Votes <= 0;
        cand4Votes <= 0;
    end
    else
    begin
        if(cand1Val & (mode==0))
            cand1Votes <= cand1Votes + 1;
        else if(cand2Val & (mode==0))
            cand2Votes <= cand2Votes + 1;
        else if(cand3Val & (mode==0))
            cand3Votes <= cand3Votes + 1;
        else if(cand4Val & (mode==0))
            cand4Votes <= cand4Votes + 1;
    end
end

endmodule

//The module will control whether the votes are to be casted, or displayed.
module mode(
input clk,
input rst,
input mode,
input valVote,
input [9:0] cand1Votes,
input [9:0] cand2Votes,
input [9:0] cand3Votes,
input [9:0] cand4Votes,
input candidate1,
input candidate2,
input candidate3,
input candidate4,
output reg [9:0] noOfVotes
);

reg [30:0] counter;

always @(posedge clk)
begin
    if(rst)
        counter <= 0;  
    else if(valVote) 
        counter <= counter + 1;
    else if(counter !=0 & counter < 1000)
        counter <= counter + 1;
    else 
        counter <= 0;
end 

always @(posedge clk)
begin
  if(rst)
        noOfVotes <= 10'd0;
    else
    begin
        if(mode == 0 & counter > 0 ) 
            noOfVotes <= 10'd1023;
        else if(mode == 0)
            noOfVotes <= 10'd0;
        else if(mode == 1)
        begin
            if(candidate1)
                noOfVotes <= cand1Votes;
            else if(candidate2)
                noOfVotes <= cand2Votes;
            else if(candidate3)
                noOfVotes <= cand3Votes;
            else if(candidate4)
                noOfVotes <= cand4Votes;
        end
    end  
end


endmodule


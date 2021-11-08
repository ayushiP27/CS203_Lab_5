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

//This is to register the votes properly, to remove ambiguity as to if a button was pressed or not.
module buttonDebouncer(
input clk,
input rst,
input button,
output reg valVote
);

//This module will keep a count of the votes.
module voteCounter(
input clk,
input rst,
input mode,
input cand1Val,
input cand2Val,
input cand3Val,
input cand4Val,
output reg [7:0] cand1Votes,
output reg [7:0] cand2Votes,
output reg [7:0] cand3Votes,
output reg [7:0] cand4Votes
);

//The module will control whether the votes are to be casted, or displayed.
module mode(
input clock,
input reset,
input mode,
input valid_vote_casted,
input [7:0] cand1Votes,
input [7:0] cand2Votes,
input [7:0] cand3Votes,
input [7:0] cand4Votes,
input candidate1,
input candidate2,
input candidate3,
input candidate4,
output reg [7:0] noOfVotes
);


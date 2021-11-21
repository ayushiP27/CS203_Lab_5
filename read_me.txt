Course - CS203 Digital Logic Design 
Course Instructor - Dr. Neeraj Goel 

TITLE OF PROJECT - VOTING MACHINE FOR STUDENT COUNCIL ELECTIONS

Team Members - Armaan Umesh Sharma (2020CSB1039) , Ayushi Patel (2020CSB1080)

We have implemented the proposed idea successfully in Verilog. 

In our voting machine, we have 2 modes - 

The first mode is the voting mode in which we can press a button and vote for candidates. 
In another mode, the machine will display the vote gathered by a candidate whose button is pressed. 

We also have a reset option that will be used after each election. It will erase all the pre-existing data from the machine.

The machine has been designed particularly for four candidates. We have four different buttons for each candidate. 

IMPLEMENTATION - 

We have the following inputs -
Reset (rst)
Clock (clk)
Mode (mode)
Candidate 1 (cand1)
Candidate 2 (cand2)
Candidate 3 (cand3)
Candidate 4 (cand4)

When mode = 0, we have a voting mote in which we can poll votes, and when mode = 1, we have counting mode which will give the number of votes gained by each candidate. 

Similarly, when rst = 1, the machine will erase all data. 


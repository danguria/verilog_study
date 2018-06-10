`include "addbit.v"
module adder_hier (
  result,   // Output of the adder     
  carry,    // Carry output of adder
  r1,       // First input
  r2,       // Second input
  ci
);          // Carry input

// Input port
input wire [3:0]  r1;
input wire [3:0]  r2;
input wire        ci;

// Output port
output  wire [3:0]  result;
output  wire        carry;

// Internal variables
wire  c1;
wire  c2;
wire  c3;

// Code starts here
addbit u0 (.a(r1[0]), .b(r2[0]), .ci(ci), .sum(result[0]), .co(c1));
addbit u1 (.a(r1[1]), .b(r2[1]), .ci(c1), .sum(result[1]), .co(c2));
addbit u2 (.a(r1[2]), .b(r2[2]), .ci(c2), .sum(result[2]), .co(c3));
addbit u3 (.a(r1[3]), .b(r2[3]), .ci(c3), .sum(result[3]), .co(carry));
endmodule

module tb();


reg   [3:0]   r1, r2;
reg           ci;
wire  [3:0]   result;
wire          carry;

// Drive the inputs
initial begin
  r1 = 0;
  r2 = 0;
  ci = 0;

  #10 r1 = 10;
  #10 r2 = 2;
  #10 ci = 1;
  #10 $display("+-----------------------------------+");
  $finish;
end

// Connect the lower module
adder_hier U (.result(result), .carry(carry), .r1(r1), .r2(r2), .ci(ci));

// Hier demo here
initial begin
  $display("+--------------------------------------------------------+");
  $display("|  r1  | r2   | ci   | u0.sum | u1.sum | u2.sum | u3.sum |");
  $display("+--------------------------------------------------------+");
  $monitor("|  %h   |  %h   |  %h   |    %h    |   %h   |   %h    |   %h    |",
  r1, r2, ci, tb.U.u0.sum, tb.U.u1.sum, tb.U.u2.sum, tb.U.u3.sum);
end


endmodule

//--------------------------------------
// This is my second Verilog Design
// Design Name: first_counter
// File Name : first_counter.v
// Function : This is a 4bit up-couter with
// Synchronous active high reset and 
// with activ high enable signal
//--------------------------------------
module first_counter (
    clock,  // clock input of the design
    reset,  // active high, synchronous Reset input
    enable, // Active high enable signal for counter
    counter_out // 4 bit vector output of the counter
);

// Input ports
// Input ports data type
// By rule, all the input ports should be wires
input wire clock;
input wire reset;
input wire enable;

// Output ports
// Output ports data type
// It can be a storage (reg) or a wire
output reg [3:0] counter_out;

// Code starts here
// Since this counter is a positive edge trigged one,
// We trigger the below block with respect to positive
// endge of the clock.
always @(posedge clock)
begin : COUNTER // Block name
// At every rising edge of clock, we check if reset is active.
    // If active, we load the counter output with 4'b0000.
    if (reset == 1'b1) begin
        counter_out <= #1 4'b0000;
    end
    else if (enable == 1'b1) begin
        counter_out <= #1 counter_out + 1;
    end
end // End of the block COUNTER
endmodule

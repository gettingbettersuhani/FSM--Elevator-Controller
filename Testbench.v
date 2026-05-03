`timescale 1ns/1ps

module elevator_fsm_tb;

reg clk, reset;
reg [1:0] current_floor;
reg [1:0] request_floor;
wire door_open;
wire direction;
wire [1:0] state;

// DUT Instantiation
elevator_fsm dut (
    .clk(clk),
    .reset(reset),
    .current_floor(current_floor),
    .request_floor(request_floor),
    .door_open(door_open),
    .direction(direction),
    .state(state)
);
always #5 clk = ~clk;

initial begin

    clk = 0;
    reset = 1;
    current_floor = 2'b00;
    request_floor = 2'b00;

    #10 reset = 0;

    // Move UP
    request_floor = 2'b11;
    #10 current_floor = 2'b01;
    #10 current_floor = 2'b10;
    #10 current_floor = 2'b11;

    // Move DOWN 
    #10 request_floor = 2'b01;
    #10 current_floor = 2'b10;
    #10 current_floor = 2'b01;

    // Same floor 
    #10 request_floor = 2'b01;

    #20 $finish;
end

initial begin
    $monitor("Time=%0t | State=%b | Curr=%b | Req=%b | Dir=%b | Door=%b",
              $time, state, current_floor, request_floor, direction, door_open);
end

endmodule

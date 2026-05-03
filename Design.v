`timescale 1ns/1ps

module elevator_fsm (
    input clk,
    input reset,
    input [1:0] current_floor,
    input [1:0] request_floor,
    output reg door_open,
    output reg direction,   // 1 = up, 0 = down
    output reg [1:0] state
);

// State Encoding
parameter IDLE        = 2'b00,
          MOVING_UP   = 2'b01,
          MOVING_DOWN = 2'b10,
          DOOR_OPEN   = 2'b11;

reg [1:0] next_state;

// State Register
always @(posedge clk or posedge reset) begin
    if (reset)
        state <= IDLE;
    else
        state <= next_state;
end

// Next State Logic 
always @(*) begin
    case (state)

        IDLE: begin
            if (request_floor > current_floor)
                next_state = MOVING_UP;
            else if (request_floor < current_floor)
                next_state = MOVING_DOWN;
            else
                next_state = DOOR_OPEN;
        end

        MOVING_UP: begin
            if (current_floor == request_floor)
                next_state = DOOR_OPEN;
            else
                next_state = MOVING_UP;
        end

        MOVING_DOWN: begin
            if (current_floor == request_floor)
                next_state = DOOR_OPEN;
            else
                next_state = MOVING_DOWN;
        end

        DOOR_OPEN: begin
            next_state = IDLE;  // Auto close and go idle
        end

        default: next_state = IDLE;

    endcase
end

// Output Logic 
always @(*) begin
    // Default values
    door_open = 0;
    direction = 0;

    case (state)

        IDLE: begin
            door_open = 0;
        end

        MOVING_UP: begin
            direction = 1;
            door_open = 0;
        end

        MOVING_DOWN: begin
            direction = 0;
            door_open = 0;
        end

        DOOR_OPEN: begin
            door_open = 1;
        end

    endcase
end

endmodule

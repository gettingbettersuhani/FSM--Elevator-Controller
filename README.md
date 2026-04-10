# FSM--Elevator-Controller


📌 Project Overview

This project implements an Elevator Controller using a Finite State Machine (FSM) in Verilog HDL.

The system simulates the behavior of a real elevator, handling floor requests, movement (up/down), and door operations in a structured and sequential manner.

It demonstrates how FSM-based design can efficiently manage complex control systems in digital hardware.

⚙️ Features

FSM-based elevator control system
Handles multiple floor requests
Supports up and down movement logic
Controls door open and close operations
Fully verified through simulation


🧠 Design Approach

FSM States
Idle → Waiting for request
Move Up → Elevator moving upwards
Move Down → Elevator moving downwards
Door Open → Opening doors at target floor
Door Close → Closing doors before next operation
FSM Type
Implemented using a Moore FSM
Outputs depend only on the current state
Operation Flow
Elevator starts in Idle state
Receives floor request
Determines direction (Up/Down)
Moves towards target floor
Opens door on reaching destination
Closes door and returns to Idle or next request


💡 Technical Insight

FSM helps manage multiple conditions like direction, requests, and current floor efficiently
Moore FSM ensures stable and glitch-free outputs
Proper state design improves scalability for multi-floor systems
🧪 Verification


Designed a testbench to simulate:
Upward and downward movement
Multiple floor requests
Door open/close behavior
Verified correct operation using waveform simulation in Vivado


🛠 Tools Used

Verilog HDL
Xilinx Vivado (Simulation & Synthesis)


🎯 Learning Outcomes

Strong understanding of complex FSM design
Hands-on experience with sequential control systems
Ability to model real-world systems in RTL
Improved debugging and verification skills


🚀 Future Improvements

Support for multiple simultaneous requests (queue system)
Add priority scheduling algorithm
Integrate display (7-segment/LCD)
FPGA hardware implementation

## SESSION 07 – SEQUENTIAL LOGIC PRACTICE & 8-BIT COUNTER DESIGN

This session reinforced sequential logic design through practical exercises involving simulation timing, race conditions, multi-bit flip-flops, and counter implementation. I learned how testbench stimulus timing can affect simulation results and why input signals should be driven slightly after the active clock edge to avoid race conditions. The main design exercise focused on building and verifying an 8-bit up-counter with asynchronous active-low reset and overflow detection.

### My Exercises

- Simulation race-condition analysis
- Multi-bit flip-flop practice
- Single D Flip-Flop module
- Modularized 8-bit Up Counter
- Counter overflow detection
- Counter wrap-around verification
- Simulation and waveform analysis

### What I Practiced

- Understanding race conditions between the DUT and testbench
- Applying a small delay after the active clock edge when driving stimulus
- Understanding flip-flop propagation behavior
- Implementing multi-bit sequential logic
- Designing an 8-bit counter using D flip-flops
- Using active-low asynchronous reset
- Combining sequential and combinational logic in one design
- Reusing lower-level modules in a hierarchical RTL structure
- Detecting counter overflow at the maximum count value
- Implementing counter wrap-around from `8'hFF` to `8'h00`
- Running simulation and analyzing waveform behavior

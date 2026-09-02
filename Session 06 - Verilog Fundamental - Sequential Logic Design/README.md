## SESSION 06 – SEQUENTIAL LOGIC DESIGN

This session focused on the fundamentals of sequential logic design using flip-flops and non-blocking assignments. I practiced describing clocked behavior in Verilog, applying active-low asynchronous reset, and understanding how stored values are updated at clock edges. The exercises also introduced waveform-based reasoning and the importance of driving testbench inputs away from the active clock edge to avoid simulation issues.

### My Exercises

- Two-stage D Flip-Flop Shifter
- Sequential waveform analysis
- Sampler circuit with enable control
- Active-low asynchronous reset practice
- Simulation and waveform verification

### What I Practiced

- Implementing sequential logic using `always @(posedge clk)`
- Using non-blocking assignment (`<=`) for flip-flop behavior
- Designing with active-low asynchronous reset
- Cascading flip-flops to create a multi-stage shifter
- Understanding one-cycle data propagation through flip-flops
- Implementing enable-controlled data sampling
- Holding the previous output value when enable is inactive
- Translating timing requirements into RTL behavior
- Drawing and analyzing expected waveforms before simulation
- Comparing simulated waveforms with expected results
- Avoiding testbench stimulus changes exactly at the active clock edge

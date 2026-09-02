## SESSION 06 – SEQUENTIAL LOGIC DESIGN

This session focused on the fundamentals of sequential logic design using flip-flops and non-blocking assignments. I practiced describing clocked behavior in Verilog, applying active-low asynchronous reset, and understanding how stored values are updated at clock edges. The exercises also introduced waveform-based reasoning and the importance of driving testbench inputs away from the active clock edge to avoid simulation issues.

### My Exercises

- **Homework 1 – Two-Stage Flip-Flop Shifter**
  - Analyzed the expected timing behavior of two cascaded D flip-flops
  - Drew the expected waveform before RTL implementation
  - Implemented the shifter using positive-edge-triggered flip-flops
  - Applied active-low asynchronous reset
  - Simulated the design and compared the waveform with the expected behavior
- **Homework 2 – Enable-Controlled Sampler**
  - Designed a sequential sampler with `d`, `en`, `clk`, and `rst_n`
  - Sampled input `d` into output `q` when `en` was High
  - Held the previous value of `q` when `en` was Low
  - Used active-low asynchronous reset
  - Drew the expected waveform and logic diagram before coding
  - Simulated and verified the RTL behavior

### What I Practiced

- Implementing sequential logic with positive-edge-triggered flip-flops
- Using non-blocking assignment (`<=`) for sequential RTL
- Applying active-low asynchronous reset
- Cascading flip-flops to create multi-cycle data propagation
- Understanding one-clock-cycle delay through a D flip-flop
- Designing enable-controlled state updates
- Holding the previous register value when enable is inactive
- Translating timing requirements into RTL behavior
- Drawing expected waveforms before implementation
- Developing basic logic diagrams for sequential circuits
- Running simulation and comparing actual waveforms with expected results
- Understanding why testbench stimulus should not be driven exactly at the active clock edge

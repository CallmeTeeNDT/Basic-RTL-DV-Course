## SESSION 07 – SEQUENTIAL LOGIC PRACTICE & 8-BIT COUNTER DESIGN

This session reinforced sequential logic design through practical exercises involving simulation timing, race conditions, multi-bit flip-flops, and counter implementation. I learned how testbench stimulus timing can affect simulation results and why input signals should be driven slightly after the active clock edge to avoid race conditions. The main design exercise focused on building and verifying an 8-bit up-counter with asynchronous active-low reset and overflow detection.

### My Exercises

- **Homework 1 – Controlled 8-bit Counter**
  - Designed an 8-bit up-counter using multi-bit flip-flops
  - Implemented active-low asynchronous reset with an initial value of `8'h00`
  - Added `count_en` to control whether the counter increments or holds its current value
  - Added `count_clr` to synchronously clear the counter regardless of `count_en`
  - Implemented one-cycle overflow indication when the counter reaches its maximum value
  - Verified counter hold, clear, overflow, and wrap-around behavior through simulation
  - Drew the expected waveform and logic diagram before implementation
- **Homework 2 – Maximum Value Tracker**
  - Designed an 8-bit sequential data tracker
  - Stored the highest observed input value in `max1`
  - Stored the second-highest observed input value in `max2`
  - Defined the required state-update behavior based on incoming `data[7:0]`
  - Drew the logic diagram before writing RTL
  - Developed a simple testbench to provide input sequences
  - Ran simulation and inspected the waveform to verify tracking behavior

### What I Practiced

- Designing sequential RTL with multi-bit registers
- Using non-blocking assignment (`<=`) for clocked logic
- Applying active-low asynchronous reset
- Implementing enable-controlled state updates
- Holding register values when no update is required
- Implementing synchronous clear behavior
- Defining priority between clear, count, and hold operations
- Detecting counter overflow and wrap-around
- Translating functional requirements into waveform and logic diagrams
- Maintaining multiple related state values across clock cycles
- Comparing incoming data against stored values
- Updating the highest and second-highest values correctly
- Designing simple stateful datapaths
- Writing a basic testbench for sequential RTL
- Running simulation and validating behavior through waveform analysis
- Applying proper testbench timing to avoid race conditions

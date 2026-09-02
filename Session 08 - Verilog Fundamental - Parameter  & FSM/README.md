## Session 08 – Parameterized RTL Design

This session introduced parameterized RTL design as a technique for improving code reusability, configurability, and maintainability. The homework focused on applying Verilog parameters to previously developed hardware modules, allowing the same RTL implementation to support different bit-width configurations without rewriting the core design.

### My Exercises

- **Homework 1.1 – Configurable Counter**
  - Parameterized the counter width using `CNT_W`
  - Default configuration: 8-bit counter
  - Verified multiple configurations from 1-bit to 16-bit
- **Homework 1.2 – Configurable Full Adder**
  - Parameterized the adder width using `FA_BIT`
  - Default configuration: 16-bit full adder
  - Verified multiple configurations from 1-bit to 32-bit

### What I Practiced

- Declaring parameters in Verilog modules
- Using parameters to define configurable signal widths
- Replacing fixed bit-width constants with reusable parameter-based definitions
- Designing a configurable counter with `CNT_W`
- Designing a configurable full adder with `FA_BIT`
- Preserving the same RTL functionality across multiple hardware widths
- Overriding parameter values during simulation
- Verifying the counter with different widths from 1 to 16 bits
- Verifying the full adder with different widths from 1 to 32 bits
- Understanding how parameterization improves RTL scalability and reuse
- Compiling and simulating the same RTL design under multiple configurations

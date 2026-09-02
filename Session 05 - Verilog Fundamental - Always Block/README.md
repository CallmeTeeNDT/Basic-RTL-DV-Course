## SESSION 05 – COMBINATIONAL LOGIC & ALWAYS BLOCKS

This session focused on designing combinational logic using procedural `always` blocks and blocking assignments. I practiced translating logic previously implemented with continuous assignments into procedural form, while learning how sensitivity lists, `if-else`, and `case` statements affect combinational behavior. The exercises also emphasized important RTL coding practices, including complete assignments, single-driver ownership, and avoiding unintended latch inference.

### My Exercises

- **Homework 1 – 3-to-8 Decoder**
  - Designed a 2-to-4 decoder with an enable input
  - Built a 3-to-8 decoder using two 2-to-4 decoder instances
  - Used the most significant input bit to control decoder selection
  - Verified enable and decoded output behavior through simulation
  - Compiled the design and resolved relevant errors and warnings
- **Homework 2 – Simple Arithmetic Logic Unit (ALU)**
  - Designed a simple combinational ALU
  - Implemented multiple arithmetic and logical operations
  - Used control inputs to select the required ALU operation
  - Applied procedural combinational logic to generate the output
  - Simulated the design to verify operation selection and functional results

### What I Practiced

- Implementing combinational logic with procedural `always` blocks
- Using blocking assignment (`=`) correctly in combinational RTL
- Applying `if-else` and `case` statements for control and selection logic
- Using `default` branches to create complete combinational behavior
- Assigning outputs in all branches to avoid unintended latch inference
- Maintaining complete sensitivity lists
- Designing reusable combinational modules
- Instantiating lower-level modules in a hierarchical RTL design
- Using enable signals to control decoder behavior
- Expanding a 2-to-4 decoder into a 3-to-8 decoder
- Implementing arithmetic and logical functions within an ALU
- Selecting different operations through control signals
- Compiling, simulating, and checking combinational RTL behavior
- Reviewing and resolving meaningful compilation errors and warnings

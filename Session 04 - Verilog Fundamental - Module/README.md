## SESSION 04 – VERILOG MODULES & HIERARCHICAL DESIGN

This session focused on Verilog module structure, port declarations, module instantiation, and hierarchical design. The homework applied these concepts by building a 2-bit full adder from reusable 1-bit full-adder modules, demonstrating how larger RTL blocks can be constructed by connecting smaller functional components through clearly defined interfaces.

### My Exercises

- **Homework 1 – 2-bit Full Adder**
  - Designed a 2-bit binary adder using two 1-bit full-adder instances
  - Connected the carry-out of the lower bit to the carry-in of the upper bit
  - Integrated previously developed `half_adder` and `full_adder` modules
  - Compiled and simulated the hierarchical design
  - Inspected waveform results to verify the DUT input/output behavior
- **Homework 2 – 16-bit Full Adder**
  - Designed a 16-bit full adder based on reusable 1-bit full-adder modules
  - Extended the same hierarchical design concept to a wider datapath
  - Implemented carry propagation across multiple bit positions
  - Compiled and simulated the complete 16-bit design
- **Extra Homework – Full Adder Logic Equivalence**
  - Analyzed the Boolean behavior of a full adder
  - Demonstrated that a full adder can be constructed from two half adders
  - Verified the equivalence between the hierarchical implementation and the expected full-adder logic

### What I Practiced

- Defining reusable Verilog modules
- Instantiating lower-level modules inside higher-level designs
- Connecting modules through internal `wire` signals
- Understanding module hierarchy and unique instance naming
- Cascading full adders through carry propagation
- Building a 2-bit adder from 1-bit arithmetic blocks
- Scaling a hierarchical design from 2-bit to 16-bit
- Reusing previously developed RTL modules
- Avoiding invalid multi-driver connections
- Compiling and simulating multi-module RTL designs
- Inspecting waveforms to verify functional behavior
- Relating hierarchical RTL structures to Boolean logic
- Proving functional equivalence between full-adder and half-adder implementations

## SESSION 13 – REGISTER DESIGN PRACTICE: PULSE COUNTER

This session focused on applying a structured RTL design and verification methodology to a register-controlled pulse counter. The homework required translating a detailed register specification into expected timing behavior, a complete logic diagram, synthesizable RTL, a Verification Plan, and a testbench. The design combined register access, command-pulse generation, counter control, overflow handling, and status monitoring within a single integrated exercise.

### My Exercises

- **Pulse Counter Design & Verification**
  - Designed a 3-bit pulse counter with active-low asynchronous reset
  - Implemented pulse generation through the `CR.pulse_en` write command
  - Incremented the counter once for each valid pulse command
  - Implemented counter clear through `CR.count_clr`
  - Detected overflow when incrementing from the maximum counter value
  - Implemented sticky `SR.overflow` status with RW0C behavior
  - Exposed the current counter value through the read-only `SR.cnt[2:0]` field
  - Re-drew the expected waveform from the specification
  - Created the complete logic diagram
  - Implemented the RTL design
  - Created a Verification Plan (VPLAN)
  - Developed a testbench and verified the complete design

### What I Practiced

- Analyzing detailed register specifications before coding
- Translating requirements into expected timing waveforms
- Converting waveform behavior into a complete logic diagram
- Designing command-pulse generation from register writes
- Implementing WO, RW, RO, and RW0C register-field behavior
- Performing register address decoding and readback
- Designing a controlled 3-bit counter
- Implementing counter clear and overflow detection
- Maintaining sticky hardware status until software clears it
- Separating control, status, and counter functionality
- Writing synthesizable RTL from a defined micro-architecture
- Creating a VPLAN from functional requirements
- Building a testbench based on verification objectives
- Verifying register-controlled hardware behavior through simulation
- Connecting RTL Design and Design Verification in one complete workflow

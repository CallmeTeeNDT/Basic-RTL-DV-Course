## SESSION 12 – REGISTER MODULE DESIGN & VERIFICATION

This session focused on designing and verifying a memory-mapped register module that serves as an interface between software-visible configuration and internal hardware status. Homework 1 extended the basic register design to include both Read/Write (RW) and Read-Only (RO) registers, requiring correct address decoding, reset values, read/write behavior, and reserved-address handling. The exercise also introduced a more complete workflow combining RTL implementation, logic-diagram development, Verification Plan creation, and testbench-based register verification.

### My Exercises

- **Homework 1 – 2RW / 2RO Register Module**
  - Extended the existing register block with additional RW and RO registers
  - Implemented `DATA0` and `DATA1` as 32-bit Read/Write registers
  - Implemented `SR_DATA0` and `SR_DATA1` as 32-bit Read-Only status registers
  - Updated the register logic diagram to include all four registers
  - Implemented address decoding and read-data selection
  - Verified register reset/default values
  - Verified legal read and write accesses
  - Verified write protection for Read-Only registers
  - Verified reserved-address behavior
  - Created a VPLAN and testbench with reusable read/write tasks

### What I Practiced

- Designing memory-mapped register interfaces
- Implementing 32-bit Read/Write and Read-Only registers
- Creating address-decode logic
- Implementing register read-data multiplexing
- Applying different reset/default values to registers
- Preventing software writes from modifying Read-Only registers
- Handling reserved addresses correctly
- Translating register specifications into RTL
- Drawing an integrated register logic diagram
- Creating a Verification Plan for register behavior
- Writing reusable read and write tasks in the testbench
- Verifying reset values and register access permissions
- Checking RW, RO, and reserved-register behavior
- Comparing actual readback data against expected values

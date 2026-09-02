## SESSION 09 – VERILOG FOR VERIFICATION: MASTER MODEL WITH TASKS

This session introduced Verilog constructs commonly used for verification, including `initial` blocks, timing control, loops, and tasks. Homework 1 focused on building a reusable master model inside the testbench using Verilog tasks. I implemented separate `master_write` and `master_read` tasks to generate protocol-based read and write transactions, synchronized with the rising edge of the clock.

### My Exercises

- Master write transaction using Verilog task
- Master read transaction using Verilog task
- Reusable `master_write` task
- Reusable `master_read` task
- Two consecutive write transactions
- Two consecutive read transactions
- Read-data verification through simulation waveform

### What I Practiced

- Writing reusable Verilog tasks for verification
- Passing address and write-data values into task calls
- Synchronizing testbench stimulus using `@(posedge clk)`
- Generating multi-cycle protocol transactions
- Controlling `psel`, `pwrite`, `penable`, `paddr`, and `pwdata`
- Maintaining stable address and data during a transaction
- Separating read and write behavior into reusable procedures
- Calling the same task multiple times with different arguments
- Building a simple protocol master model inside a testbench
- Running simulation and inspecting `prdata` to verify readback behavior

## SESSION 15 – FINAL PROJECT: ADVANCED TIMER IP DESIGN & VERIFICATION

This final project integrated the major RTL Design and Design Verification concepts covered throughout the course into a complete Advanced Timer IP. The project involved specification analysis, architecture definition, RTL implementation, verification planning, testbench development, debugging, regression testing, and code-coverage closure.

The Timer IP was implemented as an APB-controlled peripheral with a 64-bit programmable counter, configurable counting modes, interrupt generation, debug-halt support, byte-write access, one-cycle APB wait-state handling, and prohibited-access detection. The design was organized into five major functional blocks—APB Slave, Register, Counter Control, Counter, and Interrupt—with clear ownership of configuration and state to improve modularity, readability, and verification.

### My Final Project

- **Advanced Timer IP – RTL Design & Verification**
  - Analyzed the Final Project requirements and developed the design specification
  - Defined the Timer IP architecture and inter-block interfaces
  - Created block diagrams, logic diagrams, and expected timing behavior
  - Designed and integrated the following RTL modules:
    - APB Slave
    - Register Block
    - Counter Control
    - 64-bit Timer Counter
    - Interrupt Controller
    - Timer Top integration
  - Implemented a memory-mapped register interface
  - Developed a 64-bit free-running count-up timer
  - Implemented programmable counting periods from divide-by-1 to divide-by-256
  - Implemented a synchronous clock-enable based divider without generating a derived clock
  - Supported software programming of the 64-bit timer through TDR0/TDR1
  - Implemented 64-bit carry propagation, overflow, and wrap-around behavior
  - Implemented 64-bit compare-based interrupt generation
  - Added sticky interrupt status with RW1C software clearing
  - Implemented interrupt masking through `INT_EN`
  - Added debug halt and resume with divider-phase preservation
  - Implemented active-low asynchronous reset behavior
  - Added APB request capture and exactly one wait state
  - Implemented byte-write access using `PSTRB`
  - Implemented APB error response using `PSLVERR`
  - Added prohibited TCR access detection and atomic transaction rejection
  - Supported RAZ/WI behavior for reserved addresses and fields
  - Created the Verification Plan (VPLAN) and implementation checklist
  - Developed reusable APB read/write tasks and automated checkers
  - Created directed testcases for normal, corner-case, and protocol behavior
  - Performed regression testing and code-coverage analysis
  - Debugged RTL and verification issues using simulation logs and waveforms
  - Completed final verification with all 15 directed testcases passing

### RTL Source Code

- [`timer_top.v`](./rtl/timer_top.v)
- [`timer_apb_slave.v`](./rtl/timer_apb_slave.v)
- [`timer_reg.v`](./rtl/timer_reg.v)
- [`timer_counter_control.v`](./rtl/timer_counter_control.v)
- [`timer_counter.v`](./rtl/timer_counter.v)
- [`timer_interrupt.v`](./rtl/timer_interrupt.v)

### Verification Environment

- [`test_bench.v`](./tb/test_bench.v)
- [`apb_tasks.vh`](./tb/apb_tasks.vh)
- [`checker_tasks.vh`](./tb/checker_tasks.vh)
- [`timer_define.vh`](./tb/timer_define.vh)
- [`VPLAN.xlsx`](./doc/VPLAN.xlsx)
- [`CHECKLIST.xlsx`](./doc/CHECKLIST.xlsx)

### Project Documentation

- [`Final_Project_Report.pdf`](./doc/Final_Project_Report.pdf)

### What I Practiced

- Translating specifications into RTL architecture and micro-architecture
- Defining clear ownership of state across multiple RTL modules
- Designing hierarchical and modular RTL
- Implementing APB slave protocol behavior
- Handling SETUP and ACCESS phases correctly
- Capturing APB transactions across wait states
- Generating exactly one APB wait state
- Separating protocol completion from functional register commit
- Implementing APB error responses with `PSLVERR`
- Supporting byte-level writes with `PSTRB`
- Performing candidate-value merging before legality checking
- Implementing memory-mapped register semantics
- Working with RW, RO, RW1C, RW/HW, and RAZ/WI fields
- Designing and verifying a unified 64-bit timer counter
- Handling low-to-high carry and 64-bit overflow
- Defining deterministic update priorities for simultaneous events
- Designing programmable divider logic with clock-enable generation
- Preserving divider phase across debug halt and resume
- Implementing sticky interrupt pending state
- Separating interrupt pending status from interrupt masking
- Handling RW1C clear and compare-match priority
- Creating requirement-to-testcase traceability through a VPLAN
- Developing reusable APB stimulus tasks
- Writing automated functional checkers
- Creating directed and corner-case testcases
- Debugging failures through logs and waveform analysis
- Running regression and analyzing code coverage
- Refining RTL based on coverage results without changing required functionality
- Applying a complete RTL Design and Design Verification workflow

## SESSION 14 – AMBA APB PROTOCOL RESEARCH & TECHNICAL PRESENTATION

This session focused on studying the AMBA Advanced Peripheral Bus (APB) protocol through specification research and a technical group presentation. As preparation for the Final Project, I studied the official Arm AMBA APB Protocol Specification and worked with my team to explain how APB provides a simple, synchronous, non-pipelined interface for accessing low-speed peripheral registers.

The presentation covered APB usage in SoC architectures, requester/completer communication, interface signals, read and write transfers, wait-state behavior, error responses, byte access using `PSTRB`, the APB operating state machine, and basic APB master/slave design concepts. I also reviewed the protocol from both RTL Design and Design Verification perspectives to better understand how an APB interface should be implemented and verified.

### My Presentation "AMBA APB Protocol – Group Presentation"

  - Introduced the purpose and practical use of APB in SoC architectures
  - Explained the relationship between high-performance buses and APB peripherals
  - Described the APB Requester/Completer interface
  - Analyzed the major APB interface signals
  - Explained read and write transfer timing
  - Compared no-wait-state and wait-state transactions
  - Studied transfer completion using `PREADY`
  - Explained error reporting using `PSLVERR`
  - Presented byte-write behavior using `PSTRB`
  - Analyzed the `IDLE`, `SETUP`, and `ACCESS` operating states
  - Proposed basic APB Master and APB Slave architectures
  - Reviewed APB from RTL Design and Design Verification perspectives

### Presentation

- [`APB PROTOCOL.pdf`](./APB%20PROTOCOL.pdf) – My group presentation

### What I Practiced

- Reading and interpreting an industry-standard hardware protocol specification
- Extracting technical requirements from official documentation
- Understanding the role of APB in an SoC interconnect architecture
- Understanding APB as a synchronous and non-pipelined peripheral bus
- Analyzing Requester and Completer responsibilities
- Understanding `PCLK` and active-low `PRESETn`
- Understanding `PSEL`, `PENABLE`, and `PWRITE`
- Understanding address and data signals: `PADDR`, `PWDATA`, and `PRDATA`
- Understanding transfer completion through `PREADY`
- Understanding APB error signaling through `PSLVERR`
- Understanding byte-lane selection through `PSTRB`
- Analyzing SETUP and ACCESS timing requirements
- Understanding signal stability during extended ACCESS phases
- Comparing read/write transfers with and without wait states
- Understanding the APB `IDLE → SETUP → ACCESS` state transitions
- Relating protocol requirements to RTL implementation
- Identifying important APB verification scenarios and protocol checks
- Converting technical specification content into a clear engineering presentation
- Presenting and discussing hardware protocol concepts collaboratively

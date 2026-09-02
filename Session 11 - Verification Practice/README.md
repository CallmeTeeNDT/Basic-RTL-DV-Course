## SESSION 11 – VERIFICATION PRACTICE & AUTOMATED CHECKING

This session focused on practical Design Verification through a more complete verification workflow. The homework used an encrypted DUT, requiring me to analyze the provided specification, create a verification plan, build a testbench, generate expected results, and develop automated checkers without relying on the internal RTL implementation. The exercise emphasized requirement-based verification, reference-model development, serial-data checking, parity prediction, and systematic bug detection.

### My Exercises

- **DV Advanced Entrance Test**
  - Analyzed the provided design specification and communication protocol
  - Created a Verification Plan / checklist based on the functional requirements
  - Built a testbench to generate the required stimulus
  - Generated simulation waveforms according to the documented protocol
  - Developed expected results for serial output data
  - Implemented a reference model for expected parity
  - Created automated checkers for both transmitted data and parity
  - Verified an encrypted RTL design from its external behavior
  - Investigated simulation failures and identified functional bugs in the DUT

### What I Practiced

- Analyzing a specification before developing testcases
- Translating design requirements into a Verification Plan
- Building a structured verification environment
- Generating protocol-compliant stimulus
- Developing expected results independently from the DUT
- Converting serial output data for comparison with parallel input data
- Modeling expected parity behavior
- Writing automated data and parity checkers
- Comparing actual DUT outputs against reference values
- Debugging failures using simulation logs and waveforms
- Detecting bugs in an encrypted RTL implementation
- Separating DUT behavior from the verification reference model
- Using PASS/FAIL checking instead of relying only on manual waveform inspection

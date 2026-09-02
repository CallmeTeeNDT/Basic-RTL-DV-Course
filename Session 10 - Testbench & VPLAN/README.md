## SESSION 10 – TESTBENCH, VERIFICATION PLAN & ONE-HOT CHECKER VERIFICATION

This session focused on building a more structured Design Verification workflow using verification planning, testcases, and automated checkers. The homework applied these concepts to a one-hot detection circuit, where the objective was not to redesign the DUT, but to analyze its requirements, identify potential verification scenarios, develop a VPLAN, and build a testbench capable of detecting functional bugs automatically.

Homework 1 focused on verifying a 4-bit one-hot checker with an enable control, while Homework 2 extended the same verification environment to a parameterized N-bit version of the design.

### My Exercises

- **Homework 1 – 4-bit One-Hot Checker Verification**
  - Requirement analysis for a 4-bit one-hot detector
  - Verification Plan development
  - Testcase design for valid and invalid one-hot patterns
  - Enable/disable behavior verification
  - Automated checker implementation
  - RTL bug detection through simulation
- **Homework 2 – Parameterized N-bit One-Hot Checker Verification**
  - Extended the Homework 1 verification environment to an N-bit input
  - Verified the parameterized design with default `N = 8`
  - Updated stimulus generation and checking logic for configurable widths
  - Reused and generalized the existing testbench

### What I Practiced

- Analyzing design requirements before writing testcases
- Translating requirements into verification items
- Creating a structured Verification Plan (VPLAN)
- Defining clear test sequences and PASS/FAIL conditions
- Building reusable testbench stimulus
- Writing automated checkers instead of relying only on waveform inspection
- Verifying one-hot behavior across multiple input combinations
- Testing enable and disable conditions
- Identifying functional bugs in an encrypted DUT
- Distinguishing valid one-hot patterns from zero-hot and multi-hot patterns
- Reusing an existing verification environment for a parameterized design
- Adapting stimulus and checker logic to configurable signal widths
- Improving verification scalability through parameterization
- Running simulation, debugging failures, and correlating results with the VPLAN

# Day 5 - Arithmetic, Comparators, ALU & FSM Basics

Day 5 wraps up the "basics" arc: more arithmetic circuits, decision-making
logic, and a first taste of **Finite State Machines**, which are the
foundation for all real control logic (protocols, CPUs, controllers).

| Topic | File | Concept |
|---|---|---|
| Half Subtractor | `half_subtractor.v` | Basic 1-bit subtraction |
| Full Subtractor | `full_subtractor.v` | Subtraction with borrow-in/borrow-out |
| 2-bit Comparator | `comparator.v` | Greater-than / less-than / equal logic |
| Simple ALU | `alu.v` | One module, multiple operations selected by `sel` |
| Sequence Detector (FSM) | `sequence_detector.v` | Moore FSM detecting "101" on a serial line |

### Key takeaways
- Subtractors mirror adders but propagate a **borrow** instead of a carry.
- An ALU is just a mux over several combinational operations, selected by
  an opcode.
- FSMs need two always blocks (state register + next-state/output logic)
  at minimum — this one uses three, separating state, next-state, and output
  logic for clarity (Moore machine).
- This sequence detector allows **overlapping** matches — trace the testbench
  waveform to see why S1 → S2 → S3 catches "101" starting at each `1`.

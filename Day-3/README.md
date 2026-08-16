# Day 3 - Sequential Logic Basics

Building on Day 1 (gates) and Day 2 (combinational circuits), Day 3 moves into
**sequential logic** — circuits whose output depends on stored state, not just
current inputs.

| Topic | File | Concept |
|---|---|---|
| SR Latch | `sr_latch.v` | Simplest 1-bit memory element (level-sensitive) |
| D Flip-Flop | `d_flipflop.v` | Edge-triggered storage, foundation of registers |
| JK Flip-Flop | `jk_flipflop.v` | Set/Reset/Toggle/Hold in one flip-flop |
| T Flip-Flop | `t_flipflop.v` | Toggle flip-flop, used heavily in counters |
| Shift Register (SIPO) | `shift_register.v` | Serial-in parallel-out, chaining flip-flops |

### Key takeaways
- Latches are **level-sensitive**, flip-flops are **edge-triggered**.
- `always @(posedge clk or posedge rst)` is the standard template for
  synchronous logic with an asynchronous reset.
- Blocking (`=`) vs non-blocking (`<=`) assignment matters: sequential
  (clocked) logic always uses `<=`.

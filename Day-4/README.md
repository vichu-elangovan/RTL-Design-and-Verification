# Day 4 - Counters and Registers

Day 4 applies Day 3's flip-flops to build **counters** — one of the most
common building blocks in digital design (timers, address generators,
clock dividers, etc.).

| Topic | File | Concept |
|---|---|---|
| Up Counter | `up_counter.v` | Increments every clock edge |
| Down Counter | `down_counter.v` | Decrements every clock edge |
| Up/Down Counter | `up_down_counter.v` | Direction controlled by a `mode` input |
| Mod-N Counter | `mod_n_counter.v` | Counter that resets after N states (parameterized) |
| Ring Counter | `ring_counter.v` | Single active bit rotates through a shift register |

### Key takeaways
- Counters are just registers with combinational next-state logic
  (`count + 1`, `count - 1`, etc.).
- `parameter` lets you build reusable, configurable modules (see `mod_n_counter.v`).
- Ring counters trade extra flip-flops for very simple, glitch-free decoding logic.

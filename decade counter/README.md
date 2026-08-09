# Decade Counter using Verilog

## Overview

This project implements a **4-bit Decade Counter**, also known as a **MOD-10 Counter**, using Verilog HDL.

A decade counter counts from decimal `0` through decimal `9` and then returns to `0`. It requires four flip-flops because four binary bits are needed to represent the values from 0 to 9.

## Counting Sequence

The counter follows:

```text
0 → 1 → 2 → 3 → 4 → 5 → 6 → 7 → 8 → 9 → 0
```

In binary:

```text
0000 → 0001 → 0010 → 0011 → 0100
     → 0101 → 0110 → 0111 → 1000
     → 1001 → 0000
```

## Features

* 4-bit decade counter
* MOD-10 operation
* Counts from 0 to 9
* Automatically returns to 0 after 9
* Asynchronous active-high reset
* Verilog RTL implementation
* Verilog testbench
* Simulation output
* VCD waveform generation
* Icarus Verilog compatible
* GTKWave compatible
* Makefile included

## Project Structure

```text
decade-counter-verilog/
├── rtl/
│   └── decade_counter.v
├── tb/
│   └── tb_decade_counter.v
├── simulation/
│   └── simulation_output.txt
├── README.md
└── Makefile
```

## Objective

The objective of this project is to design and simulate a MOD-10 decade counter using Verilog HDL.

The counter must:

1. Start at 0 after reset.
2. Increment on every positive clock edge.
3. Count from 0 through 9.
4. Return to 0 after reaching 9.
5. Continue counting repeatedly.

## Working Principle

A binary counter normally counts:

```text
0000 → 0001 → 0010 → ... → 1111
```

However, a decade counter only needs ten states:

```text
0000 through 1001
```

The value `1001` represents decimal 9.

When the counter reaches:

```text
1001 = 9
```

the next clock cycle resets the count to:

```text
0000 = 0
```

Therefore, the counter has ten valid states.

## State Sequence

```text
        ┌──────────────────────────┐
        │                          │
        ▼                          │
      0000 → 0001 → 0010 → 0011   │
        ↓                           │
      0100 → 0101 → 0110 → 0111   │
        ↓                           │
      1000 → 1001 ─────────────────┘
                    back to 0000
```

Decimal representation:

```text
0 → 1 → 2 → 3 → 4 → 5 → 6 → 7 → 8 → 9 → 0
```

## Inputs

| Signal  | Width | Description                    |
| ------- | ----: | ------------------------------ |
| `clk`   |     1 | Clock input                    |
| `reset` |     1 | Active-high asynchronous reset |

## Output

| Signal  | Width | Description           |
| ------- | ----: | --------------------- |
| `count` |     4 | Current counter value |

## Reset Operation

When:

```text
reset = 1
```

the counter is immediately reset to:

```text
count = 0000
```

When reset is released, counting starts on the next rising edge of the clock.

## RTL Design

The main Verilog module is located at:

```text
rtl/decade_counter.v
```

The key logic is:

```text
if count == 9
    count = 0
else
    count = count + 1
```

This creates the MOD-10 behavior.

## Testbench

The testbench is located at:

```text
tb/tb_decade_counter.v
```

The testbench:

1. Generates a 10 ns clock.
2. Applies reset.
3. Releases reset.
4. Monitors the counter.
5. Runs through multiple counting cycles.
6. Generates a VCD waveform.
7. Displays the simulation output.
8. Terminates the simulation.

## Simulation

### Compile

Using Icarus Verilog:

```bash
iverilog -o decade_counter_sim rtl/decade_counter.v tb/tb_decade_counter.v
```

### Run

```bash
vvp decade_counter_sim
```

### View Waveform

The simulation generates:

```text
decade_counter.vcd
```

Open it using GTKWave:

```bash
gtkwave decade_counter.vcd
```

Recommended signals:

```text
clk
reset
count
```

## Expected Simulation Output

```text
==============================================
          DECADE COUNTER TEST
==============================================
Time    Reset   Count   Decimal
----------------------------------------------
0       1       0000    0
12000   0       0000    0
15000   0       0001    1
25000   0       0010    2
35000   0       0011    3
45000   0       0100    4
55000   0       0101    5
65000   0       0110    6
75000   0       0111    7
85000   0       1000    8
95000   0       1001    9
105000  0       0000    0
115000  0       0001    1
125000  0       0010    2
135000  0       0011    3
145000  0       0100    4
155000  0       0101    5
165000  0       0110    6
----------------------------------------------
Simulation completed successfully.
```

## Waveform

The testbench creates:

```text
decade_counter.vcd
```

The waveform should show the counter changing as:

```text
0000
0001
0010
0011
0100
0101
0110
0111
1000
1001
0000
```

The counter returns to `0000` after `1001`.

## Applications

Decade counters are used in:

* Digital clocks
* Frequency dividers
* Digital counters
* Event counters
* Timer circuits
* Frequency measurement
* Seven-segment display circuits
* Digital control systems

## Advantages

* Simple implementation
* Requires only four bits for ten states
* Easy to interface with decimal displays
* Useful for frequency division
* Suitable for FPGA and digital IC implementation

## Difference Between Binary and Decade Counter

| Feature          | Binary Counter | Decade Counter |
| ---------------- | -------------- | -------------- |
| Number of states | 16 for 4 bits  | 10             |
| Counting range   | 0–15           | 0–9            |
| MOD value        | 16             | 10             |
| Reset after      | 15             | 9              |

## Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* Git/GitHub

## Result

The 4-bit decade counter was successfully designed and simulated.

The counter correctly generates:

```text
0 → 1 → 2 → 3 → 4 → 5 → 6 → 7 → 8 → 9 → 0
```

The simulation verifies the MOD-10 operation.

**Result: PASS**

## Author

```text
Name: Your Name
Department: Your Department
College: Your College
```

## License

This project is intended for educational and academic purposes.

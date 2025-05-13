# RISC-V Pipelined Processor

This repository contains the Verilog implementation of a 5-stage pipelined RISC-V processor. The pipeline stages implemented are:

1.  **Fetch (F)**: Fetches the instruction from instruction memory.
2.  **Decode (D)**: Decodes the instruction and reads operands from the register file.
3.  **Execute (E)**: Performs arithmetic and logical operations or calculates the memory address.
4.  **Memory (M)**: Accesses data memory for load and store operations.
5.  **Writeback (WB)**: Writes the result back to the register file.

## Datapath

The datapath of this pipelined processor is visualized in the following image:

![RISC-V Pipelined Datapath](https://i.sstatic.net/IoHIM.png)

*(Source: i.sstatic.net)*

## Modules

The design is modularized into the following Verilog files:

-   `pipelineee.v`: Top-level module connecting all pipeline stages.
-   `fetch.v`: Implements the Fetch stage.
-   `decode.v`: Implements the Decode stage, including instruction decoding, register file reading, and immediate generation.
-   `execute.v`: Implements the Execute stage, including ALU operations and branch condition evaluation.
-   `memory.v`: Implements the Memory stage, handling data memory access.
-   `writeback.v`: Implements the Writeback stage, writing results to the register file.
-   `InstructionMemory.v`: Models the instruction memory.
-   `PC.v`: Implements the Program Counter.
-   `Adder.v`: A basic adder module.
-   `Mux2to1.v`: A 2-to-1 multiplexer module.
-   `Control.v`: Generates control signals based on the instruction's opcode and function fields.
-   `ImmGen.v`: Generates immediate values from the instruction.
-   `Register.v`: Models the register file.
-   `ShiftLeftOne.v`: Performs a left shift by one bit (used for branch target calculation).
-   `ALUCtrl.v`: Generates control signals for the ALU.
-   `ALU.v`: Implements the Arithmetic Logic Unit.
-   `DataMemory.v`: Models the data memory.

## Getting Started

To use this project, you will need a Verilog simulator (e.g., ModelSim, Verilator).

1.  Clone this repository:
    ```bash
    git clone [repository URL]
    cd [repository name]
    ```

2.  Simulate the design using your preferred Verilog simulator. You might need to set up testbenches and simulation scripts depending on your simulator.

## Instruction Memory Initialization

The instruction memory is initialized by reading instructions from the `TEST_INSTRUCTIONS.dat` file. Ensure this file is in the correct location relative to your simulation environment or modify the `$readmemb` path in `InstructionMemory.v` accordingly.

## Data Memory

The `DataMemory.v` module models a simple data memory.

## Contributing

Contributions to this project are welcome. Please feel free to submit pull requests or open issues for any bugs or enhancements.

## License

[Your License Information Here (e.g., MIT License)]

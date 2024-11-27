#
This repository contains assembly programs. Each program demonstrates core concepts in assembly programming, including control flow, array manipulation, modular programming, and port-based simulations. The repository is structured with clear documentation to facilitate understanding and usage.
---

## **Programs Overview**

### **1. Control Flow and Conditional Logic**
- **Purpose**: Classify an input number as POSITIVE, NEGATIVE, or ZERO.
- **Key Features**: Utilizes conditional and unconditional jump instructions for branching logic.

### **2. Array Manipulation with Looping and Reversal**
- **Purpose**: Reverse an array of integers in place without using additional memory.
- **Key Features**: Implements looping and direct memory handling for array reversal.

### **3. Modular Program with Subroutines for Factorial Calculation**
- **Purpose**: Compute the factorial of a number using a modular subroutine approach.
- **Key Features**: Demonstrates stack-based register management and modular programming.

### **4. Data Monitoring and Control Using Port-Based Simulation**
- **Purpose**: Simulate a control system that reads sensor input and takes actions such as turning on a motor, triggering an alarm, or stopping a motor.
- **Key Features**: Uses port/memory manipulation to simulate control actions based on input thresholds.

---

## **Instructions for Compiling and Running**

### **Prerequisites**
1. Ensure you have an assembler like NASM installed.
2. Use an emulator such as DOSBox or a virtual machine to run the programs if required.
3. Familiarity with your platform's memory and port simulation settings.

### **Compilation Steps**
1. Navigate to the directory containing the assembly file.
2. Compile the assembly file using NASM:
   ```bash
   nasm -f bin <filename.asm> -o <outputfile>
   ```
3. Link the binary file (if necessary) or directly execute it in an appropriate environment.

### **Running the Programs**
1. Load the compiled binary into your environment.
2. Provide input as prompted by the program.
3. Observe the output and functionality for each program task.

---

## **Insights and Challenges**

### **Task 1: Control Flow and Conditional Logic**
- **Insights**: Branching logic effectively demonstrates how conditional and unconditional jumps can simplify program flow.
- **Challenges**: Ensuring each jump aligns correctly to avoid infinite loops or incorrect classifications.

### **Task 2: Array Manipulation with Looping and Reversal**
- **Insights**: Direct memory manipulation provides efficient array reversal.
- **Challenges**: Avoiding the use of additional memory while ensuring proper in-place reversal.

### **Task 3: Modular Program with Subroutines**
- **Insights**: Subroutines and stack operations are vital for modularity and clean code.
- **Challenges**: Managing registers and stack operations without corrupting data.

### **Task 4: Data Monitoring and Control**
- **Insights**: Port-based simulation mimics real-world control systems effectively.
- **Challenges**: Handling sensor input and ensuring correct threshold-based decision-making.

---
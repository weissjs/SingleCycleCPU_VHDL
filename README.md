# 426_Lab4
Jordan and Daijon wreck this mfuckwer
 
Our single cycling CPU will have 16 registers
with 16 instructions. Instruction latout is as follows

## Instruction Layout
```
R-Type
[0000][0000][0000][0000]
  op    rs    rt    rd
I-Type
[0000][0000][0000][0000]
  op    rs    rt    im
J-type
[0000][000000000000]
  op     constant
```
## List of instructions
```
Instr| OP |
Add  |0000|
addi |0001|
sub  |0010|
subi |0011|
and  |0100|
or   |0101|
sll  |0110|
srl  |0111|
beq  |1000|
blt  |1001|
bgt  |1010|
bne  |1011|
j    |1100|
lw   |1101|
sw   |1110|
li   |1111|
```
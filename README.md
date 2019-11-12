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
  
add rd, rs, rt
li rt, im    -- dont care ab rs
sw rt, [rs] -- dont care ab immediate
```
## List of instructions
```
Instr|ALUOP|RegDst|Jump|Branch|MemRead|MemtoReg|MemWrite|ALUSrc|RegWrite|
Add  |0000 |   1  | 0  |   0  |   0   |    0   |    0   |  0   |    1   |    
addi |0001 |   1  | 0  |   0  |   0   |    0   |    0   |  0   |    1   |
sub  |0010 |   1  | 0  |   0  |   0   |    0   |    0   |  0   |    1   |
subi |0011 |   1  | 0  |   0  |   0   |    0   |    0   |  0   |    1   |
and  |0100 |   1  | 0  |   0  |   0   |    0   |    0   |  0   |    1   |
or   |0101 |   1  | 0  |   0  |   0   |    0   |    0   |  0   |    1   |
sll  |0110 |   0  | 0  |   0  |   0   |    0   |    0   |  0   |    1   |
srl  |0111 |   0  | 0  |   0  |   0   |    0   |    0   |  0   |    1   |
beq  |1000 |   X  | 0  |   1  |   0   |    X   |    0   |  0   |    0   |
blt  |1001 |   X  | 0  |   1  |   0   |    X   |    0   |  0   |    0   |
bgt  |1010 |   X  | 0  |   1  |   0   |    X   |    0   |  0   |    0   |
bne  |1011 |   X  | 0  |   1  |   0   |    X   |    0   |  0   |    0   |
j    |1100 |   X  | 1  |Branch|   0   |    0   |    0   |ALUSrc|RegWrite| -- Usure
lw   |1101 |   0  | 0  |   0  |   1   |    1   |    0   |  1   |    1   |
sw   |1110 |   X  | 0  |   0  |   0   |    X   |    1   |  1   |    0   |
li   |1111 |   0  | 0  |   0  |   1   |    1   |    0   |  1   |    1   | -- Unsure
```

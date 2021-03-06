// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

@R2
M=0

@R0  // M0
D=M
@END
D; JEQ

// Now we know R0 > 0
(LOOP)
    @R1  // M2
    D=M

    @R2  // AGG
    M=D+M

    @R0  // M1
    D=M-1

    @END
    D; JEQ

    @R0
    M=D

    @LOOP
    0; JMP

(END)
    @END
    0; JMP

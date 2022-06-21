// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Pseudocode:
//
// R2 = 0
// if R0 <= R1 then
//      n = R0
//      m = R1
// else
//      n = R1
//      m = R0

    @0
    D=A
    @R2
    M=D                 // R2 = 0

    @R0
    D=M
    @R1
    D=D-M               // R0 - R1 > 0

    @GREATER
    D;JGT

    @R0
    D=M
    @n
    M=D                 // n = R0
    @R1
    D=M
    @m
    M=D                 // m = R1

    @MULT
    0;JMP

(GREATER)

    @R0
    D=M
    @m
    M=D                 // m = R0
    @R1
    D=M
    @n
    M=D                 // n = R1

// Pseudocode:
//
// while n > 0 then
//      R2 = R2 + m
//      n = n - 1

(MULT)

    @n
    M=M-1
    D=M
    @END
    D;JLT

    @m
    D=M
    @R2
    M=D+M

    @MULT
    0;JMP

(END)
    @END
    0;JMP
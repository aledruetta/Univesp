// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
(GO)
@SCREEN
D=A
@0
M=D
(CHECK)
@KBD
D=M
@BCK
D;JGT
@WTE
D;JEQ
@CHECK
0;JMP
(BCK)
@1
M=-1
@MOVE
0;JMP
(WTE)
@1
M=0
@MOVE
0;JMP
(MOVE)
@1
D=M
@0
A=M
M=D
@0
D=M+1
@KBD
D=A-D
@0
M=M+1
A=M
@MOVE
D;JGT
@GO
0;JMP

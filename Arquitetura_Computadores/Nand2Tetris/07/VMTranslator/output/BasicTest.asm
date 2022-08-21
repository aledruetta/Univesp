// push constant 10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 21
@21
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 22
@22
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 36
@36
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 42
@42
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 45
@45
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 510
@510
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
// push that 5
// add
@SP
AM=M-1
D=M
A=A-1
M=D+M
// push argument 1
// sub
@SP
AM=M-1
D=-M
A=A-1
M=D+M
// push this 6
// push this 6
// add
@SP
AM=M-1
D=M
A=A-1
M=D+M
// sub
@SP
AM=M-1
D=-M
A=A-1
M=D+M
// push temp 6
// add
@SP
AM=M-1
D=M
A=A-1
M=D+M

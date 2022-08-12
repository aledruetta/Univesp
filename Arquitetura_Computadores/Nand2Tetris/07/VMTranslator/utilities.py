C_ARITHMETIC = 0
C_PUSH = 1
C_POP = 2
C_LABEL = 3
C_GOTO = 4
C_IF = 5
C_FUNCTION = 6
C_RETURN = 7
C_CALL = 8

segments = {
    "local": "LCL",
    "argument": "ARG",
    "this": "THIS",
    "that": "THAT"
}

templates = {
    "pop": [
        "@SP", 
        "M=M-1", 
        "@SEGM", 
        "D=M", 
        "@IDX", 
        "D=D+A", 
        "@R13", 
        "M=D", 
        "@SP", 
        "A=M", 
        "D=M", 
        "@R13", 
        "A=M", 
        "M=D"
    ],
    "pop_temp": [
        "@SP", 
        "M=M-1", 
        "@5", 
        "D=A", 
        "@IDX", 
        "D=D+A", 
        "@R13", 
        "M=D", 
        "@SP", 
        "A=M", 
        "D=M", 
        "@R13", 
        "A=M", 
        "M=D"
    ],
    "push": [
        "@SEGM",
        "D=M",
        "@IDX",
        "A=D+A",
        "D=M",
        "@SP",
        "A=M",
        "M=D",
        "@SP",
        "M=M+1"
    ],
    "push_temp": [
        "@5",
        "D=A",
        "@IDX",
        "A=D+A",
        "D=M",
        "@SP",
        "A=M",
        "M=D",
        "@SP",
        "M=M+1"
    ],
    "push_const": [
        "@IDX",
        "D=A",
        "@SP",
        "A=M",
        "M=D",
        "@SP",
        "M=M+1"
    ],
    "add": [
        "@SP",
        "M=M-1",
        "A=M",
        "D=M",
        "@SP",
        "A=M-1",
        "M=D+M"
    ],
    "sub": [
        "@SP",
        "M=M-1",
        "A=M",
        "D=M",
        "@SP",
        "A=M-1",
        "M=D-M"
    ],
    "eq": [             # ram[@SP] = 258, ram[257] = 17, ram[256] = 17
        "@SP",          # A = @SP
        "M=M-1",        # ram[@SP] = 257
        "A=M",          # A = 257
        "D=M",          # D = ram[257] = 17
        "A=A-1",        # A = 256
        "D-M;JEQ",      # 17 - ram[256] = 17 - 17 = 0
    ]
}

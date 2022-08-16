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
        "AM=M-1",
        "D=M",
        "@SP",
        "A=M-1",
        "M=D+M"
    ],
    "sub": [
        "@SP",
        "AM=M-1",
        "D=M",
        "@SP",
        "A=M-1",
        "M=D-M"
    ],
    "eq": [             # ram[0] = 258, ram[256] = 15, ram[257] = 17
        "@SP",          # A = 0
        "AM=M-1",       # A = ram[0] = ram[0] - 1 = 257
        "D=M",          # D = ram[257] = 17
        "A=A-1",        # A = 256
        "D=D-M",        # D = 17 - 15 = 2
        "M=-1",         # ram[256] = 1111111111111111
        "@ISEQ_count",  # A = @ISEQ
        "D;JEQ",        # if D = 1111111111111111 goto @ISEQ
        "@SP",          # A = 0
        "A=M-1",        # A = 256
        "M=0",          # ram[256] = 0000000000000000
        "(ISEQ_count)"
    ]
}

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
    "that": "THAT",
    "temp": "5"
}

templates = {
    "pop": [            # ram[@SP] = 257; ram[256] = 9
        "@SP",          # A = @SP 
        "M=M-1",        # ram[@SP] = ram[@SP] - 1 = 256
        "@SEGM",        # A = @SEGM
        "D=A",          # D = @SEGM
        "@IDX",         # A = @IDX 
        "D=D+A",        # D = @SEGM + @IDX
        "@R13",         # A = @R13
        "M=D",          # ram[@R13] = @SEGM + @IDX
        "@SP",          # A = @SP
        "A=M",          # A = ram[@SP] = 256
        "D=M",          # D = ram[256] = 9
        "@R13",         # A = @R13
        "A=M",          # A = @SEGM + @IDX
        "M=D"           # ram[@SEGM + @IDX] = 9
    ],
    "pop_th": [         # ram[@SP] = 257; ram[256] = 9
        "@SP",          # A = @SP 
        "M=M-1",        # ram[@SP] = ram[@SP] - 1 = 256
        "@SEGM",        # A = @SEGM
        "D=M",          # D = ram[@SEGM]
        "@IDX",         # A = @IDX 
        "D=D+A",        # D = ram[@SEGM] + @IDX
        "@R13",         # A = @R13
        "M=D",          # ram[@R13] = ram[@SEGM] + @IDX
        "@SP",          # A = @SP
        "A=M",          # A = ram[@SP] = 256
        "D=M",          # D = ram[256] = 9
        "@R13",         # A = @R13
        "A=M",          # A = ram[@SEGM] + @IDX
        "M=D"           # ram[ram[@SEGM] + @IDX] = 9
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
    "push_point": [
        "@SEGM",
        "D=M",
        "@SP",
        "A=M",
        "M=D",
        "@SP",
        "M=M+1"
    ],
    "push_temp": [
        "@SEGM",
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
    "add": [            # ram[@SP] = 258; ram[256] = 6; ram[257] = 3
        "@SP",          # A = @SP
        "AM=M-1",       # A = ram[@SP] = ram[@SP] - 1 = 257
        "D=M",          # D = ram[257] = 3
        "A=A-1",        # A = 256
        "M=D+M"         # ram[256] = 3 + ram[256] = 3 + 6 = 9
    ],
    "sub": [            # ram[@SP] = 258; ram[256] = 6; ram[257] = 3
        "@SP",          # A = @SP
        "AM=M-1",       # A = ram[@SP] = ram[@SP] - 1 = 257
        "D=-M",         # D = ram[257] = -3
        "A=A-1",        # A = 256
        "M=D+M"         # ram[256] = -3 + ram[256] = -3 + 6 = 3
    ],
    "comp": [           # ram[@SP] = 258; ram[256] = 15; ram[257] = 17
        "@SP",          # A = @SP
        "AM=M-1",       # A = ram[@SP] = ram[@SP] - 1 = 257
        "D=M",          # D = ram[257] = 17
        "A=A-1",        # A = 256
        "D=D-M",        # D = 17 - 15 = 2
        "D=-D",         # D = -2
        "M=-1",         # ram[256] = 1111111111111111
        "@COMP_count",  # A = @ISEQ
        "D;COMP",       # if D = 1111111111111111 goto @ISEQ
        "@SP",          # A = @SP
        "A=M-1",        # A = 256
        "M=0",          # ram[256] = 0000000000000000
        "(COMP_count)"
    ],
    "neg": [            # ram[@SP] = 257; ram[256] = 7
        "@SP",          # A = @SP
        "A=M-1",        # A = ram[@SP] - 1 = 256
        "M=-M"          # ram[256] = -ram[256]
    ],
    "log": [
        "@SP",
        "AM=M-1",
        "D=M",
        "A=A-1",
        "M=LOG"
    ],
    "not": [
        "@SP",
        "A=M-1",
        "M=!M"          # ram[256] = -ram[256]
    ]
}

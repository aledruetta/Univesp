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
    "temp": "TEMP"
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
    "push_const": [
        "@IDX",
        "D=A",
        "@SP",
        "A=M",
        "M=D",
        "@SP",
        "M=M+1"
    ]
}

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
    "pop": ["@SP", "M=M-1", "A=M", "D=M", "@SEGM", "M=D"],
    "push": []
}

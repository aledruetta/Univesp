from symtable import SymbolTable


class Parser:
    commands = ("@", "0", "A", "M", "D")
    symbolTable = {
        "R0": 0, "R1": 1, "R2": 2, "R3": 3, "R4": 4, "R5": 5, "R6": 6, "R7": 7,
        "R8": 8, "R9": 9, "R10": 10, "R11": 11, "R12": 12, "R13": 13, "R14": 14, "R15": 15,
        "SP": 0, "LCL": 1, "ARG": 2, "THIS": 3, "THAT": 4,
        "SCREEN": 16384, "KBD": 24576
    }

    def __init__(self, asm) -> None:
        self.asm = asm

    def parse(self):
        self.strip_asm()
        self.fill_labels()
        self.fill_vars()
        self.replace_symbols()

        return self.asm
    
    def strip_asm(self):
        stripped = []

        for i in range(len(self.asm)):
            self.asm[i] = self.asm[i].rsplit("/")[0].strip()
            if len(self.asm[i]) != 0 and (self.asm[i][0] in Parser.commands or self.asm[i][0] == "("):
                stripped.append(self.asm[i])

        self.asm = stripped

    def fill_labels(self):
        filtered = []
        line_number = 0

        for i in range(len(self.asm)):
            if self.asm[i][0] in Parser.commands:
                line_number += 1

            if self.asm[i].startswith("("):
                label = self.asm[i].replace("(", "").replace(")", "").replace("\n", "")
                if label not in Parser.symbolTable.keys():
                    Parser.symbolTable[label] = line_number
            else:
                filtered.append(self.asm[i])

        self.asm = filtered
    
    def fill_vars(self):
        ptr = 16
        for line in self.asm:
            if line.startswith("@"):
                value = line[1:]
                if not value.isnumeric() and value not in Parser.symbolTable.keys():
                    Parser.symbolTable[value] = ptr
                    ptr += 1
    
    def replace_symbols(self):
        for i in range(len(self.asm)):
            line = self.asm[i]
            symbol = line[1:]
            if line.startswith("@") and symbol in Parser.symbolTable.keys():
                self.asm[i] = "@" + str(Parser.symbolTable[symbol])

import Parser

class Coder:
    COMP_0 = {
        "0": "101010",
        "1": "111111",
        "-1": "111010",
        "D": "001100",
        "A": "110000",
        "!D": "001101",
        "!A": "110001",
        "-D": "001111",
        "-A": "110011",
        "D+1": "011111",
        "A+1": "110111",
        "D-1": "001110",
        "A-1": "110010",
        "D+A": "000010",
        "D-A": "010011",
        "A-D": "000111",
        "D&A": "000000",
        "D|A": "010101"
    }
    COMP_1 = {
        "M": "110000",
        "!M": "110001",
        "-M": "110011",
        "M+1": "110111",
        "M-1": "110010",
        "D+M": "000010",
        "D-M": "010011",
        "M-D": "000111",
        "D&M": "000000",
        "D|M": "010101"
    }
    DEST = {
        "null": "000",
        "M": "001",
        "D": "010",
        "MD": "011",
        "A": "100",
        "AM": "101",
        "AD": "110",
        "ADM": "111",
    }
    JUMP = {
        "null": "000",
        "JGT": "001",
        "JEQ": "010",
        "JGE": "011",
        "JLT": "100",
        "JNE": "101",
        "JLE": "110",
        "JMP": "111",
    }

    def __init__(self, parsed) -> None:
        self.parsed = parsed
        self.encoded = []

    def encode(self):
        for i in range(len(self.parsed)):
            line = self.parsed[i]

            if line.startswith("@"):
                binary = self.__encodeA(line)
            else:
                binary = self.__encodeC(line)

            if binary is not None:
                self.encoded.append(binary)

        return self.encoded

    def __comp(self, comp):
        out = ""

        if comp != "":
            if comp in Coder.COMP_0: 
                out += "0" + Coder.COMP_0[comp]
            else:
                out += "1" + Coder.COMP_1[comp]
        
        return out

    def __encodeA(self, line):
        binary = bin(int(line[1:]))[2:]
        return "0" + binary.rjust(15, "0")

    def __encodeC(self, line):
        out = "111"
        comp = ""
        dest = ""
        jump = ""

        if line.find("=") > 0:
            dest = line.split("=")[0].strip()
            comp = line.split("=")[1].strip()
        if line.find(";") > 0:
            comp = line.split(";")[0].strip()
            jump = line.split(";")[1].strip()

        out += self.__comp(comp)
        out += Coder.DEST[dest] if dest in Coder.DEST.keys() else "000"
        out += Coder.JUMP[jump] if jump in Coder.JUMP.keys() else "000"

        return out

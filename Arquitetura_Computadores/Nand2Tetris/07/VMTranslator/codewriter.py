from utilities import *

class CodeWriter:
    label_count = 0

    def __init__(self, filename) -> None:
        self.filename = filename

    def write_arithmetic(self, command):
        code = ["// " + command]

        if command == "add":
            code.extend([
                "@SP",
                "AM=M-1",
                "D=M",
                "A=A-1",
                "M=D+M"
            ])
        elif command == "sub":
            code.extend([
                "@SP",
                "AM=M-1",
                "D=-M",
                "A=A-1",
                "M=D+M"
            ])
        elif command in ["eq", "lt", "gt"]:
            comp = f"J{command.upper()}"

            code.extend([
                "@SP",
                "AM=M-1",
                "D=M",
                "A=A-1",
                "D=D-M",
                "D=-D",
                "M=-1",
                "@COMP_count".replace("COMP", comp),
                "D;COMP".replace("COMP", comp),
                "@SP",
                "A=M-1",
                "M=0",
                "(COMP_count)".replace("COMP", comp)
            ])
        elif command == "neg":
            code.extend([
                "@SP",
                "A=M-1",
                "M=-M"
            ])
        elif command in ["and", "or"]:
            code.extend([
                "@SP",
                "AM=M-1",
                "D=M",
                "A=A-1",
                "M=LOG".replace("LOG", "D&M" if command == "and" else "D|M")
            ])
        elif command == "not":
            code.extend([
                "@SP",
                "A=M-1",
                "M=!M"
            ])
        else:
            pass
        
        self.__write(self.label_replace(code))

    def write_push(self, command, segment, index):
        code = [f"// {command} {segment} {index}"]

        if segment == "constant":
            code.extend([
                "@" + index,
                "D=A",
                "@SP",
                "A=M",
                "M=D",
                "@SP",
                "M=M+1"
            ])

        self.__write(code)
    
    def label_replace(self, code):
        new_code = []

        for comm in code:
            if comm.find("_count"):
                CodeWriter.label_count += 1
                break

        for comm in code:
            if comm.find("_count"):
                comm = comm.replace("count", str(CodeWriter.label_count))
            new_code.append(comm)

        return new_code

    def __write(self, code):
        with open("./output/" + self.filename, "a") as fp:
            fp.write("\n".join(code) + "\n")

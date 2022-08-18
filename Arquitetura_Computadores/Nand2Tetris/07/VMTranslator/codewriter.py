from utilities import *

class CodeWriter:
    label_count = 0

    def __init__(self, filename) -> None:
        self.filename = filename

    def write_arithmetic(self, command):
        code = ["// " + command]
        if command in ["eq", "lt", "gt"]:
            template = "comp"
        elif command in ["and", "or"]:
            template = "log"
        else:
            template = command

        for comm in templates[template]:
            if command == "eq":
                comm = comm.replace("COMP", "JEQ")
            elif command == "lt":
                comm = comm.replace("COMP", "JLT")
            elif command == "gt":
                comm = comm.replace("COMP", "JGT")
            elif command == "and":
                comm = comm.replace("LOG", "D&M")
            elif command == "or":
                comm = comm.replace("LOG", "D|M")

            code.append(comm)
        
        self.__write(self.label_replace(code))
    
    def write_push_pop(self, parser):
        segm = parser.arg1()
        index = parser.arg2()

        if parser.command_type() == C_PUSH:
            if segm == "constant":
                name = "push_const"
            elif segm == "temp":
                name = "push_temp"
            else:
                name = "push"
        else:
            if segm == "constant":
                name = "pop_const"
            elif segm == "temp":
                name = "pop_temp"
            else:
                name = "pop"

        code = ["// " + " ".join(parser.command)]

        for comm in templates[name]:
            comm = comm.replace("SEGM", segments.setdefault(segm, ""))
            code.append(comm.replace("IDX", str(index)))

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
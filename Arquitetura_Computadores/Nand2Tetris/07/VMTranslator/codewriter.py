from utilities import *

class CodeWriter:
    def __init__(self, filename) -> None:
        self.filename = filename

    def write_arithmetic(self, command):
        code = ["// " + command]
        for comm in templates[command]:
            code.append(comm)

        self.__write(code)

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

    def __write(self, code):
        with open("./output/" + self.filename, "a") as fp:
            fp.write("\n".join(code) + "\n")
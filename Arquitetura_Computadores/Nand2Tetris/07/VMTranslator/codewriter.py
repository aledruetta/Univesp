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

        name = "push" if parser.command_type() == C_PUSH else "pop"
        if name == "push" and segm == "constant":
            name = "push_const"

        code = ["// " + " ".join(parser.command)]

        for comm in templates[name]:
            if name == "push_const":
                code.append(comm.replace("IDX", str(index)))
            else:
                code.append(comm.replace("SEGM", segments[segm]).replace("IDX", str(index)))

        self.__write(code)

    def __write(self, code):
        with open("./output/" + self.filename, "a") as fp:
            fp.write("\n".join(code) + "\n")
from utilities import *

class CodeWriter:
    def __init__(self, filename) -> None:
        self.filename = filename

    def write_arithmetic(self, command):
        pass

    def write_push_pop(self, parser):
        if parser.command_type() == C_PUSH:
            # self.__write(templates["push"])
            pass
        elif parser.command_type() == C_POP:
            code = ["// " + " ".join(parser.command)]
            code.extend([e.replace("SEGM", segments[parser.arg1()]).replace("IDX", str(parser.arg2())) for e in templates["pop"]])
            self.__write(code)

    def __write(self, code):
        with open("./output/" + self.filename, "a") as fp:
            fp.write("\n".join(code) + "\n")
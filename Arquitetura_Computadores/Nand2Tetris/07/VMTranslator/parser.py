from utilities import *

class Parser:
    def __init__(self, path):
        self.path = path
        self.lines = Parser.__readlines(path)
        self.command = []

    @staticmethod
    def __readlines(path):
        with open(path, "r") as fp:
            return fp.readlines()
    
    def has_more_lines(self):
        return True if len(self.lines) > 0 else False

    def advance(self):
        command = self.lines.pop(0).strip()
        while len(self.lines) and (command.startswith("/") or len(command)) == 0:
            command = self.lines.pop(0).strip()

        self.command = [com.strip() for com in command.replace("\n", "").split()]
    
    def command_type(self):
        comm = self.command[0]

        if comm == "push":
            return C_PUSH
        elif comm == "pop":
            return C_POP
        elif comm in ["add", "sub", "neg", "eq", "gt", "lt", "and", "or", "not"]:
            return C_ARITHMETIC

    def arg1(self):
        return self.command[0] if self.command_type() == C_ARITHMETIC else self.command[1]
    
    def arg2(self):
        if self.command_type() in [C_PUSH, C_POP, C_FUNCTION, C_CALL]:
            return int(self.command[2])


C_ARITHMETIC = 0
C_PUSH = 1
C_POP = 2
C_LABEL = 3
C_GOTO = 4
C_IF = 5
C_FUNCTION = 6
C_RETURN = 7
C_CALL = 8

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
        while command.startswith("/") or len(command) == 0:
            command = self.lines.pop(0).strip()

        self.command = [com.strip() for com in command.replace("\n", "").split()]
    
    def command_type(self):
        com = self.command[0]

        if com == "push":
            return C_PUSH
        elif com == "pop":
            return C_POP
        elif com in ["add", "sub", "neg", "eq", "gt", "lt", "and", "or", "not"]:
            return C_ARITHMETIC

    def arg1(self):
        return self.command[0] if self.command_type() == C_ARITHMETIC else self.command[1]
    
    def arg2(self):
        if self.command_type() in [C_PUSH, C_POP, C_FUNCTION, C_CALL]:
            return int(self.command[2])

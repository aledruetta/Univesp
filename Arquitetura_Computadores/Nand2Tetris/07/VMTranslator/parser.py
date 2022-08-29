from pathlib import Path
from typing import List

from utilities import *


class Parser:
    def __init__(self, path: Path):
        self.path = path
        self.lines = Parser.__readlines(path)
        self.command: List[str] = []
    
    def has_more_lines(self) -> bool:
        return True if len(self.lines) > 0 else False

    def advance(self) -> None:
        command = self.lines.pop(0).strip()
        while len(self.lines) and (command.startswith("/") or len(command)) == 0:
            command = self.lines.pop(0).strip()

        self.command = [com.strip() for com in command.replace("\n", "").split()]
    
    @property
    def command_type(self) -> int | None:
        comm = self.command[0]

        if comm == "push":
            return C_PUSH
        elif comm == "pop":
            return C_POP
        elif comm in ["add", "sub", "neg", "eq", "gt", "lt", "and", "or", "not"]:
            return C_ARITHMETIC
        return None

    @property
    def arg1(self) -> str:
        return self.command[0] if self.command_type == C_ARITHMETIC else self.command[1]
    
    @property
    def arg2(self) -> str | None:
        if self.command_type in [C_PUSH, C_POP, C_FUNCTION, C_CALL]:
            return self.command[2]
        return None

    @staticmethod
    def __readlines(path: Path) -> List[str]:
        with open(path, "r") as fp:
            return fp.readlines()

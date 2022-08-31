from pathlib import Path
from typing import List

from utilities import *


class CodeWriter:
    label_count = 0

    def __init__(self, path: Path) -> None:
        self.path = path.with_suffix(".asm")
    
    def write_bootstrap(self) -> None:
        """ """

        code = ["// bootstrap code", "@256", "D=M", "@0", "M=D"].extend(self.__call("Sys.init", 0))
        self.__write(code)

    def write_arithmetic(self, command: str) -> None:
        """Writes to the output file the assembly code that implements
        the given arithmetic-logical command (add, sub, neg, eq, lt, gt, and, or, not)
        """

        code = ["// " + command]

        # Add command
        if command == "add":
            code.extend(["@SP", "AM=M-1", "D=M", "A=A-1", "M=D+M"])
        # Sub command
        elif command == "sub":
            code.extend(["@SP", "AM=M-1", "D=-M", "A=A-1", "M=D+M"])
        # Comparisson commands
        elif command in ["eq", "lt", "gt"]:
            comp = f"J{command.upper()}"

            code.extend(
                [
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
                    "(COMP_count)".replace("COMP", comp),
                ]
            )
        # Negation command
        elif command == "neg":
            code.extend(["@SP", "A=M-1", "M=-M"])
        # Logical and, or, commands
        elif command in ["and", "or"]:
            code.extend(
                [
                    "@SP",
                    "AM=M-1",
                    "D=M",
                    "A=A-1",
                    "M=LOG".replace("LOG", "D&M" if command == "and" else "D|M"),
                ]
            )
        # Logical not command
        elif command == "not":
            code.extend(["@SP", "A=M-1", "M=!M"])

        self.__write(self.__label_replace(code))

    def write_push(self, segment: str, index: str) -> None:
        """Writes to the output file the assembly code that implements
        the given push command
        """

        code = [f"// push {segment} {index}"]
        code.extend(self.__push(segment, index))
        self.__write(code)

    def __push(self, segment: str, index: str) -> List[str]:
        code = []

        # push constant
        if segment == "constant":
            code.extend(["@" + index, "D=A"])
        # push pointer
        elif segment == "pointer":
            code.extend(["@" + ("THIS" if index == "0" else "THAT"), "D=M"])
        # push static
        elif segment == "static":
            code.extend([f"@{self.path.stem}.{index}", "D=M"])
        else:
            # push temp
            if segment == "temp":
                code.extend(["@" + str(C_TEMP_BASE), "D=A"])
            # push this, that, local, argument
            else:
                code.extend(["@" + segments[segment], "D=M"])
            code.extend(["@" + index, "A=D+A", "D=M"])

        code.extend(["@SP", "A=M", "M=D", "@SP", "M=M+1"])

        return code

    def write_pop(self, segment: str, index: str) -> None:
        """Writes to the output file the assembly code that implements
        the given pop command
        """

        code = [f"// pop {segment} {index}"]
        code.extend(self.__pop(segment, index))
        self.__write(code)

    def __pop(self, segment: str, index: str) -> List[str]:
        code = []

        # pop pointer
        if segment == "pointer":
            code.extend(["@" + ("THIS" if index == "0" else "THAT"), "D=A"])
        # pop static
        elif segment == "static":
            code.extend([f"@{self.path.stem}.{index}", "D=A"])
        else:
            # pop temp
            if segment == "temp":
                code.extend(["@5", "D=A"])
            # pop local, this, that, argument
            else:
                code.extend(["@" + segments[segment], "D=M"])
            code.extend(["@" + index, "D=D+A"])

        code.extend(["@R13", "M=D", "@SP", "AM=M-1", "D=M", "@R13", "A=M", "M=D"])

        return code

    def write_goto(self, label: str) -> None:
        """Writes assembly code that effects the goto command"""

        code = [f"// goto {label}"]
        code.extend(["@" + label, "0;JMP"])
        self.__write(code)

    def write_if(self, label: str) -> None:
        """Writes assembly code that effects the if-goto command"""

        code = [f"// if-goto {label}"]
        code.extend(
            [
                "@SP",
                "AM=M-1",
                "D=M",
                "@" + label,
                "D;JNE",  # if D=1111...1 (-1 or true) then jump, else (D=0000...0 or false) continue
            ]
        )
        self.__write(code)

    def write_label(self, label: str) -> None:
        """Writes assembly code that effects the label command"""

        code = [f"// label {label}", f"({label})"]
        self.__write(code)

    def write_function(self, name: str, n_locals: int) -> None:
        """ """

        # Insert comment and label
        code = [f"// function {name} {n_locals}", f"({name})"]

        # Push n local variables into the stack
        for i in range(n_locals):
            code.extend(self.__push("constant", "0"))

        self.__write(code)

    def write_call(self, name: str, n_args: int) -> None:
        """ """
    
    def __call(self, name: str, n_args: int) -> None:
        """ """

    def write_return(self) -> None:
        """ """

    def __label_replace(self, code: list) -> list:
        """Label replacing"""

        if any(cmd.find("_count") for cmd in code):
            CodeWriter.label_count += 1
            return [cmd.replace("count", str(CodeWriter.label_count)) for cmd in code]

        return code

    def __write(self, code: list) -> None:
        """Writes to a file"""

        with open(self.path, "a") as fp:
            fp.write("\n".join(code) + "\n")

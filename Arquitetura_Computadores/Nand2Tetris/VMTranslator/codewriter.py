from pathlib import Path
from typing import List

from utilities import *


class CodeWriter:
    label_count = 0

    def __init__(self, input: Path, output: Path) -> None:
        self.input = input.with_suffix(".asm")
        self.output = output
        self.filename = input.stem
        self.__func_name: str | None = None
        self.__call_count = 0

    def write_bootstrap(self) -> None:
        """ """

        self.__write(["// bootstrap code", "@256", "D=M", "@0", "M=D"])
        self.write_call("Sys.init", 0)

    def write_arithmetic(self, command: str, comment=True) -> None:
        """Writes to the output file the assembly code that implements
        the given arithmetic-logical command (add, sub, neg, eq, lt, gt, and, or, not)
        """

        if comment:
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

    def write_push(self, segment: str, index: str, comment=True) -> None:
        """Writes to the output file the assembly code that implements
        the given push command
        """

        if comment:
            code = [f"// push {segment} {index}"]

        # push constant
        if segment == "constant":
            code.extend(["@" + index, "D=A"])
        # push pointer
        elif segment == "pointer":
            code.extend(["@" + ("THIS" if index == "0" else "THAT"), "D=M"])
        # push static
        elif segment == "static":
            code.extend([f"@{self.filename}.{index}", "D=M"])
        elif segment == "memory":
            code.extend([f"@{index}", "D=M"])
        else:
            # push temp
            if segment == "temp":
                code.extend(["@" + str(C_TEMP_BASE), "D=A"])
            # push this, that, local, argument
            else:
                code.extend(["@" + segments[segment], "D=M"])
            code.extend(["@" + index, "A=D+A", "D=M"])

        code.extend(["@SP", "A=M", "M=D", "@SP", "M=M+1"])

        self.__write(code)

    def write_pop(self, segment: str, index: str, comment=True) -> None:
        """Writes to the output file the assembly code that implements
        the given pop command
        """

        if comment:
            code = [f"// pop {segment} {index}"]

        # pop pointer
        if segment == "pointer":
            code.extend(["@" + ("THIS" if index == "0" else "THAT"), "D=A"])
        # pop static
        elif segment == "static":
            code.extend([f"@{self.filename}.{index}", "D=A"])
        elif segment == "memory":
            code.extend([f"@{index}", "D=A"])
        else:
            # pop temp
            if segment == "temp":
                code.extend(["@5", "D=A"])
            # pop local, this, that, argument
            else:
                code.extend(["@" + segments[segment], "D=M"])
            code.extend(["@" + index, "D=D+A"])

        code.extend(["@R13", "M=D", "@SP", "AM=M-1", "D=M", "@R13", "A=M", "M=D"])

        self.__write(code)

    def write_goto(self, label: str, comment=True) -> None:
        """Writes assembly code that effects the goto command"""

        if comment:
            self.__write([f"// goto {label}"])

        self.__write(["@" + self.__label(label), "0;JMP"])

    def write_if(self, label: str, comment=True) -> None:
        """Writes assembly code that effects the if-goto command"""

        if comment:
            self.__write([f"// if-goto {label}"])

        self.__write(
            [
                "@SP",
                "AM=M-1",
                "D=M",
                "@" + self.__label(label),
                "D;JNE",  # if D=1111...1 (-1 or true) then jump, else (D=0000...0 or false) continue
            ]
        )

    def write_label(self, label: str, comment=True) -> None:
        """Writes assembly code that effects the label command"""

        if comment:
            self.__write([f"// label {label}"])
        self.__write([f"({self.__label(label)})"])

    def __label(self, label: str) -> str:
        """function foo -> (fileName.foo)
        label bar    -> (fileName.foo$bar)
        return       -> (fileName.foo$ret.i)
        """

        new_label = f"{self.filename}."

        if self.__func_name:
            new_label += f"{self.__func_name}${label}"
            if label == "ret":
                new_label += f".{str(self.__call_count)}"
        else:
            new_label += f"{label}"

        return new_label

    def __label_replace(self, code: list) -> List[str]:
        """Label replacing"""

        if any(cmd.find("_count") for cmd in code):
            CodeWriter.label_count += 1
            return [cmd.replace("count", str(CodeWriter.label_count)) for cmd in code]

        return code

    def write_function(self, label: str, nloc: int, comment=True) -> None:
        """function fileName.foo n"""

        self.__func_name = label

        # Insert comment and label
        if comment:
            self.__write([f"// function {label} {nloc}", f"({label})"])

        # Push n local variables into the stack
        for i in range(nloc):
            self.write_push("constant", "0")
            self.write_pop("local", str(i))

    def write_call(self, name: str, nargs: int, comment=True) -> None:
        """ """

        if comment:
            self.__write([f"// call {name} {nargs}"])

        retAddr = self.__label("ret")  # fileName.foo$ret.i
        self.write_push("constant", retAddr)  # push returnAddress
        self.__write(  # push LCL, ARG, THIS and THAT
            [
                [f"@{segment}", "D=M", "@SP", "A=M", "M=D", "@SP", "M=M+1"]
                for segment in ("LCL", "ARG", "THIS", "THAT")
            ]
        )
        self.write_push("memory", "SP")  # push *SP
        self.write_push("constant", "5")  # push constant 5
        self.write_arithmetic("sub")  # sub
        self.write_push("constant", str(nargs))  # push constant nargs
        self.write_arithmetic("sub")  # sub
        self.write_pop("memory", "ARG")  # pop ARG

    def write_return(self) -> None:
        """ """

        code = []

        self.__func_name = ""
        self.__call_count = 0

        self.__write(code)

    def __write(self, code: list) -> None:
        """Writes to a file"""

        with open(self.output, "a") as fp:
            fp.write("\n".join(code) + "\n")

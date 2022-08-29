from pathlib import Path
from utilities import *

class CodeWriter:
    label_count = 0

    def __init__(self, path: Path) -> None:
        self.output = Path(f"./output/").joinpath(path.stem).joinpath(path.name).with_suffix(".asm")


    def write_arithmetic(self, command: str) -> None:
        """ Writes to the output file the assembly code that implements
            the given arithmetic-logical command (add, sub, neg, eq, lt, gt, and, or, not)
        """

        code = ["// " + command]

        # Add command
        if command == "add":
            code.extend([
                "@SP",
                "AM=M-1",
                "D=M",
                "A=A-1",
                "M=D+M"
            ])
        # Sub command
        elif command == "sub":
            code.extend([
                "@SP",
                "AM=M-1",
                "D=-M",
                "A=A-1",
                "M=D+M"
            ])
        # Comparisson commands
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
        # Negation command
        elif command == "neg":
            code.extend([
                "@SP",
                "A=M-1",
                "M=-M"
            ])
        # Logical and, or, commands
        elif command in ["and", "or"]:
            code.extend([
                "@SP",
                "AM=M-1",
                "D=M",
                "A=A-1",
                "M=LOG".replace("LOG", "D&M" if command == "and" else "D|M")
            ])
        # Logical not command
        elif command == "not":
            code.extend([
                "@SP",
                "A=M-1",
                "M=!M"
            ])
        else:
            pass
        
        self.__write(self.__label_replace(code))


    def write_push(self, segment: str, index: str) -> None:
        """ Writes to the output file the assembly code that implements
            the given push command
        """

        code = [f"// push {segment} {index}"]

        # push constant
        if segment == "constant":
            code.extend([
                "@" + index,
                "D=A"
            ])
        # push pointer
        elif segment == "pointer":
            code.extend([
                "@" + ("THIS" if index == "0" else "THAT"),
                "D=M"
            ])
        # push static
        elif segment == "static":
            code.extend([
                f"@{self.filename.removesuffix('.asm')}.{index}",
                "D=M"
            ])
        else:
            # push temp
            if segment == "temp":
                code.extend([
                    "@" + C_TEMP_BASE,
                    "D=A"
                ])
            # push this, that, local, argument
            else:
                code.extend([
                    "@" + segments[segment],
                    "D=M"
                ])
            code.extend([
                "@" + index,
                "A=D+A",
                "D=M"
            ])

        code.extend([
                "@SP",
                "A=M",
                "M=D",
                "@SP",
                "M=M+1"
        ])

        self.__write(code)


    def write_pop(self, segment: str, index: str) -> None:
        """ Writes to the output file the assembly code that implements
            the given pop command
        """

        code = [f"// pop {segment} {index}"]

        # pop pointer
        if segment == "pointer":
            code.extend([
                "@" + ("THIS" if index == "0" else "THAT"),
                "D=A"
            ])
        # pop static
        elif segment == "static":
            code.extend([
                f"@{self.filename.removesuffix('.asm')}.{index}",
                "D=A"
            ])
        else:
            # pop temp
            if segment == "temp":
                code.extend([
                    "@5",
                    "D=A",
                ])
            # pop local, this, that, argument
            else:
                code.extend([
                    "@" + segments[segment],
                    "D=M",
                ])
            code.extend([
                "@" + index,
                "D=D+A"
            ])

        code.extend([
            "@R13",
            "M=D",
            "@SP",
            "AM=M-1",
            "D=M",
            "@R13",
            "A=M",
            "M=D"
        ])

        self.__write(code)
    

    def write_goto(self, label: str) -> None:
        """ Writes assembly code that effects the goto command """

        code = [f"// goto {label}"]

        code.extend([
            "@" + label,
            "0;JMP"
        ])

        self.__write(code)
    

    def write_if(self, label: str) -> None:
        """ Writes assembly code that effects the if-goto command """

        code = [f"// if-goto {label}"]

        code.extend([
            "@SP",
            "A=M-1",
            "D=M",
            "@" + label,
            "D;JLT"        # if D=1111...1 (-1 or true) then jump, else (D=0000...0 or false) continue
        ])

        self.__write(code)
    

    def write_label(self, label: str) -> None:
        """ Writes assembly code that effects the label command """

        code = [f"// label {label}"]

        code.extend([
            f"({label})"
        ])
    
    
    def __label_replace(self, code: list) -> list:
        """ Label replacing """

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


    def __write(self, code: list) -> None:
        """ Writes to a file """

        self.output.parent.mkdir(parents=True, exist_ok=True)

        with open(self.output, "a") as fp:
            fp.write("\n".join(code) + "\n")

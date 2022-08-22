from utilities import *

class CodeWriter:
    label_count = 0

    def __init__(self, filename: str) -> None:
        self.filename = filename


    """ Arithmetic and Logic

        Writes to the output file the assembly code that implements
        the given arithmetic-logical command (add, sub, neg, eq, lt, gt, and, or, not)
    """
    def write_arithmetic(self, command: str) -> None:
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


    """ Stack: Push
    
        Writes to the output file the assembly code that implements
        the given push command
    """
    def write_push(self, segment: str, index: str) -> None:
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
                    "@5",
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


    """ Stack: Pop
    
        Writes to the output file the assembly code that implements
        the given pop command
    """
    def write_pop(self, segment: str, index: str) -> None:
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
    

    """ GoTo

        Writes assembly code that effects the goto command
    """
    def write_goto(self, label: str) -> None:
        code = [f"// goto {label}"]

        code.extend([
            "@" + label,
            "0;JMP"
        ])

        self.__write(code)
    

    """ If-GoTo

        Writes assembly code that effects the if-goto command
    """
    def write_If(self, label: str) -> None:
        code = [f"// if-goto {label}"]

        code.extend([
            "@SP",
            "A=M-1",
            "D=M",
            "!D;JEQ " + label
        ])

        self.__write(code)
    
    
    """ Label replacing
    """
    def __label_replace(self, code: list) -> list:
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


    """ Write to a file
    """
    def __write(self, code: list) -> None:
        with open("./output/" + self.filename, "a") as fp:
            fp.write("\n".join(code) + "\n")

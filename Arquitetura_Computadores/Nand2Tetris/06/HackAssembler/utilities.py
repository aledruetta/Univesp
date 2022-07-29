def read(path):
    with open(path, "r", encoding="utf-8") as asm_file:
        return asm_file.readlines()

def write(filename, binary):
    with open(f"./output/{filename}", "w") as hack_file:
        for line in binary:
            hack_file.write(line + "\n")

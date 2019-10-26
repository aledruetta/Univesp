class BinNumber:
    bits = 8
    comp = 0
    def __init__(self, number):
        self.__number = number

    def mode(self):
        if BinNumber.comp == 0: return "sinal-magnitude"
        if BinNumber.comp == 1: return "complemento de 1"
        if BinNumber.comp == 2: return "complemento de 2"

    def sm(self):
        return bin(self.__number)[2:].rjust(BinNumber.bits, '0')

    def c1(self):
        bToC1 = ""
        for ch in self.sm():
            if ch == '0': bToC1 += '1'
            else: bToC1 += '0'
        return bToC1

    def c2(self):
        bToC2 = bin(int('0b' + self.c1(), 2) + 1)[2:].rjust(BinNumber.bits, '0')
        return bToC2

    def dec(self):
        return self.__number

    def hex(self):
        return hex(self.__number)[2:]

    def oct(self):
        return oct(self.__number)[2:]

    def __add__(self, n):
        pass

    def __str__(self):
        if BinNumber.comp == 0:
            b = self.sm()
        if BinNumber.comp == 1:
            b = self.c1()
        if BinNumber.comp == 2:
            b = self.c2()

        return b[-BinNumber.bits:]

    def __repr__(self):
        if BinNumber.comp == 0:
            b = self.sm()
        if BinNumber.comp == 1:
            b = self.c1()
        if BinNumber.comp == 2:
            b = self.c2()

        return b[-BinNumber.bits:]


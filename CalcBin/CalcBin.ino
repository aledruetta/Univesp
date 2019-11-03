/*
 * Calculadora binária simples de 8 bits
 * em complemento de 2.
 *
 * Author: Alejandro Druetta
 * Date: 2019.11.03
 * Organization: Univesp - Eng. da Computação
 *
 */

#define BUTTON_SEL 11
#define BUTTON_SET 12
#define OPER1 0
#define OPER2 1
#define RESUL 2

byte number = B00000000;

byte regA = B00000000;
byte regB = B00000000;
int step = OPER1;

int pos = 0;

int set_status = 0;
int sel_status = 0;
int set_status_prev = 0;
int sel_status_prev = 0;

void debugLeds (byte);
void debugButtons ();
void blink ();
byte sumRegs ();
void setButtomEventHandler ();
void selButtomEventHandler ();

void setup ()
{
    for (int i=0; i<9; i++) {
        pinMode (i+2, OUTPUT);
    }
    pinMode (BUTTON_SEL, INPUT);
    pinMode (BUTTON_SET, INPUT);

    Serial.begin (9600);
    delay (1000);
}

void loop ()
{
    set_status = digitalRead (BUTTON_SET);
    sel_status = digitalRead (BUTTON_SEL);

    selButtomEventHandler ();
    setButtomEventHandler ();

    for (int i=0; i<8; i++) {
        digitalWrite (i+2, bitRead (number, i));
    }

    blinkBit ();
    debugLeds (number);
    debugLeds (regA);
    debugLeds (regB);
    debugButtons ();

    delay (200);
}

void selButtomEventHandler ()
{
    if (sel_status && !sel_status_prev) {
        if (pos < 8) pos++;
        else pos = 0;
    }
}

void setButtomEventHandler ()
{
    if (set_status && !set_status_prev) {
        if (pos != 8) {
            int b = bitRead (number, pos);
            int new_b = (b == 1) ? 0 : 1;
            Serial.println (b);
            Serial.println (new_b);
            bitWrite (number, pos, new_b);
        }
        else {
            switch (step) {
                case OPER1:
                    regA = number;
                    number = B00000000;
                    step = OPER2;
                    pos = 0;
                    break;
                case OPER2:
                    regB = number;
                    number = sumRegs ();
                    step = RESUL;
                    break;
                case RESUL:
                    number = B00000000;
                    regA = B00000000;
                    regB = B00000000;
                    step = OPER1;
                    pos = 0;
                    break;
            }
        }
    }
}

byte sumRegs ()
{
    bool flag = false;

    for (int i=7; i>=0; i--) {
        uint8_t b;
        uint8_t bitA = bitRead (regA, i);
        uint8_t bitB = bitRead (regB, i);

        if (flag) {
            if (bitA == bitB) {
                b = 1;
                if (bitA == 0) flag = false;
            }
            else b = 0;
        }
        else {
            if (bitA == bitB) {
                b = 0;
                if (bitA == 1) flag = true;
            }
            else b = 1;

        }
        bitWrite (number, i, b);
    }
    return number;
}

void blinkBit ()
{
    if (bitRead (number, pos) == 0 && step != 2) {
        digitalWrite (pos + 2, HIGH);
        delay (200);
        digitalWrite (pos + 2, LOW);
        delay (200);
    }
    else delay (400);
}

void debugLeds (byte b)
{
    for (int i=0; i<8; i++) {
        Serial.print (bitRead (b, i));
    }
    Serial.println ();
}

void debugButtons ()
{
    Serial.print ("SEL ");
    Serial.print (digitalRead (BUTTON_SEL));
    Serial.print (" SET ");
    Serial.println (digitalRead (BUTTON_SET));
}

main:
    SET R7, 0xFF
    SET R0, p
    SET R1, 0x10

    CALL |R7|, modarray

halt:
    JMP halt

modarray:
    PUSH |R7|, R2
    PUSH |R7|, R3
    PUSH |R7|, R4
    PUSH |R7|, R5
    PUSH |R7|, R6
    SET R3, 0x01
    SET R4, 0x03
    SET R5, 0X00

CICLO:
    LOAD R6, [R0]
    MOV R2, R6
    ADD R5, R3
    AND R6, R4
    JZ MULTI
    JMP NOMULTI

MULTI:
    MOV R6, R2
    SHR R6, 1
    PUSH |R7|, R3
    ADD R3, R3
    SUB R6, R3
    POP |R7|, R3
    STR [R0], R6
    ADD R0, R3
    CMP R5, R1
    JN CICLO
    JMP END

NOMULTI:
    MOV R6, R2
    SHL R6, 3
    SUB R6, R2
    ADD R6, R3
    STR [R0], R6
    ADD R0, R3
    CMP R5, R1
    JN CICLO
    JMP END

END:
    STRPOP [R0], R7  ; Instrucción STRPOP
    ANDOR R7, R7     ; Nueva instrucción ANDOR
    RET |R7|

p:
DB 0x01
DB 0x02
DB 0x04
DB 0x08
DB 0x03
DB 0x03
DB 0xA1
DB 0xC0
DB 0xFF
DB 0x40
DB 0x55
DB 0xCC
DB 0xBD
DB 0x45
DB 0x9A
DB 0xEE

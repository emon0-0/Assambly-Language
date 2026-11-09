.MODEL SMALL
.STACK 100H

.DATA
MSG1 DB 'Enter Dividend: $'
MSG2 DB 13,10,'Enter Divisor: $'
MSG3 DB 13,10,'Quotient: $'
MSG4 DB 13,10,'Remainder: $'
MSG5 DB 13,10,'Undefined!! $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Input Dividend
    LEA DX, MSG1
    MOV AH, 9
    INT 21H

    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV BL, AL

    ; Input Divisor
    LEA DX, MSG2
    MOV AH, 9
    INT 21H

    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV CL, AL

    ; Check Divisor = 0
    CMP CL, 0
    JE DIV_ZERO

    ; Division
    MOV AH, 0
    MOV AL, BL
    DIV CL

    MOV BL, AL
    MOV BH, AH

    ; Display Quotient
    LEA DX, MSG3
    MOV AH, 9
    INT 21H

    MOV DL, BL
    ADD DL, 30H
    MOV AH, 2
    INT 21H

    ; Display Remainder
    LEA DX, MSG4
    MOV AH, 9
    INT 21H

    MOV DL, BH
    ADD DL, 30H
    MOV AH, 2
    INT 21H

    JMP EXIT

DIV_ZERO:
    LEA DX, MSG5
    MOV AH, 9
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
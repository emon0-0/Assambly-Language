.MODEL SMALL
.STACK 100H

.DATA
MSG1 DB 'Enter Multiplicand: $'
MSG2 DB 13,10,'Enter Multiplier: $'
MSG3 DB 13,10,'Product: $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Input Multiplicand
    LEA DX, MSG1
    MOV AH, 9
    INT 21H

    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV BL, AL

    ; Input Multiplier
    LEA DX, MSG2
    MOV AH, 9
    INT 21H

    MOV AH, 1
    INT 21H
    SUB AL, 30H

    ; Multiplication
    MUL BL

    ADD AL, 30H
    MOV BL, AL

    ; Display Product
    LEA DX, MSG3
    MOV AH, 9
    INT 21H

    MOV DL, BL
    MOV AH, 2
    INT 21H

    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
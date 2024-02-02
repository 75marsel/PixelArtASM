; Name: Gappi, Jeric Marcel L.
; 06 Task Performance 1-ARG
; 16/12/2023
MOV AL, 13H
MOV AH, 0
INT 10H

MOV AH, 0CH
MOV AL, 1  ; Blue
MOV CX, 50 ; x
MOV DX, 50 ; y
INT 10H
CALL DRAW_SQUARE

MOV AL, 4  ; Red
ADD CX, 22
MOV DX, 30 ; y
INT 10H
CALL DRAW_SQUARE

MOV AL, 2 ; Green
ADD CX, 22
MOV DX, 50 ; y
INT 10H
CALL DRAW_SQUARE

MOV AL, 14 ; Yellow
ADD CX, 22
MOV DX, 30  ; y
INT 10H
CALL DRAW_SQUARE

INT 20H ; END


DRAW_SQUARE PROC
    MOV BL, 30
    
    d_top: ; draw top side
        INT 10H
        INC CX
        DEC BL
    
        JNZ d_top
    
    MOV BL, 30
    
    d_right: ; draw right side
        INT 10H
        INC DX
        DEC BL
    
        JNZ d_right
    
    MOV BL, 30
    
    d_bottom: ; draw bottom side
        INT 10H
        DEC CX
        DEC BL
    
    JNZ d_bottom
    
    MOV BL, 30
    
    d_left: ; draw left side
    INT 10H
    DEC DX
    DEC BL
    
    JNZ d_left
RET        
DRAW_SQUARE ENDP
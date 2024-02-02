; Name: Gappi, Jeric Marcel L.
; 06 Laboratory 1-ARG
; 16/12/2023
MOV AL, 13H
MOV AH, 0
INT 10H

MOV AH, 0CH
MOV AL, 4  ; Blue
MOV CX, 50 ; x
MOV DX, 50 ; y
INT 10H
CALL DRAW_HAT_BORDER


INT 20H ; END





DRAW_HAT_BORDER PROC
    MOV BL, 100
    
    layer_top1:
    INT 10H
    INC CX
    DEC BL
    JNZ layer_top1
    
    MOV BL, 100
    SUB CX, 100
    INC DX
    
    layer_top2:
    INT 10H
    INC CX
    DEC BL
    JNZ layer_top2
    
    SUB CX, 100
    MOV DX, 51
    MOV BL, 15
     
    layer_left:
    INT 10H
    ADD CX, 40
    INC DX
    SUB CX, 40
    DEC BL
    JNZ layer_left
    
    MOV CX, 50
    ADD CX, 100
    MOV DX, 51
    MOV BL, 15
    
    layer_right:
    INT 10H
    ADD CX, 40
    INC DX
    SUB CX, 40
    DEC BL
    JNZ layer_right
    
    MOV CX, 48
    MOV DX, 67
    MOV BL, 15
    layer_left_out:
    INT 10H
    ADD CX, 40
    INC DX
    SUB CX, 40
    DEC BL
    JNZ layer_left_out
    
    MOV CX, 153
    MOV DX, 67
    MOV BL, 15
    layer_right_out:
    INT 10H
    ADD CX, 40
    INC DX
    SUB CX, 40
    DEC BL
    JNZ layer_right_out
    
    MOV CX, 50
    MOV DX, 82
    MOV BL, 15
     
    layer_left_d:
    INT 10H
    ADD CX, 35
    INC DX
    SUB CX, 35
    DEC BL
    JNZ layer_left_d
    
    
    MOV CX, 150
    MOV DX, 82
    MOV BL, 15
     
    layer_right_d:
    INT 10H
    ADD CX, 35
    INC DX
    SUB CX, 35
    DEC BL
    JNZ layer_right_d
    
    
    
    
RET
DRAW_HAT_BORDER ENDP
    

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
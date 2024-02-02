; Name: Gappi, Jeric Marcel L.
; 06 Laboratory Exercise 1-ARG
; 19/12/2023
; FACE - 120x100
; EYES 20x30
MOV AL, 13H
MOV AH, 0
INT 10H
MOV AH, 0CH


; draw body
CALL DRAW_FILL_BODY

; draw neck
MOV AL, 14
MOV CX, 80
MOV DX, 148
CALL DRAW_FILL_NECK      
      
; draw face and fill
MOV AL, 14
MOV CX, 51
MOV DX, 50
CALL DRAW_FILL_SQ

; draw left eyes
MOV AL, 0
MOV CX, 71
MOV DX, 70
CALL DRAW_EYES

; draw black line
MOV CX, 88
MOV DX, 78
CALL DRAW_GLASS_LINE

; draw right eyes
MOV CX, 120
MOV DX, 70
CALL DRAW_EYES

; fill left eyes
MOV CX, 71
MOV DX, 71
CALL FILL_EYES

; draw black line
MOV AL, 0
MOV CX, 88
MOV DX, 86
CALL DRAW_GLASS_LINE

; fill right eyes
MOV CX, 120
MOV DX, 71
CALL FILL_EYES_R

; draw mouth
MOV CX, 90
MOV DX, 130
CALL DRAW_MOUTH

; draw hat
MOV AL, 6
MOV CX, 40
MOV DX, 50
CALL DRAW_HAT


INT 20H

DRAW_FILL_SQ PROC ; 120 x 100
    DRAW_Y:
        MOV BX, CX  ; store current cx
        MOV CX, BX ; get the value of bx
        MOV DX, 50 ; revert back to y=50px 
        FILL_COLOR:
            INT 10H
          
            INC DX   ; increment y counter
            CMP DX, 148 ; check if y=150px where y=100+50px start
            JL FILL_COLOR
    
        INC CX   ; increment y counter
        CMP CX, 168 ; 50 + 120px
        JL DRAW_Y
  
RET
DRAW_FILL_SQ ENDP

DRAW_FILL_BODY PROC
    MOV AL, 6
    MOV CX, 50
    MOV DX, 172
    MOV BL, 120
    LOOP_B:
        INT 10H
        INC CX
        DEC BL
        JNZ LOOP_B
    
    MOV CX, 50
    MOV DX, 172
    DISP_BODY: 
        MOV BX, CX
        BODY_LOOP:
                INT 10H
                INC CX
                CMP CX, 179
                JLE BODY_LOOP
        MOV CX, BX
        DEC CX
        INC DX
        CMP DX, 200
        JLE DISP_BODY    
RET
DRAW_FILL_BODY ENDP


DRAW_FILL_NECK PROC
    LOOP_NECK:
        MOV BL, 25
        SAMPLE:
            INT 10H
            INC DX
            DEC BL
            JNZ SAMPLE
        INC CX
        MOV DX, 148
        CMP CX, 135
        JLE LOOP_NECK
RET
DRAW_FILL_NECK ENDP

DRAW_EYES PROC
    MOV BL, 18
    L1:
        INT 10H
        INC CX
        DEC BL
        JNZ L1
    INC DX
    MOV BL, 29
    L2:
        INT 10H
        INC DX
        DEC BL
        JNZ L2
    DEC CX
    MOV BL, 18
    L3:
        INT 10H
        DEC CX
        DEC BL
        JNZ L3
    DEC DX 
    MOV BL, 29
    L4:
        INT 10H
        DEC DX
        DEC BL
        JNZ L4
   
RET
DRAW_EYES ENDP

FILL_EYES PROC
    
    LOOP_F:
        MOV BL, 29
        F1:
            INT 10H
            INC DX
            DEC BL
            JNZ F1
        MOV DX, 71
        INC CX
        CMP CX, 89
        JL LOOP_F                    

RET
FILL_EYES ENDP

FILL_EYES_R PROC
    
    LOOP_F_R:
        MOV BL, 29
        F2:
            INT 10H
            INC DX
            DEC BL
            JNZ F2
        MOV DX, 71
        INC CX
        CMP CX, 139
        JL LOOP_F_R                    

RET
FILL_EYES_R ENDP

DRAW_GLASS_LINE PROC
    
    LOOP_LINE_OUTER:
        MOV BL, 33
        LOOP_LINE:
            INT 10H
            INC CX
            DEC BL
            JNZ LOOP_LINE
        MOV CX, 88
        INC DX
        CMP DX, 87
        JLE LOOP_LINE_OUTER        
RET
DRAW_GLASS_LINE ENDP

DRAW_MOUTH PROC
    
    INC CX
    INC DX
    INT 10H
    
    MOV BL, 40
    draw_m:
        INT 10H
        INC CX
        DEC BL
    JNZ draw_m
    
    INC CX
    INC DX
    INT 10H
    

RET
DRAW_MOUTH ENDP

DRAW_HAT PROC
    
    draw_loop:
        MOV BL, 140
        draw_line:
            INT 10H
            INC CX
            DEC BL
            JNZ draw_line
        
        MOV CX, 40
        INC DX
        CMP DX, 59
        JNE draw_loop
    
    ; draw hat 50x120
    MOV CX, 50
    MOV DX, 45
    draw_hat_border:
        MOV BL, 120
        draw_hat_line:
            INT 10H
            INC CX
            DEC BL
            JNZ draw_hat_line
        
        MOV CX, 50
        INC DX
        CMP DX, 50
        JNE draw_hat_border
    
    ; draw hat strip 50x120
    MOV AL, 15
    MOV CX, 50
    MOV DX, 40
    draw_hat_strip:
        MOV BL, 120
        draw_hat_strip_line:
            INT 10H
            INC CX
            DEC BL
            JNZ draw_hat_strip_line
        
        MOV CX, 50
        INC DX
        CMP DX, 45
        JNE draw_hat_strip
   
   ; draw another hat layer
   MOV AL, 6
   MOV CX, 50
   MOV DX, 35
   draw_hat_upper:
        MOV BL, 120
        draw_hat_uline:
            INT 10H
            INC CX
            DEC BL
            JNZ draw_hat_uline
        
        MOV CX, 50
        INC DX
        CMP DX, 40
        JNE draw_hat_upper
   
   ; draw top hat layer
   MOV CX, 70
   MOV DX, 25
   draw_hat_top:
        MOV BL, 80
        draw_hat_tline:
            INT 10H
            INC CX
            DEC BL
            JNZ draw_hat_tline
        
        MOV CX, 70
        INC DX
        CMP DX, 40
        JNE draw_hat_top
    

    
RET
DRAW_HAT ENDP
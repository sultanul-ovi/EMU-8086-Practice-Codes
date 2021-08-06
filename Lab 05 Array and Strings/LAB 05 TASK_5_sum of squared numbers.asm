org 100h 

.DATA           
A db 1,2,3,4,5,6      ;1-D array for number
output db ?


.CODE           
MAIN PROC
    mov ax, @DATA
    mov ds, ax 
    
    xor ax,ax
    mov si, OFFSET A
             
    
    mov CX, 6
    
    Loop_1:
        
        MOV AL, [SI]
        XOR AH, AH  ; to clear ah
        
        MOV BL, [SI]
        XOR BH, BH
        
        MUL BL
        ADD DL, AL

        inc Si
        loop Loop_1
    
    mov output, dl
    
    mov ah, 4ch
    int 21h

    MAIN ENDP
    END MAIN
RET

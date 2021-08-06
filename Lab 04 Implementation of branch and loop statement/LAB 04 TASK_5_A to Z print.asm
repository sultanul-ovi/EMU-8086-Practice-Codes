org 100h
 
.DATA    
N dw 26 

.CODE   
    MAIN PROC
        mov ax, @DATA
        mov ds, ax

        xor bx, bx 
        mov cx, N  
        Mov bl, 65
        
    start:  
        mov dl, bl
	    MOV AH, 2
	    INT 21H
        add bl, 1
        loop start

        mov ah, 4ch
        int 21h

MAIN ENDP
END MAIN
RET

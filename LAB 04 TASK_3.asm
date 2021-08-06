org 100h
 
.DATA    
N dw 9
OUTPUT dw ?  

.CODE   
    MAIN PROC
        mov ax, @DATA
        mov ds, ax

        xor bx, bx 
        mov cx, N 
        
    start:  
        add bx, cx
        
        MOV Dl, cl
        add dl, 48
	    MOV AH, 2
	    INT 21H
	     
        loop start
        
        MOV OUTPUT,BX

        mov ah, 4ch
        int 21h

MAIN ENDP
END MAIN
RET

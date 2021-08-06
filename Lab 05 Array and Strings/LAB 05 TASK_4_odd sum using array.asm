org 100h 

.DATA           
A db 1,2,3,4,5,6,7,8,9,10      ;1-D array for number
odd_sum db ?


.CODE           
MAIN PROC
    mov ax, @DATA
    mov ds, ax 
    
    xor ax,ax
    mov si, OFFSET A
    XOR BH,BH         
    
    mov CX, 10
    
    Loop_1:   
        XOR AX, AX
	    MOV AL, [SI]
	    
	    MOV BL, 2					; compare the integer with all elements of the one by one
	    DIV BL
	    
	    CMP AH, 1
	    JE Print1
        JL noPrint1
        
   	Print1:
        add bh, [Si]     
    noPrint1:
		INC Si
     loop Loop_1
    mov odd_sum, bh
    
    mov ah, 4ch
    int 21h

    MAIN ENDP
    END MAIN
RET

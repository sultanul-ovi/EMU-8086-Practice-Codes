;   Calculate the square of any number.

ORG 0100H

.DATA
A DB 10
OUTPUT DW ?
.CODE
MAIN PROC        
    MOV AL, A
    XOR AH, AH  ; to clear ah
    
    MOV BL, A
    XOR BH, BH
   
	MUL BX

    MOV OUTPUT, AX
	
    MAIN ENDP
END MAIN
RET
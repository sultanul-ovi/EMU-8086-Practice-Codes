;  	Write an assembly language program that can Convert (last 3 digits) ID 
;   Celsius to Fahrenheit using the following expression and 
;   store it in a variable F: F = C x 9/5 + 32 - 1.

ORG 0100h

.DATA

CEL DW 036
FER DW ?

.CODE

MAIN PROC

    
    MOV AX, CEL
    
	MOV BL, 9
	XOR BH, BH
	MUL BX
	
	MOV BL, 5
	XOR BH, BH
	DIV BX
	
	ADD AX, 32
	SUB AX, 1
	
    MOV FER, AX
	
	MAIN ENDP
END MAIN
RET
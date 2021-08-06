;  	Write an appropriate assembly language code to accomplish 
;  	the following tasks (use as many as possible arithmetic 
;	instructions  with less number of registers

;	Convert 999oF (Fahrenheit) to C (Celsius) using the 
;	following expression and store in a variable 
;	C: °C = (°F - 32) x 5/9 + 1


ORG 0100h

.DATA

CEL DW ?
FER DW 999

.CODE

MAIN PROC

    MOV AX, @DATA
    MOV DS, AX
    
    MOV AX, FER
	SUB AX, 32
	
	MOV BL, 5
	XOR BH, BH
	MUL BX
	
	MOV BL, 9
	DIV BX
	
	ADD AX, 1
	
    MOV CEL, AX
	
	MAIN ENDP
END MAIN
RET
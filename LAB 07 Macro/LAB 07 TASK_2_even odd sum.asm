ORG 100h
MDSPLY_STRING MACRO STRING      

	MOV AH, 9
	LEA DX, STRING
	INT 21H

	MOV CX, 6					
	LEA SI, ARRAY 
	XOR BH,BH        
ENDM     

CMP_EVENODD MACRO
	XOR AX, AX
	MOV AL, [SI]
	SUB AL, 48
	
	MOV BL, 2					
	DIV BL	
ENDM

.DATA
	PROMPT_1 DB 'Enter 6 Integer Numbers: ', '$'
	PROMPT_2 DB 0Dh, 0Ah, ' ', '$'
	PROMPT_3 DB 0Dh, 0Ah, ' ', '$'
	ARRAY DB 10 DUP(0)
    odd_sum DB ?
    even_sum DB ?
.CODE
MAIN PROC
	MOV AX, @DATA
	MOV DS, AX
	
	MDSPLY_STRING PROMPT_1      ; 1st Call of the MACRO
	
INPUTS:
	MOV AH, 1			
	INT 21h
	
	MOV [SI], AL				; Load the inputs in array one by one
	INC SI
	
	MOV AH, 2
	MOV DX, ' '
	INT 21h
	LOOP INPUTS

	CALL Odd_Numbers	
	CALL Even_Numbers
	
MAIN ENDP
	
Odd_Numbers PROC
	MDSPLY_STRING PROMPT_2      ; 2nd Call of the MACRO
	
Loop_1:
	CMP_EVENODD
	
	CMP AH, 1
	JE Print1
	JNE noPrint1
	
	Print1:
	    add bh, [SI]
	    sub bh,48
	
	noPrint1:
		INC SI
		LOOP Loop_1
mov odd_sum,bh
Odd_Numbers ENDP	
	
Even_Numbers PROC
	MDSPLY_STRING PROMPT_3      ; 3rd Call of the MACRO
	
Loop_2:
	CMP_EVENODD
	
	CMP AH, 0
	JE Print2
	JNE noPrint2
	
	Print2:
	    add bh, [SI]
	    sub bh,48
	
	noPrint2:
		INC SI
		LOOP Loop_2
mov even_sum,bh
Even_Numbers ENDP


END MAIN
RET

ORG 100h
MDSPLY_STRING MACRO STRING      

	MOV AH, 9
	LEA DX, STRING
	INT 21H

	MOV CX, 6					
	LEA SI, ARRAY         
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
	PROMPT_2 DB 0Dh, 0Ah, 'ODD Digits: ', '$'
	PROMPT_3 DB 0Dh, 0Ah, 'EVEN Digits: ', '$'
	ARRAY DB 10 DUP(0)

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
		MOV AH, 2
		MOV DX, [SI]
		INT 21h
		
		MOV DX, ' '
		INT 21h
	
	noPrint1:
		INC SI
		LOOP Loop_1

Odd_Numbers ENDP	
	
Even_Numbers PROC
	MDSPLY_STRING PROMPT_3      ; 3rd Call of the MACRO
	
Loop_2:
	CMP_EVENODD
	
	CMP AH, 0
	JE Print2
	JNE noPrint2
	
	Print2:
		MOV AH, 2
		MOV DX, [SI]
		INT 21h
		
		MOV DX, ' '
		INT 21h
	
	noPrint2:
		INC SI
		LOOP Loop_2

Even_Numbers ENDP


END MAIN
RET

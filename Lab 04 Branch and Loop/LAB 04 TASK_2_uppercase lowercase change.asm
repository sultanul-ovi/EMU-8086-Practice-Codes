ORG 0100H

.DATA
	PROMPT_1 DB 'Enter a character: ', '$'
	PROMPT_2 DB 0Dh, 0Ah, 'Output: ', '$'
	
.CODE

MAIN PROC
	
	MOV AH, 9
    LEA DX, PROMPT_1	; load and display the string PROMPT_1
    INT 21H
	
	MOV AH, 1
	INT 21H
	MOV BL, AL

	MOV AH, 9
    LEA DX, PROMPT_2	; load and display the string PROMPT_1
    INT 21H
	
	
	
	CMP BL, 97  ; It means (BL - 97)
	JGE toUpperCase
	JL toLowerCase

toUpperCase:
	SUB BL, 32
	MOV DL, BL
	
	MOV AH, 2
	INT 21H
	JMP Exit

toLowerCase:
	ADD BL, 32
	MOV DL, BL
	
	MOV AH, 2
	INT 21H
	JMP Exit  
	
Exit:
	MOV AH, 4CH
	INT 21H
	
	MAIN ENDP
END MAIN
RET

;	Write an assembly language program that inputs a single letter in lowercase 
;	and shows the next 3 letters in the uppercase in new lines.

ORG 0100H

.DATA
	PROMPT_1 DB 'Enter a character: ', '$'
	PROMPT_2 DB 0Dh, 0Ah, 'Output: ', 0Dh, 0Ah, '$'
	TEMP1 DB 0
	TEMP2 DB 0
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
	


toUpperCase:
	SUB BL, 32
    XOR CH, CH
    MOV CL, BL
	
	
	
print_part1:
	CMP CL, 89
	JG greater_Z
	
	ADD CL, 1
	
	MOV DL, CL
	MOV AH, 2
	INT 21H
	
	INC TEMP1
	CMP TEMP1, 3
	JL print_part1
    
    
    MOV AH, 02h     ; To print new line
    MOV DL, 10      ; new line
    INT 21h
    MOV DL, 13
    INT 21h

    XOR CH, CH
    MOV CL, BL
		

    JMP Exit 
    
greater_Z:
SUB CL,26    
JMP print_part1    

Exit:
	MOV AH, 4CH
	INT 21H
	
	MAIN ENDP
END MAIN
RET

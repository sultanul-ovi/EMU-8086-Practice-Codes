ORG 0100H

.DATA
	PROMPT_1 DB 'Enter a character: ', '$'
	PROMPT_2 DB 0Dh, 0Ah, 'Output: ', 0Dh, 0Ah, '$'
	TEMP1 DB 0
	TEMP2 DB 0
	TEMP3 DB 0
	TEMP4 DB 0
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
	CMP TEMP1, 5
	JL print_part1
    
    
    MOV AH, 02h     ; To print new line
    MOV DL, 10      ; new line
    INT 21h
    MOV DL, 13
    INT 21h

    XOR CH, CH
    MOV CL, BL
	
print_part2:
	CMP CL, 66
	JL smaller_A
	
	SUB CL, 1
	
	MOV DL, CL
	MOV AH, 2
	INT 21H
	
	INC TEMP2
	CMP TEMP2, 5
	JL print_part2	
	
	
    JMP Exit 
    
greater_Z:
SUB CL,26    
JMP print_part1    

smaller_A:
ADD CL,26    
JMP print_part2
    
toLowerCase:	
	ADD BL, 32
    XOR CH, CH
    MOV CL, BL
	
print_part3:
	CMP CL, 121
	JG greater_zz
	
	ADD CL, 1
	
	MOV DL, CL
	MOV AH, 2
	INT 21H
	
	INC TEMP3
	CMP TEMP3, 5
	JL print_part3
    
    
    MOV AH, 02h     ; To print new line
    MOV DL, 10      ; new line
    INT 21h
    MOV DL, 13
    INT 21h

    XOR CH, CH
    MOV CL, BL
	
print_part4:
	CMP CL, 98
	JL smaller_aa
	
	SUB CL, 1
	
	MOV DL, CL
	MOV AH, 2
	INT 21H
	
	INC TEMP4
	CMP TEMP4, 5
	JL print_part4
	
	
	
	JMP Exit  



greater_zz:
SUB CL,26    
JMP print_part3    

smaller_aa:
ADD CL,26    
JMP print_part4


	
Exit:
	MOV AH, 4CH
	INT 21H
	
	MAIN ENDP
END MAIN
RET

; (30 + 15) * (575 � 225) + 210

ORG 0100H

.DATA
OUTPUT DW ? ; Define Word(allocates 2 bytes)

.CODE
MAIN PROC        
    MOV AL, 30
    XOR AH, AH  ; to clear ah
    ADD AX, 15
        ;AX(1234) = ah(12) + al(34)
        ;AX (4 bytes) = ah (2) + al(2) 

    MOV BX, 575
	SUB BX, 225
	
	MUL BX
	
	ADD AX, 210
	
    MOV OUTPUT, AX
	
    MAIN ENDP
END MAIN
RET
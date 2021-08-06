;   Write an assembly language code to implement beep sound.


ORG 0100H

.CODE
MAIN PROC           ; procedure 

    
    MOV AH, 02h     ; To beep sound
    MOV DL, 07      ; beep command
    INT 21h
	

	
    MAIN ENDP
END MAIN
RET
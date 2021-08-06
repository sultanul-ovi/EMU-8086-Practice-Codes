;beep implementation
  

ORG 0100H

.CODE
MAIN PROC           ; procedure 

    
    MOV AH, 02h     ; To beep sound
    MOV DL, 07      ; beep command
    INT 21h
	

	
    MAIN ENDP
END MAIN
RET
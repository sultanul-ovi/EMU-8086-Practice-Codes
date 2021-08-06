;   Write an assembly language code that will 
;   take a number from the user and 
;   print the same number as output

ORG 0100H
.model small        ; it tell us that there is a code segment and a data segment
.stack 100h         ; memory size
.DATA

.CODE
MAIN PROC           ; procedure 
    MOV AX, @data   ; data segment initialization
    MOV DS, AX
            
    MOV AH, 01h	    ; input key function
    Int 21h		    ; ASCII code in AL    
    MOV BL, AL      ; Moving input to BL 
       
   
	MOV AH, 02h 	; display character function
    MOV DL, BL		; Moving BL to DL
    INT 21h 		; display character 

	      
	MOV AH, 4ch     ; to exit DOS
	INT 21h
	
    MAIN ENDP
END MAIN
RET
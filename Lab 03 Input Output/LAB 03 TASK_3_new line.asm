;   Write an assembly language code to implement a new line.

ORG 0100H
.model small       
.stack 100h      
.DATA

.CODE
MAIN PROC           ; procedure 
    MOV AX, @data   ; data segment initialization
    MOV DS, AX
            
    MOV AH, 01h	    ; input key function
    Int 21h		    ; ASCII code in AL    
    MOV BL, AL      ; Moving input to BL 
         
         
    MOV AH, 02h     ; To print new line
    MOV DL, 10      ; new line
    INT 21h
    MOV DL, 13
    INT 21h

     
    
   
	MOV AH, 02h 	; display character function
    MOV DL, BL		; Moving BL to DL
    INT 21h 		; display character 


	
	      
	MOV AH, 4ch     ; to exit DOS
	INT 21h
	
    MAIN ENDP
END MAIN
RET
;   Write an assembly language code that 
;   will take 3 numbers(0 to 9) from the user 
;   and store the sum in a variable. 

ORG 0100H
.model small        
.stack 100h         
.DATA
OUTPUT DW ?
.CODE
MAIN PROC           
    MOV AX, @data   
    MOV DS, AX
            
    MOV AH, 01h	    
    Int 21h		      
    MOV BL, AL
    SUB BL,48       
    XOR BH, BH
    Mov OUTPUT, BX 

    MOV AH, 02h     ; To print new line
    MOV DL, 10     
    INT 21h
    MOV DL, 13     
    INT 21h
    
    MOV AH, 01h	    
    INT 21h		      
    MOV BL, AL
    SUB BL,48    
    XOR BH, BH
    ADD OUTPUT, BX
    
    MOV AH, 02h     ; To print new line
    MOV DL, 10     
    INT 21h
    MOV DL, 13      
    INT 21h
    
    MOV AH, 01h	   
    INT 21h		      
    MOV BL, AL
    SUB BL,48        
    XOR BH, BH
    ADD OUTPUT, BX
	

	
	      
	MOV AH, 4ch     ; to exit DOS
	INT 21h
	
    MAIN ENDP
END MAIN
RET
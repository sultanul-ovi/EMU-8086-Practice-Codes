;   Write an assembly language program that can 
;   calculate the average of 3 numbers (0 to 9). 
;   Take 3 numbers from input and store the average in a variable.

ORG 0100H
.model small        
.stack 100h         
.DATA
average DB ?
.CODE
MAIN PROC           
    MOV AX, @data   
    MOV DS, AX
            
    MOV AH, 01h	    
    Int 21h		        
    MOV BL, AL 

    MOV AH, 02h     ; To print new line
    MOV DL, 10      ; new line
    INT 21h
    MOV DL, 13
    INT 21h

    MOV AH, 01h	    
    Int 21h		        
    ADD BL, AL 

    MOV AH, 02h     ; To print new line
    MOV DL, 10      ; new line
    INT 21h
    MOV DL, 13
    INT 21h

    MOV AH, 01h	    
    Int 21h		        
    ADD BL, AL 

    MOV AL, BL

    XOR AH, AH
    XOR BH, BH

    MOV BL, 3
    DIV BL 
    
    MOV average, AL
    
    MOV AH, 02h     ; To print new line
    MOV DL, 10      ; new line
    INT 21h
    MOV DL, 13
    INT 21h

    

	MOV AH, 02h 	
    MOV DL, average		
    INT 21h 		 

    SUB average,48




	MOV AH, 4ch     ; to exit DOS
	INT 21h
	
    MAIN ENDP
END MAIN
RET
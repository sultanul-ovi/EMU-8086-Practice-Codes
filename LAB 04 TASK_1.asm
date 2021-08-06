
ORG 0100H
.model small        
.stack 100h         
.DATA

OUTPUT DW ?


.CODE

MAIN PROC

    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 01h	    
    Int 21h
    SUB AL, 48; ascii to integer		    
    MOV Bh, AL
    
    MOV AH, 01h	    
    Int 21h	
    SUB AL, 48; ascii to integer
    MOV CH, AL
    
    MOV AL,BH	    
    MOV BL, 10
    MUL BL   
    ADD AL,CH
    
    MOV OUTPUT, AX
    

	
	MAIN ENDP
END MAIN
RET
;   Write an assembly language program that can calculate the area of a circle. 
;   You can take pie as 3. Take the radius of the circle (0 to 9)as input 
;   and store the output in a variable.

ORG 0100H

.DATA
Area DB ?

.CODE
MAIN PROC  


    MOV AH, 01h	    
    Int 21h		            
    
    SUB al, 48
    MOV BL, AL
    
    XOR BH, BH
	MUL BX
 
    MOV BL, 3
    MUL BX

    MOV Area, Al
	
    MAIN ENDP
END MAIN
RET
ORG 0100H
.DATA
StrArray DB 'Hello World!!$' ; define string to display
.CODE
MAIN PROC 
    
    MOV AX, @DATA
    MOV DS,AX
    
    LEA DX, StrArray        ; set DX to point to 1st element of string array StrArray
    
    CALL USER               ; call procedure
    
    MOV AH, 4Ch 
    MOV AL, 00h             ; a code after procedure call and return
    INT 21h 
                            ; exit to DOS
MAIN ENDP
    
USER PROC
                            ; declare a procedure named USER
    MOV AH, 09h 
    INT 21h 
    RET                     ; return to MAIN procedure
                            
USER ENDP                   ; end of procedure USER

END MAIN                    ; end of program
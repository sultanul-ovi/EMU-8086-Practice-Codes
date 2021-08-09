
ORG 0100H

.DATA
MESSAGE1 DB 'Microprocessors and', 0DH, 0AH, '$'
MESSAGE2 DB 'Assembly Language$'

.CODE 
MAIN PROC
   MOV AX, @DATA
   MOV DS, AX

   MOV DX, OFFSET MESSAGE1
   MOV AH, 09H
   INT 21H

   MOV DX, OFFSET MESSAGE2
   MOV AH, 09H
   INT 21H

   MOV AH, 4CH                 ; Return to DOS
   INT 21H

MAIN ENDP

END MAIN
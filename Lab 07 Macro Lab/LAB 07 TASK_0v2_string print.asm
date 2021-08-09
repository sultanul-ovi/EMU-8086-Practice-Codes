MDSPLY_STRING MACRO STRING      ; Declaration of MACRO

   MOV DX, OFFSET STRING
   MOV AH, 09H
   INT 21H           

ENDM

ORG 0100H

.DATA
MESSAGE1 DB 'Microprocessors and', 0DH, 0AH, '$'
MESSAGE2 DB 'Assembly Language$'

.CODE 
MAIN PROC
   MOV AX, @DATA
   MOV DS, AX

   MDSPLY_STRING MESSAGE1      ; 1st Call of the MACRO
   MDSPLY_STRING MESSAGE2      ; 2nd Call of the MACRO

   MOV AH, 4CH                 ; Return to DOS
   INT 21H

MAIN ENDP


END MAIN
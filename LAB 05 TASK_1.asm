.model small
.stack 100h 

.data 
test_string DB ‘My first string’, 0Dh, 0Ah, ‘$’
m db 'I am Ovi $'  

.code
main proc
     ; 1-> single key input
     ; 2-> single key output
     ; 9-> character string output
     
     mov ax, @data  ; data segment initialization
     mov ds, ax   ; data to code segment
     
     MOV AH, 9 
     LEA DX, test_string 
     INT 21h
     
     mov ah,9
     lea dx,m    ; load effective address
     int 21h
     
      
 

     
     
     
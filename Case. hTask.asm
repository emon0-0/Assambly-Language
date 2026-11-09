.model small
.stack 100h
.data 

    upperMsg db 13,10,"Enter Higher Case : $"
    lowerAns db 13,10,"This is your Lower Case: $"
    
    lowerMsg db 13,10,"Enter Lower Case : $"
    upperAns db 13,10,"This is your Higher Case: $"

.code

main proc
    mov ax, @data
    mov ds, ax  
    
    
    ; Part 1: Higher Case to Lower Case
    
    
    ; Print "Enter Higher Case :"
    lea dx, upperMsg
    mov ah, 9h
    int 21h   
    
    ; Read uppercase character into AL
    mov ah, 1h
    int 21h
    mov bl, al
    
    ; Convert Uppercase to Lowercase (Add 32 to ASCII value)
    add bl, 32 
    
    ; Print "This is your Lower Case:"
    lea dx, lowerAns
    mov ah, 9h
    int 21h
    
    ; Output converted lowercase character
    mov dl, bl
    mov ah, 2h
    int 21h 

    
    ; Part 2: Lower Case to Higher Case
    

    ; Print "Enter Lower Case :"  
    
    lea dx, lowerMsg
    mov ah, 9h
    int 21h   
    
    ; Read lowercase character into AL
    mov ah, 1h
    int 21h
    mov bl, al
    
    ; Convert Lowercase to Uppercase 
    sub bl, 32 
    
    ; Print "This is your Higher Case:"
    lea dx, upperAns
    mov ah, 9h
    int 21h
    
    ; Output converted uppercase character
    mov dl, bl
    mov ah, 2h
    int 21h 
   jmp exit
exit :
    mov ah, 4ch
    int 21h
    
main endp
end main
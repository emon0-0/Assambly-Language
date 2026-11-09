;Enter Higher Case : E
;This is your Lower Case : e

.model small
.stack 100h 
.data 

lower db 13,10, " Enter lower Case : $"
higher db 13,10, " This is your higher Case: $"
.code

main proc
    mov ax, @data
    mov ds, ax  
    
     ;lower msg print
    lea dx, lower
    mov ah, 9
    int 21h   
    
    mov ah, 1h; user input
    int 21h
    ;user input = al
    mov bl, al
    
    ;ascii
    
    mov  ah,2h ; input case 
    
     ;higher msg print
    lea dx, higher
    mov ah, 9
    int 21h
    
    add bl,-32 ; bl = r
    mov dl, bl
    mov ah, 2h
    int 21h 
    jmp exit
    
    
    exit :
    mov ah, 4ch
    int 21h
    main endp
end main
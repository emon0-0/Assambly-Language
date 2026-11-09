.model small
.stack 100h 
.data 

andmsg db "AND Result : $"
ormsg db 13,10, "OR Result : $"
xormsg db 13,10, "XOR Result : $"
notmsg db 13,10, "NOT Result : $"
.code 

main proc
    mov ax, @data
    mov ds, ax
    
    ; AND msg print
    lea dx, andmsg
    mov ah, 9h
    int 21h  
    
    ; AND operation 
    mov bl, 101b ; bl = 101b
    and bl, 111b ; bl = 101b AND 111b = 5
    mov dl, bl   ; output reg
    add dl, '0'  ; dl = '5'
    mov ah, 2h   ; char print
    int 21h
    
    ; OR msg print
    lea dx, ormsg
    mov ah, 9h
    int 21h   
    
    ; OR operation 
    mov bl, 101b ; bl = 101b
    or bl, 111b  ; bl = 101b OR 111b = 7
    mov dl, bl   ; output reg
    add dl, 48   ; dl = '7'
    mov ah, 2h   ; char print
    int 21h   
    
    ; XOR msg print
    lea dx, xormsg
    mov ah, 9h
    int 21h 
    
    ; XOR operation 
    mov bl, 101b ; bl = 101b
    xor bl, 111b ; bl = 101b XOR 111b = 2
    mov dl, bl   ; output reg
    add dl, '0'  ; dl = '2'
    mov ah, 2h   ; char print
    int 21h  
    
    ; NOT msg print
    lea dx, notmsg
    mov ah, 9h
    int 21h
    
    ; NOT operation (performing NOT on 101b)
    mov bl, 101b       ; bl = 00000101b
    not bl             ; bl = 11111010b
    and bl, 00000111b  ; keep lower 3 bits (010b = 2) for single digit ASCII printing
    mov dl, bl         ; output reg
    add dl, '0'        ; dl = '2'
    mov ah, 2h         ; char print
    int 21h
    
exit:
    mov ah, 4ch 
    int 21h
    
main endp
end main

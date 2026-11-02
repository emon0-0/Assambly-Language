 ;Enter Dividend: 8 | 8
 ; Enter Divisor:5 | 0
 ;Your Quotient : 1   | Undedine!!
 ; your Remainder: 3
.model small
.stack 100h
.data 
   dividend db " Enter Dividend: $"
   divisor db 13,10," Enter Divisor: $"  
   quotient db 13,10, " Your Quotient : $"
   remainder db 13,10, "  your Remainder: $"
   error db 13,10, "   Undedine!!$"
   
   
.code

main proc
    mov ax, @data
    mov ds,ax
     
     
     ;str print, load effictive address
     lea  dx , dividend ; str load
     mov ah,9h ;str print
     int 21h; interrupt
     
     ; dividend user input
     
     mov ah, 1h ; user input
     int 21 ; interrupt  
     ;al = by default input taker  (register)
     mov bl, al ;bl = dividend
     ; ascii
     sub bl , 30h ;decimal cinvert
        
        ;Divisor
       lea  dx , divisor ; str load
     mov ah,9h ;str print
     int 21h; interrupt 
     
     ;Divisor user input    
     mov ah, 1h ; user input
     int 21h ; interrupt  
     ;al = by default input taker  (register)
     mov bh, al ;bl = divisor
     ; ascii
     sub bh , '0' ;decimal cinvert  
     
     ;quotient
      lea  dx , quotient ; str load
     mov ah,9h ;str print
     int 21h; interrupt  
     
     ;corner case
     cmp bh,0 ; bh ==0
   cmp bh, 0
    je undefine  ; changed from undefined to undefine
     
     ;ascii, pattern
     ;Upper, case, lower case
     
     ;else
     mov al,bl 
     xor ah, ah;ah = reminder
     div bh ; divisor, al = quotient
     mov dl,al
     add dl,48 ;ascii convert
     mov ah,2h ;char print
     int 21h; interrupt
     jmp exit
     
     undefine: ; segment
        
      lea  dx , error ; str load
     mov ah,9h ;str print
     int 21h; interrupt
    
    exit:
    mov ah, 4ch
    int 21h
    
    main endp
end main




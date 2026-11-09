;Logical (and , or , xor)
;case convert (upper to lower , lower to upper )
;101b
;111b

;And Result:  ='5'
;OR : 1 ( bit wise )111b = 7 ='7'
;XOR : 010b =2 ='2' 



.model small
.stack 100h 
.data 

andmsg db "AND Result : $"
ormsg db 13,10, "OR Result : $"
xormsg db 13,10, "XOR Result : $"
.code 


main proc
    mov ax, @data
    mov ds, ax
     
     ;and msg print
     lea dx, andmsg
     mov ah, 9h
     int 21h  
     
     
     ; and operation 
     mov bl, 101b ;bl=101b
     and bl, 111b ;bl = 101b and 111b = 5
     mov dl, bl ;output reg
     add dl,'0'; dl = '5'
     mov ah, 2h ;char print
     int 21h
     
     
      ;or msg print
     lea dx, ormsg
     mov ah, 9h
     int 21h   
     
     ; or operation 
     mov bl, 101b ;bl=101b
     or bl, 111b ;bl = 101b and 111b = 7
     mov dl, bl ;output reg
     add dl,48; dl = '7'
     mov ah, 2h ;char print
     int 21h   
     
      ;xor msg print
     lea dx, xormsg
     mov ah, 9h
     int 21h 
     
     ; xor operation 
     mov bl, 101b ;bl=101b
     xor bl, 111b ;bl = 101b and 111b = 2
     mov dl, bl ;output reg
     add dl,'0'; dl = '2'
     mov ah, 2h ;char print
     int 21h  
     
     
    exit:
    mov ah, 4ch 
    int 21h
    
    main endp
end main
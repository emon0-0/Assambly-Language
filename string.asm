.model small ; 1 code segment + 1 data segment
.stack 100h ; 256 bytes , push , pop, call, ret 
.data ;input + output var

msg db "Hello World! " ,13,10, " Good Morning!$"
;grt db 13,10, " Good Morning! $"  ; for new line string

.code ;whole code 

main proc
    mov ax,@data
    mov ds, ax ; data segment activate 
    
    lea  dx , msg
    mov ah ,9h;str print
    int 21h;interrupt  
    
    ;lea  dx , grt
    ;mov ah ,9h;str print
    ;int 21h;interrupt
    
    ; load effective address
    ;AX = accumulator reg = AH : AL = arith , logical
    ;BX = base reg = BH : BL = hex, oct, bin , dec, ascii
    ;CX = counter reg = CH : CL = Loop Counter 
    ;DX = Data reg = DH : DL = output reg
    
    emon: ; exit
    mov ah, 4ch
    int 21h; int means interrupt,21h = srevice provider
    
    main endp; procedure end
end main ; whole program end

;Additioin:
;8+1 =9 , 0+0 =0, 5+3 =8
.model small; 1 cs + 1 Ds
.stack 100h; 256 bytes
.data
.code

main proc ; procedure
    mov ax, @data
    mov ds,ax ; data segment active  
    
    mov al,8 ; ax = 5
    mov dl,1 ;dx =3
    add dl,al  ; dx =5+3 =8
     ;decimal
     add dx,'0' ; ascii convert
     ;add dx,48
     ;add dl, 30h
     
     mov ah,2h; char print 
     int 21h; interrupt
    
    
    
    exit:
    mov ah, 4ch ; ah = 4c
    int 21h
    
    main endp; end od procedure
end main
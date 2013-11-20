; quick set/p replacement intended for batponyadventure in ms-dos.
;BPA ALWAYS USES SET/P VAR=Text.
;replacement will use the syntax: SETP VAR=Text
org 100h

;setp, unlike set, will not accept any switches.
        mov cx,[0080h]
        cmp cx,0
        jz exit_err

env_name:               ;Get our ENV Var name.
        mov si,0081h
        mov di,name
        mov dl,'='
        call l_text

text_prompt:
        mov di,buffer
        mov dl,0dh

write_p:                ;write our prompt.
        mov dx,buffer
        mov ah,09h
        int 21h

input:
        ;get input here.
        jmp input

;PUT OUR INFO INTO ENV HERE.

exit_err:
        mov ax,4cff
        int 21h

l_text:
        lodsb
        cmp al,dl
        jz .done
        cmp al,20h
        jz .space
        stosd
.space:
        loop l_text      ;Exits if we run out of characters before encountering an =.
        jmp exit_err
.done:
        mov al,'$'
        stosd

.bss
buffer  resb    127
name    resb    127
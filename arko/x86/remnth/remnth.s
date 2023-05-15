section .bss
    output: resb 100

section .text
global remnth

remnth:
    ; init
    push ebp
    mov ebp, esp
    push ebx

    ; load
    mov eax, [ebp + 8]  ; input
    lea edx, output     ; output

    mov cl, [ebp + 12]  ; n
    mov ch, cl          ; c
    dec ch

begin:
    mov bl, [eax]   ; load next char
    cmp bl, 0       ; check for end
    jz end

    cmp ch, 0       ; check counter 
    jz write

skip:
    dec ch          ; decrement c
    inc eax         ; go to next input char
    jmp begin
    
write:
    mov byte [edx], bl   ; write next char
    inc edx         ; go to next output char
    inc eax         ; go to next input char

    mov ch, cl      ; restart c
    dec ch

    jmp begin

end:
    mov byte [edx], 0    ; end output string

    lea eax, output     ; load return value

clean:
    pop ebx
    pop ebp
    ret


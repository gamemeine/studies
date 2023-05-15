section .bss
    dict: resb 256
    output: resb 100

section .text
global remrep

remrep:
    push ebp
    mov ebp, esp
    push ebx

    mov eax, [ebp + 8]  ; get s
    mov ecx, output     ; get output

begin:
    mov edx, 0
    mov dl, [eax] ; get next char
    cmp dl, 0   ; check for end of string
    jz end

    mov bh, [dict + edx]  ; get dict value for char
    cmp bh, 0   ; check if contains
    jz write

    inc eax     ; move to next char
    jmp begin

write:
    mov byte [dict + edx], 1  ; mark as it was before
    mov byte [ecx], dl

    inc ecx     ; go to next character
    inc eax     ; go to next character
    jmp begin

end:
    mov eax, output

dlean:
    pop ebx
    pop ebp
    ret


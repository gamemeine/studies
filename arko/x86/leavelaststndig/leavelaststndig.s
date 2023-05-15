section .bss
    output: resb 100

section .text
global leavelaststndig

leavelaststndig:
    push ebp 
    mov ebp, esp
    push ebx

    mov eax, [ebp + 8]  ; get s
    mov ecx, eax        ; init end s adress
len:
    mov bl, [ecx]     ; get next char
    cmp bl, 0       ; check for end
    jz begin

    inc ecx     ; go to next character
    jmp len

begin:
    mov edx, ecx
    sub edx, eax    ; get length of s

    lea ecx, output ; init output
skip:
    cmp edx, [ebp + 12] ; check if len > n
    jle write

    dec edx     ; decrement length counter
    inc eax     ; go to next character
    jmp skip

write:
    mov bl, [eax] ; get next char
    cmp bl, 0   ; check for end
    jz end

    mov byte [ecx], bl   ; write
    inc ecx         ; next output char
    inc eax         ; next input char

    jmp write

end:
    mov byte [ecx], 0    ; end string

    mov eax, output ; output string to return

    pop ebx
    pop ebp
    ret

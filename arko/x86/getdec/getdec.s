section .text
global getdec


getdec:
    push ebp
    mov ebp, esp
    push ebx
    push esi

begin:
    mov ebx, [ebp + 8]  ; get s
    mov ch, 0           ; specify if number started
    
    mov eax, 0          ; reset eax
    mov edx, 0          ; reset edx



next:
    mov dl, [ebx]   ; get next char
    cmp dl, 0       ; check for string end
    jz end

    sub dl, byte '0'    ; get value
    cmp dl, 9           ; check for digit
    jle digit

    cmp ch, 1           ; check if readed
    je mark

    inc ebx
    jmp next

digit:
    cmp ch, 1   ; check if its first digit
    jle append

    inc ebx
    jmp next

append:
    lea eax, [eax + eax * 4]    ; multipy by 5
    lea eax, [eax + eax]        ; multipy by 2
    

    add eax, edx                ; add next digit from dl

    mov ch, 1                   ; mark as read

    inc ebx
    jmp next

mark:
    mov ch, 2       ; mark as readed

    inc ebx
    jmp next

end:


dlean:
    pop esi
    pop ebx
    pop ebp
    ret
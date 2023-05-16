section .text
global increasing

increasing:
    push ebp
    mov ebp, esp

begin:
    mov ecx, [ebp + 8]  ; load first char's address from s
    mov eax, [ebp + 8]  ; load first char's address from output

    xor dh, dh           ; get previous char

next:
    mov dl, [ecx]   ; get next char from s
    test dl, dl     ; check if end
    jz end

    cmp dl, dh      ; check if previous code is bigger
    jge write

prepare:
    mov dh, dl      ; update previous char
    inc ecx         ; go to next char
    jmp next

write:
    mov byte [eax], dl   ; write current char
    inc eax         ; increment output
    jmp prepare
    
end:
    mov byte [eax], 0   ; end ouput
    sub eax, [ebp + 8]  ; calculate size

clean:
    pop ebp
    ret
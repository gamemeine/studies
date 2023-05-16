section .text
global increasing

increasing:
    push ebp
    mov ebp, esp

begin:
    mov ecx, [ebp + 8]  ; load first char from s
    mov eax, [ebp + 8]  ; load first char from output

    mov dh, 0           ; get previous char

next:
    mov dl, [ecx]   ; get next char from s
    cmp dl, 0       ; check if end
    jz end

    cmp dl, dh      ; check if previous code is bigger
    jge write

    mov dh, dl      ; update previoys char
    inc ecx         ; go to next char
    jmp next

write:
    mov byte [eax], dl   ; write current char
    inc eax         ; increment output

    mov dh, dl      ; update previoys char
    inc ecx         ; go to next char
    jmp next
    
end:
    mov byte [eax], 0   ; end ouput
    sub eax, [ebp + 8]  ; calculate size

clean:
    pop ebp
    ret
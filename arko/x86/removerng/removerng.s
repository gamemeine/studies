section .bss
    output: resb 20

section .text
global removerng

removerng:
    push ebp
    mov ebp, esp
    push ebx

    mov eax, [ebp + 8]  ; load input string's first char adress
    mov cl, [ebp + 12]  ; load a
    mov ch, [ebp + 16]  ; load b

    lea edx, output     ; load output string's first char adress
    
begin:
    mov bl, [eax]   ; load next character
    cmp bl, 0     ; check if end of string
    jz end  ; if it's end of string jump to end

    cmp bl, cl  ; check for lower than a
    jl write    ; write if lower than a

    cmp bl, ch  ; check for greater than b
    jg write    ; write if greater than b

skip:
    inc eax     ; increment input string's next char
    jmp begin

write:
    mov byte [edx], bl   ; write to ouput string
    inc edx     ; increment ouptut string adress
    inc eax     ; increment input string adress
    jmp begin
end:
    mov byte [edx], 0    ; end output string
    lea eax, output   ; load return value

	pop ebx ;mov esp, ebp    ; cleanup
	pop ebp     ; cleanup

    ret

section .bss
    output: resb 100

section .text
global leavelongestnum

leavelongestnum:
    push ebp
    mov ebp, esp
    push ebx
    push edi
    push esi

begin:
    mov eax, [ebp + 8]  ; a
    mov ecx, 0          ; as

    mov edi, [ebp + 8]  ; max-a
    mov esi, 0          ; max length

next:
    mov bl, [eax]   ; get next char
    cmp bl, 0       ; check for end
    jz nst

    cmp bl, '0'     ; check for digit
    jl any
    cmp bl, '9'     ; check for digit
    jg any


; ---
digit:
    cmp ecx, 0  ; check if its first time digit
    jz start

    inc eax
    jmp next

start:
    mov ecx, eax    ; set as

    inc eax
    jmp next

;---

any:
    cmp ecx, 0
    jz skip

    ; get acutal length
    mov edx, eax
    sub edx, ecx

    cmp edx, esi
    jg replace

    mov ecx, 0      ; reset old values
    mov edx, 0      ; reset old values

    inc eax
    jmp next

skip:
    inc eax
    jmp next

replace:
    mov edi, ecx    ; set new max
    mov esi, edx    ; set new max length

    mov ecx, 0      ; reset old values
    mov edx, 0      ; reset old values

    inc eax
    jmp next

;----

nst:
    cmp ecx, 0
    jz reset

    ; get acutal length
    mov edx, eax
    sub edx, ecx

    cmp edx, esi
    jle reset

    mov edi, ecx    ; set new max
    mov esi, edx    ; set new max length

; ---

reset:
    mov eax, [ebp + 8]  ; restart a

    mov ecx, output  ; setup output

    ; get max a
    mov edx, edi        
    add edx, esi

process:
    mov bl, [eax]   ; get next char
    cmp bl, 0       ; check for end
    jz end
    
    cmp eax, edi
    jl remove
    
    cmp eax, edx
    jge remove

    ; write
    mov byte [ecx], bl  ; write to output
    inc eax
    inc ecx
    jmp process
    

remove:
    inc eax
    jmp process

end:
    mov byte [ecx], 0   ; end with nst
    
    mov eax, output  ; setup return

clean:
    pop esi
    pop edi
    pop ebx
    pop ebp
    ret


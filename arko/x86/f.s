section .text
global f
f:
	push ebp
	mov ebp, esp
	mov eax, [ebp + 8] ;ładujemy początek string'a (argument funkcji)
begin:
	mov cl, [eax] ;cl ma 1 bajt
	cmp cl, 0 ;sprawdzamy czy to koniec stringa
	jz end ;skaczemy jeśli koniec stringa
	add cl, 1 ;zamieniamy na kolejną literę
	mov [eax], cl
	inc eax ;przechodzimy do następnego znaku
	jmp begin
end:
	mov esp, ebp ;sprzątanie
	pop ebp ;sprzątanie
	ret
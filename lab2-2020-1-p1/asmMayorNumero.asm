        global asmMayorNumero
        section .text
;len ->rdi valor
;vector -> rsi direccion
;max -> rdx  valor
asmMayorNumero:
    mov  rax, 0; iterador i
    mov  edx, [rsi]; le doy el primer valor
loop:
    cmp  edx, [rsi] ; movere  despues el espacio de memoria
    jl   esMayor
    jmp  fin_loop
esMayor:
    mov  edx,  [rsi]

fin_loop:
    add   rsi,  4
    inc   rax
    cmp   rax, rdi
    jne   loop

;rdx  contiene el mayor




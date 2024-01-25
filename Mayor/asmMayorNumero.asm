        global asmMayorNumero
        section .text

;len -> rdi, val
;vector -> rsi ,dirc
;max -> rdx, dirc
asmMayorNumero:
    xor     rcx,    rcx
    xor     rax,    rax
    mov     rcx,    0 ; contador  i
    mov     eax,   [rsi] ;rax contiene el primer numero; contendra el max

for1:
    cmp    eax,   [rsi + 4*rcx]; 4 porque los elementos son int y cada uno guarda 4bytes
    jge    continue
    mov    eax,   [rsi + 4*rcx] ; pasamos rax el mayor
continue:
    inc  rcx
    cmp  rcx,   rdi ; si no son iguales sigue loop
    jne for1

next:

    mov [rdx], rax
    ret

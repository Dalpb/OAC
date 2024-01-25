    global geometricSerieASM
        section .text

; a -> rdi 32bits
; N -> rsi 32bits
; x -> xmm0 32bits
geometricSerieASM:

    mov  rbx,        0 ; contador i
    mov  rax,       0; contador j para pow
    xorps  xmm1, xmm1; valor de a
    xorps  xmm2, xmm2 ; acumulador de pow
    xorps  xmm3,xmm3 ;acumulador de suma
    cvtsi2ss xmm1,   rdi ; xmm1 operador de 32bits
    
for:
    mov  rax,   0
    ;xmm2 sera el acumulador
    xorps xmm2, xmm2
for_pow:
    cmp  rax, 0
    jne  continue
iniciaPow:
    mov   rcx, 1
    cvtsi2ss xmm2, rcx
    jmp sigue
continue:
    mulss xmm2, xmm0

sigue:
    inc  rax
    cmp  rbx, rax 
    jge for_pow
next:
; tengo x elevado a i en xmm2
    
    mulss xmm2, xmm1; a. x*i

    addss xmm3, xmm2

    inc  rbx
    cmp  rbx, rsi ; si no llega al limtie
    jle  for

    movss xmm0, xmm3
    ret

    


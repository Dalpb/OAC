        global avgFilterASM
        section .text
;c - > rdi
;v ->rsi
;N ->rdx    
avgFilterASM:
        mov     rax, -1 ; contador i
        mov     ebx, 3
        xorps  xmm4, xmm4
        cvtsi2ss xmm4, ebx
for:    
        xorps  xmm0, xmm0 ; valor v[i]
        xorps  xmm1, xmm1 ; valor v[i-1]
        xorps  xmm2, xmm2 ; valor v[i+1]

        cmp   rax, -1
        jne  sigue
caso1:
        movss   xmm0,   [rsi]
        movss  xmm1,   [rsi]
        movss  xmm2,   [rsi + 4]
        inc rax ; para nivelar
        dec rdx; para arreglarlo 
        jmp fin_loop

sigue:
        dec rdx ; solo para el caso especial2
        cmp  rax, rdx
        jne op_normal

caso2: 
        movss  xmm0, [rsi]
        movss  xmm1, [rsi + 4 ]
        movss  xmm2, [rsi + 4 ]
        jmp fin_loop

op_normal:
        movss xmm0, [rsi]
        movss xmm1, [rsi + 4]
        movss xmm2, [rsi + 8]
        add  rsi, 4 ;movemos el puntero en 4bytes porque 1 float ocupa 4bytes

fin_loop:
        addss xmm2,xmm0
        addss xmm2,xmm1

        ;acumule todo en xmm2
        divss xmm2, xmm4

        movss [rdi], xmm2
        add    rdi , 4
        inc     rdx ; vuelve al estado normal
        inc     rax
        cmp     rdx, rax
        jne      for

        ret
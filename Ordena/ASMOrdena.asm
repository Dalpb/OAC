        global ASMOrdena
        section .text
;x - > rdi direccion de los floats
;len -> rsi 
ASMOrdena:
;rbx sera el j
;xmm0 sera el valor de x[i]
;xmm1 sera el valor de x[j]
;xmm2 sera el aux
    xorps   xmm0,   xmm0
    xorps   xmm1,   xmm1
    xorps   xmm2,   xmm2
    mov   rax,      0  ; sera el i
    mov   rdx,  rsi 
    dec   rdx
    xor   rcx, rcx
    

for1:
    cmp   rax,  rdx ;  len -1
    je    end_for1

; ubicamos la dir d x en j+1
    mov   rcx,  rdi ; apunta al mismo espacio
    add   rcx,   4 ; apunta a un espacio más 

;ajustamos el j
    inc  rax
    mov  rbx,  rax ; tenemos j = i+1
    dec  rax ; vuevel al original i

for2:
    cmp   rbx,  rsi
    je    end_for2

;cuando entra al for2,verificamos
    movss  xmm1,  [rcx] ; x[j]
    movss  xmm0,  [rdi] ; x[i]

    ucomiss  xmm0,  xmm1
    jb  noEsMayor

    ;realizamos la transferencia
    movss  [rcx], xmm0
    movss  [rdi], xmm1

noEsMayor:
    ;movemos el rcx
    add     rcx,    4
    inc     rbx
    jmp     for2


end_for2:
;al terminar el for recien movemos la dir de x , desplazamos
    add     rdi,    4
    inc     rax
    jmp     for1

end_for1:
    ret
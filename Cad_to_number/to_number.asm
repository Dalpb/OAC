section .data
    msg db "Ingrese un numero: "
    len_msg equ $ - msg
    num dd 0 ; almacena un numero

section .bss
    num_teclado resb  10 ;reserbo 10 bytes

section .text
    global _start

_start:
;imprimo
    mov     rax,    1
    mov     rdi,    1
    mov     rsi,    msg
    mov     rdx,    len_msg

    syscall


    mov     rax,    0
    mov     rdi,    0
    mov     rsi,    num_teclado
    mov     rdx,    10

    syscall

    mov     dl, 10
    mov     al, 0
    mov     rcx,    0

loop1: 
    cmp     dl,     [num_teclado + rcx ] ; verifico que no encontro un 10
    je      then1
    cmp     al,     [num_teclado +rcx] ; o encuentra un 0 y ya no sigue
    je      then1
    sub  byte [num_teclado + rcx],    48
    inc cl 
    jmp loop1

then1:
;almaceno el numero en rbx
    xor rbx,rbx
    xor r9,r9; contandor
    xor r8,r8
    ;cl contiene la cantidad de digitos
    mov rax,10

loop2:
    mul rbx ; el contendor lo mul por 10
    mov rbx,    rax      ;consideramos  solo la parte low, ya que solo queremos no numero tan grandes   
    mov r8b, [num_teclado + r9]; obtenemos 1 digito
    
    add rbx,    r8; lo sumamos
    inc r9
    mov rax,10
    cmp r9b, cl
    je fin
    jmp loop2


fin: 
    mov rax,    60
    mov rdi,    0

    syscall
    


section .text


strcopy:
    mov edi, [rsp + 24]
    mov esi, [rsp + 16]
    mov ecx, [rsp + 8]
    repe movsb
    ret 24

binarySearch:
    mov rbp, rsp
    push rdi
    push rcx
    push rsi
    mov eax, 0                              ; index of first item
    mov edx, [rbp + 8]                      ; index of last item

    mov r10, 0
    getMid:   
        inc r10   
        mov ebx, edx
        sub ebx, eax
        shr ebx, 1 
        add ebx, eax
        mov edi, [rbp + 24]                 ; table address
        mov ecx, [rbp + 32]
        imul ecx, ebx
        lea rsi, [edi + ecx]
        
        mov edi, tempString
        .move:
            movsb
            cmp byte [esi], 0
            jnz .move   

        
        mov ecx, [rbp + 16]                 ; field to search (jump, comp, or dest)
        strcmp ecx, tempString
        jz found
        mov r9d, ebx
        dec r9d
        inc ebx
        
        mov ecx, -1
        mov rdi, [rbp + 16] 
        mov rsi, tempString
        .compare:
            inc ecx
            mov r8b, [rdi + rcx]  
            cmp r8b, [rsi + rcx]
            je .compare
            cmova eax, ebx
            cmovl edx, r9d

            .iteration:
            push rax
            mov edi, tempString                 ; clear up for next iteration
            mov al, 0
            mov ecx, 6
            repe stosb
            pop rax

            cmp rax, rdx
            jle getMid
            mov ebx, 69
                                           
    found:
    pop rsi
    pop rcx
    pop rdi

    ret 32



getAcode:
    mov ecx, 1
    cmp rbx, 23
    cmovae eax, ecx
    cmp rbx, 2
    cmove eax, ecx
    cmp rbx, 6
    cmove eax, ecx
    cmp rbx, 18
    cmove eax, ecx
    cmp rbx, 21
    cmove eax, ecx
    cmp rbx, 15
    cmove eax, ecx

    ret
section .data
    newline db 0x0A
    newline_len equ $ - newline

section .text
    global print_string_asm

print_string_asm:
    ; function prologue
    push ebp
    mov ebp, esp

    ; get the argument (pointer to string)
    mov edi, [ebp+8]

    mov eax, 4            ; sys_write
    mov ebx, 1            ; file descriptor (stdout)
    mov ecx, edi          ; pointer to string
.loop:
    mov dl, [ecx]         ; load byte at ecx into dl
    cmp dl, 0             ; check if byte is null terminator
    je .done              ; if null terminator, jump to done
    inc ecx               ; increment pointer
    jmp .loop             ; jump back to loop
.done:
    sub ecx, edi          ; calculate string length
    mov edx, ecx          ; length of string to write
    mov ecx, edi          ; reset pointer to start of string
    int 0x80              ; call kernel

    ; function epilogue
    mov esp, ebp
    pop ebp
    ret

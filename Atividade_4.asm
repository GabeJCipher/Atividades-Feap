; Autor: [Gabriel Joaquim Carlos De Andrade Rodrigues]
; Faculdade: FEAP Avaré
; Curso: Engenharia da Computação
; Data de Postagem: [06/11/2023]
; Autor(es): [Gabriel Joaquim Carlos De Andrade Rodrigues; Leonardo Luz Moisés;]

section .data
    ; Mensagens de prompt e saída
    msg1 db 'Digite o primeiro número ', 0
    msg2 db 'Digite o segundo número ', 0
    msg3 db 'A média dos números é-> ', 0

section .bss
    ; Variáveis de armazenamento
    num1 resq 1
    num2 resq 1
    media resq 1

section .text
    global _start

_start:
    ; Imprimir a mensagem "Digite o primeiro número_"
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, 24
    int 0x80

    ; Receber o primeiro número
    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 8
    int 0x80

    ; Imprimir a mensagem "Digite o segundo número_"
    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, 23
    int 0x80

    ; Receber o segundo número
    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 8
    int 0x80

    ; Converter os números de ASCII para inteiros
    mov eax, [num1]
    mov ebx, [num2]

    ; Calcular a média
    add eax, ebx
    shr eax, 1

    ; Armazenar a média em 'media'
    mov [media], eax

    ; Converter o resultado de volta para ASCII
    mov eax, 4
    mov ebx, 1
    mov ecx, msg3
    mov edx, 23
    int 0x80

    ; Imprimir a média
    mov eax, 4
    mov ebx, 1
    mov ecx, media
    mov edx, 8
    int 0x80

    ; Sair do programa
    mov eax, 1
    int 0x80

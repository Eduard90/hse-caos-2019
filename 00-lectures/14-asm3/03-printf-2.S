// в этом примере поддерживается выравнивание стека по границе 16 байт
        .global main
main:
        sub     $32, %esp       // резервируем 32 байта для параметров, реально будет использовано 20, оставшиеся 12 выравнивают стек

        // параметры помещать в область параметров можно в произвольном порядке, так как память уже зарезервирована
        movl    $D, (%esp)
        movl    $C, 16(%esp)
        // инструкции "movl A, 4(%esp)" не бывает, поэтому приходится использовать регистр для промежуточного хранения значения
        movl    A, %eax
        movl    %eax, 4(%esp)
        movl    A + 4, %eax
        movl    %eax, 8(%esp)
        movl    B, %eax
        movl    %eax, 12(%esp)
        call    printf
        add     $32, %esp

        xor     %eax, %eax      // формируем код завершения 0 программы
        ret

        .data
A:      .quad   0x1122334455667777
B:      .int    42
C:      .asciz  "world!"
D:      .asciz  "Hello, %llx, %d, %s\n"

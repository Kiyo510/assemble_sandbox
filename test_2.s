.section .data
message:
    .string "Hello, world!\n"
    length = . - message

.section .text
.globl _start
_start:
    # write the message to stdout
    mov $1, %rax # system call number for write
    mov $1, %rdi # file descriptor for stdout
    movq $message, %rsi # message to be printed
    movq $length, %rdx # length of the message
    syscall

    # exit with status code 0
    mov $60, %rax # system call number for exit
    xor %rdi, %rdi # return code 0
    syscall

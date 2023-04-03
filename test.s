.data
msg: .string "eax = ebx\n"
msgend: .equ len, msgend - msg

.text
.globl _start
_start:
    jmp main

main:
    movl $100, %eax
    movl $100, %ebx
    cmpl %eax, %ebx
    je print
end:
    movl $1, %eax       # exitシステムコール
    xorl %ebx, %ebx    # 正常終了コード
    int $0x80               # プログラム終了
print:
    movl $4, %eax        # writeシステムコール
    movl $1, %ebx        # 標準出力へ
    movl $msg, %ecx    # "eax = ebx\n"
    movl $len, %edx     # 文字列長
    int $0x80               # 文字列出力
    jmp end

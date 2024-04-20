# Author : Nathan Rayburn

.global parity_word
.global check_parity

# int parity_word(int value)
# input value in eax
# output in eax
parity_word:
        pushl %ebp                      # Save old stack frame
        movl  %esp, %ebp                # Set new stack base
        movl 8(%ebp), %eax              # copy the argument in eax
        pushl %ebx

        ########## A completer ##########
        movl %eax, %ebx

        movb %bh, %al # mov byte 0 in AL

        shrl $16, %ebx # shift right 8 for byte 2 and byte 1 to be accessible in BH BL

        xorb %bh, %al # xor byte 2 in AL
        xorb %bl ,%al # xor byte 1 in AL

        popl %ebx
        leave                           # Restore stack frame
        ret                             # Return to caller

# int check_word(int value)
# input value in eax
# output in eax
check_parity:
        pushl %ebp                      # Save old stack frame
        movl  %esp, %ebp                # Set new stack base
        movl 8(%ebp), %eax              # copy the argument in eax
        pushl %ebx

        ########## A completer ##########

        movl %eax, %ebx # mov arg into ebx [2,1,0,checksum]
        xorb %bh, %bl # xor 0, checksum
        mov %bl, %cl # mov res1 into CL
        shrl $16, %ebx # shift
        xorb %bh, %bl # xor byte 2 and byte 1 = res2
        xorb %cl, %bl # xor res with res2
        movzbl %bl, %eax # mov final result into exa

        popl %ebx
        leave                           # Restore stack frame
        ret                             # Return to caller

# Author : Nathan Rayburn

.global asm_config_register

# int asm_config_register(int gpio_reg)
# input gpio_reg in eax
# output in eax
asm_config_register:
        pushl %ebp                # Save old stack frame
        movl  %esp, %ebp          # Set new stack base
        movl  8(%ebp), %eax       # copy the argument in eax
        pushl %ebx

        ########## A completer ##########
        
        andl $-1, %ebx
        
        orl $0xF0, %ebx

        andl $0x00FFFFFF, %ebx
        
        orl $0x66000000, %ebx

        shrl $3, %ebx

        orl $0x65, %ebx

        andl $0x7ff76e8, %ebx
        
        movl %ebx, %eax

exit:
        popl  %ebx
        leave                     # Restore stack frame
        ret                       # Return to caller

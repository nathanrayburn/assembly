# Author : Nathan Rayburn

.global char_to_hex

.equiv INDEX_ALPHA, 10
.equiv OFFSET_ALPHA, 55
.equiv OFFSET_NUMBER, 48
.equiv ZERO_ASCII, 0x30
.equiv X_ASCII, 0x78
.equiv FOUR_L, 0x0F
.equiv FOUR_H, 0xF0

char_to_hex:
	pushl %ebp                # Save old stack frame
	movl  %esp, %ebp          # Set new stack base
	movl  8(%ebp), %eax       # copy the argument in eax
	pushl %ebx

	########## A completer ##########
	movb %al, %bl
	movb %bl, %bh
	
	andb $FOUR_L, %bl # mask for 4 bits
	andb $FOUR_H, %bh # mask for 4 next bits
	shrb $4, %bh # shift so we have our value normalized
	
    movb %bl, %cl				   # pass arg to CL
    call add_offset_based_on_alpha # normalize for BL
	movb %cl, %bl                  # update BL from return

    mov %bh, %cl                   # pass arg to CL
    call add_offset_based_on_alpha # normalize for BH
    mov %cl, %bh				   # update BH from return
	jmp finish					   # jump to the end of the code

add_offset_based_on_alpha:
    cmpb $INDEX_ALPHA, %cl       # Compare with the alpha index
    jge .add_offset_alpha        # If greater or equal, we add the ASCII ALPHA offset
    addb $OFFSET_NUMBER, %cl     # ASCII NUMBER offset
    ret                          # Return to the caller

.add_offset_alpha:
    addb $OFFSET_ALPHA, %cl     # ASCII ALPHA offset
    ret                         # Return to the caller

finish:
	movb $ZERO_ASCII, %ah		# set char for 0
	movb $X_ASCII, %al			# set char for X
	shll $16,  %eax				# shift
	movb %bh, %ah				# set BH to AH
	movb %bl, %al				# set BL to AL

out:
    popl %ebx
    leave                     # Restore stack frame
    ret                       # Return to caller


# Introduction to MIPS assembly programming using MARS
# for MYY505 - Computer Architecture
# Aris Efthymiou
# Department of Computer Engineering, University of Ioannina

# These are comments! Anything up to the end of line is ignored

        .globl prog # declare the labels as global. .globl is an assembler **directive**
        
        .text      # Another assembler **direcrive**. what follows is code
     
        
        # Instructions are indented a few spaces to the right
        #   (so that we can see the labels more clearly)
        # Instruction operands are indented a few spaces, so that the
        #    instruction type is more visible.
      
        la         $a0, matric       # $a0 gets the **address** of matric
                                     # Note: this is address **not** value of matric
        la         $a1, var1         # $a1 gets address of var1
        la         $a2, array        # get address of array into $a2
                                     # This is called the **base** of the array
        la         $a3, var2         # Get address of var2

prog:   # Words ending with ':' are **labels**
        # The convention is to write labels starting from the leftmost column.
        # Try to keep label names short so they are to the left of instructions
        # It's best not to write instrucions in the same line as a label.

        li         $s0, 100          # Get value 100 into register $s0. li - load immediate
                                     # THIS WILL BE MODIFIED TO LOAD FROM matric
        
        lw         $s1, 0($a1)       # $s1 gets the value of var1. $a1 has the address of var1
        add        $s1, $s1, $s0     # $s1 = var1 + $s0
        sw         $s1, 0($a0)       # matric = var1 + $s0
        
        sw         $s0, 0xc($a2)     # Store $s0 to the 4th element of array
                                     # Note the use of offset (0xc = 12 = 3*4)
                                     # addresses of array elements (32bit words each):
                                     # array[0]  - array + 0
                                     # array[1]  - array + 4
                                     # array[2]  - array + 8
                                     # array[3]  - array + 12
                                     
        addiu      $t1, $a2, 0x10    # Note: address arithmetic.
                                     #  Calculates address of 5th element of array
        sw         $t1, 0($a1)       # var1 = address of 5th element of array 
                                     # Note: we can store addresses 
                                     #   in memory just like we do with real data!
        
        lb         $s2, 0($a3)       # Get value of var2, sign-extended to 32 bits, to $s2
        lbu        $s3, 0($a3)       # Get value of var2, zero-extended to 32 bits, to $s3
        
exit: 
        addiu      $v0, $zero, 10    # system service 10 is exit
        syscall                      # we are outa here.
        
###############################################################################

        .data      # Special assembler **direcrive**. what follows is data
        # Usually data are declared before text. Try to follow that convention 
        #     in your other programs!
        #  
matric: .word 0    # This will be used by your submitted code
var1:   .word 1
array:  .word 0 : 9 # Array of 9 words (initialized to 0)
var2:   .byte -1

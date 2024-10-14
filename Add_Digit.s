.globl main

main:
    li a0, 38         # Test case 1: 38
    jal ra, addDigits
    
    # Save the result
    mv s0, a0
    
    li a0, 199        # Test case 2: 199
    jal ra, addDigits
    
    # Save the result
    mv s1, a0
    
    # s0 should be 2 (result for test case 1), s1 should be 1 (result for test case 2)
    
    
    li a7, 10         # Set the system call number to 10 (exit program)
    ecall             # End the program

.globl addDigits

addDigits:
    # a0 contains the input number (num)
    addi sp, sp, -12  # Allocate stack space
    sw ra, 8(sp)      # Save return address
    sw s0, 4(sp)      # Save s0
    sw s1, 0(sp)      # Save s1

    mv s0, a0         # s0 = num
    li s1, 0          # s1 = sum = 0

loop:
    beqz s0, check_sum  # If num == 0, exit loop
    
    # sum += num % 10
    li t0, 10
    rem t1, s0, t0    # t1 = num % 10
    add s1, s1, t1    # sum += t1
    
    # num /= 10
    div s0, s0, t0
    
    j loop

check_sum:
    li t0, 9
    ble s1, t0, return_sum  # If sum <= 9, return sum
    
    # Recursive call: return addDigits(sum)
    mv a0, s1         # Set argument to sum
    jal ra, addDigits # Call addDigits recursively
    j done

return_sum:
    mv a0, s1         # Set return value to sum

done:
    lw s1, 0(sp)      # Restore s1
    lw s0, 4(sp)      # Restore s0
    lw ra, 8(sp)      # Restore return address
    addi sp, sp, 12   # Deallocate stack space
    ret               # Return to caller

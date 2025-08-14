#Loading the values
lui x21,0x10000
ld x7,0(x21)
ld x8,8(x21)

#addi x7, x0, -4        
#addi x8, x0, 64         

addi x9, x0, 0         

# Extract signs
srli x6, x7, 31       
andi x6, x6, 1
srli x10, x8, 31        
andi x10, x10, 1

#Absolute Values :
beq  x6, x0, Skipflip1
sub  x7, x0, x7
Skipflip1:


beq  x10, x0, Skipflip2
sub  x8, x0, x8
Skipflip2:

# Checking the smaller number to reduce the number of iteration in loop

blt x7,x8,X8Greater 
# Multiplication using Repeated addition
forloop:
    beq  x8, x0, exitLoop
    add  x9, x9, x7
    addi x8, x8, -1
    beq  x0, x0, forloop

X8Greater:
forloop1:
    beq  x7, x0, exitLoop
    add  x9, x9, x8
    addi x7, x7, -1
    beq  x0, x0, forloop1



exitLoop:
    beq  x6, x10, Done
    sub  x9, x0, x9
    
Done:
     sd x9,80(x21)




addi x7, x0, -64
addi x8, x0, -4   
addi x9 ,x0,0
## Extracting sign from both numbers
srli x6, x7, 31
andi x6, x6, 1
srli x10, x8, 31
andi x10, x10, 1

## Taking Absolute of both numbers
    
beq x6,x0,Skip1flip
sub x7,x0,x7
Skip1flip:
  
beq x10,x0,Skip2flip
sub x8,x0,x8
Skip2flip:

loop:

beq x8,x0,exitLoop
add x9,x9,x7
addi x8,x8,-1
beq x0,x0,loop

exitLoop:
    
beq x6,x10,MultiplicationDone
sub x9,x0,x9

MultiplicationDone:


    
 

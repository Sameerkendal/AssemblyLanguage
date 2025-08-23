
lui x3, 0x10000;
ld  x4 , 0(x3);   #Loading the count_of_gcd
addi x5,x3,0x200; #Loading the base address for the output

addi x6,x3 ,8 ;

GetPairs:
    beq x4,x0,Done;
    addi x4,x4,-1;

GetNumbers:
    ld x7, 0(x6);
    ld x8 , 8(x6);

CheckZeroInput:
    bne x7 , x0 , NextInput;
    beq x0,x0, GcdDone;
NextInput:
    bne x8 , x0 , GCD;
    sub x7 , x8 , x8;
    beq x0,x0, GcdDone;

GCD:
    beq x8,x0,GcdDone;
    add x9, x8,x0;

RemComp:
    bltu x7,x8,RemDone;
    sub x7,x7,x8;
    beq x0,x0, RemComp;

RemDone:

    add x9,x8,x0;
    add x8,x7,x0;
    add x7,x9,x0;
    beq x0,x0, GCD;

GcdDone:

    sd x7,0(x5);
    addi x6,x6,16;
    addi x5,x5,8;
    beq x0,x0, GetPairs;


Done:
    beq x0,x0, Done;


    



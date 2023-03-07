.data
.text
.global main
main:
        mov r0, #15         @U0 de la suite
        mov r1, #0          @i pour iteration  
        mov r2, #50         @ ldr r3, chiffre (is this right?) iteration max
debut:  
        cmp r1, r2          @check if Umax atteint
        beq fin             @renvoie à la fin si cest le cas
        tst r0, #1          @test si r0 (Un) est pair ou pas en regardant le dernier bit
        add r1, #1          @on incremente de 1
        beq impair          @impair si le dernier bit est 1 
        bne pair            @pair si le dernier bit est 0
pair:   
        mov r0, r0, LSR #1  @divise par 2 puisqu'on decale à droite r0
        b debut             @On revient au debut pour la prochaine itération
impair:
        mov r3, r0          @on garde une copie de r0
        mov r0, r0, LSL #1  @on double r0 avec un LSL pour shifter le bit
        add r0, r0, r3      @on ajoute r3 à r0 pour tripler en tout le r0 original
        add r0, r0, #1      @On ajoute un comme l'algo le veut
        b debut             @On revient au debut

fin: BX LR


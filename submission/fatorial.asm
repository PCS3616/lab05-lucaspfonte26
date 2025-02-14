@ /100
N   K /0000 ; Input do numero
RES K /0000 ; Resultado do fatorial
UM  K /0001 ; valor 1 a ser decrementado

@ /200
SC  FATORIAL
JP  HALT

@ /300
FATORIAL K /0000
    LD  N ; AC = N 
    JN  HALT ; Encerra se N<0
    JZ  ZERO
    LOOP MM RES; Salva AC no resultado
         LD N; Carrega valor intermediario de n
         SB UM; AC = AC-1
         JZ END_FATORIAL
         MM N ; N = N-1
         ML RES; AC = (n-1) x (resultado atual)
         JP LOOP
END_FATORIAL RS FATORIAL



@ /400
ZERO LD UM ; AC = 1
     MM RES ; RES = 1
HALT HM  /0000





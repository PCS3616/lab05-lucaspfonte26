@ /000
SC QUADRADOS
JP HALT
UM K /0001
N  K /0000
END_INICIAL K /0100
STEP K /0002
PARCELA    K /0000 ; Valor PARCELAermediario (2*n +1)
Q      K /0000; Valor do quadrado atual
LIMITE K /003F ; 63 numeros

@ /200
QUADRADOS K /0000
    LD END_INICIAL
    AD OP_MM
    MM SALVA
    LD END_INICIAL
    AD OP_LD
    MM LEITURA
    LOOP SC CALC_PARCELA;
         LEITURA K /0000; ler o elemento anterior
         AD PARCELA; soma com a parcela atual
         MM Q; salva o novo quadrado perfeito em um buffer
         SC ATUALIZA_END ; END = END + 2
         LD Q
         SALVA K /0000; salva o valor na posicao atualizada
         SC END_CHECK; atualiza o n e checa se o loop terminou
    JP LOOP
FIM_Q RS QUADRADOS


@ /300
CALC_PARCELA K /0000 ;calcula a parcela (2*n +1) e salva em I
    LD N 
    ML STEP
    AD UM
    MM PARCELA ; salva em PARCELA o valor atualizado
RS CALC_PARCELA

@ /325
ATUALIZA_END K /0000 ; atualiza o ponteiro para a proxima posicao de memoria
    LD LEITURA
    AD STEP
    MM LEITURA
    LD SALVA
    AD STEP
    MM SALVA
RS ATUALIZA_END

@ /350
END_CHECK K /0000
    LD N 
    AD UM 
    MM N
    SB LIMITE
    JZ FIM_Q
RS END_CHECK

@ /400
OP_MM MM /000
OP_LD LD /000
HALT HM /0000
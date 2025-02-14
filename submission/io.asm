@ /000
SC MAIN
JP HALT
X K /0000
Y K /0000
RES K /0000
CTE K /3030
SHIFT K /0010
DEZ K /000A
SOMA_OF K /0100
TEMP K /0000

@ /100
MAIN K /0000
    GD /000 ; recebe o primeiro numero
    MM X ; salva em x
    GD /000; recebe espaço em branco
    GD /000; recebe Y
    MM Y 
    SC SUB_ASC
    LD X 
    AD Y
    MM RES
    SC CHECK_OVERFLOW; checa overflow no digito menos significativo
    SC RETURN_ASC; (retorna o numero para ASCII)
    SC PRINT; (printa no monitor)
RS MAIN


@ /200
SUB_ASC K /000
    LD X 
    SB CTE
    MM X
    LD Y
    SB CTE
    MM Y
RS SUB_ASC

@ /225
CHECK_OVERFLOW K /000
    LD RES
    DV SHIFT ; shifta para a direita removendo o digito menos significativo
    MM TEMP
    LD RES
    SB TEMP
    SB DEZ
    JN FIM_CHECK
    AD SOMA_OF
    MM RES
FIM_CHECK RS CHECK_OVERFLOW

@ /250
RETURN_ASC K /000
    LD RES
    AD CTE
    MM RES
RS RETURN_ASC

@ /275 
PRINT K /000
    LD RES
    PD /100
RS PRINT

@ /400
HALT HM /0000
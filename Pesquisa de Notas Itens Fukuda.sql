Select
N.F2_Doc, N.F2_SERIE, N.F2_CHVNFE, cast( N.F2_EMISSAO as Date ) as Emissao,
 
C.c5_filial, C.c5_cliente, cast( C.c5_emissao as Date ) as DtEmi, 
C.c5_nota, C.c5_serie, I.C6_PRODUTO, I.C6_QTDVEN, I.C6_PRCVEN, I.C6_VALOR
 
from sc5010 C 
inner join SC6010 I on C.C5_FILIAL = I.C6_FILIAL and C.C5_NUM = I.C6_NUM
inner join SF2010 N on N.F2_FILIAL = C.C5_FILIAL and N.F2_DOC = C.C5_NOTA
inner join SD2010 D on D.D2_FILIAL = C.C5_FILIAL and D.D2_DOC = N.F2_DOC and D.D2_SERIE = N.F2_SERIE and D.D2_COD = I.C6_PRODUTO
where C.R_E_C_D_E_L_ = 0 and I.R_E_C_D_E_L_ = 0  and N.R_E_C_D_E_L_ = 0 and D.R_E_C_D_E_L_ = 0 
and C.C5_FILIAL = '01'
and cast( N.F2_EMISSAO as Date ) between Cast( '08/29/2013' as date ) and Cast( '08/29/2013' as date )

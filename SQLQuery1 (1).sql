select RA_FILIAL,RA_MAT,RA_NOME,RA_CIC,RA_CC,RD_PD,RD_VALOR
from SRA010 A,SRD010 B
where RA_FILIAL = RD_FILIAL and RA_MAT = RD_MAT and RD_PD = '068' and RD_DATARQ = '201210'
and A.D_E_L_E_T_ = ' '
and B.D_E_L_E_T_ = ' '

select RA_FILIAL, RA_MAT, RTRIM(RA_NOME), RA_CIC, RD_PD, RV_DESC,RD_VALOR, RD_CC, RD_DATARQ
FROM SRA010 A, SRV010 B, SRD010 C
WHERE A.D_E_L_E_T_ = ' '
AND B.D_E_L_E_T_ = ' '
AND C.D_E_L_E_T_ = ' '
AND RA_FILIAL = RD_FILIAL
AND RA_MAT = RD_MAT
AND RD_PD = RV_COD
AND RD_DATARQ >= '201301'
AND RD_FILIAL = '013NE005'
AND RD_VALOR <> '0'
ORDER BY RA_FILIAL, RA_MAT, RD_PD, RD_DATARQ
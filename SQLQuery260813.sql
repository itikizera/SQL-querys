select * from SRC010 where D_E_L_E_T_ = ' '
AND RC_PD = 'R31'

SELECT RA_FILIAL, RA_MAT, RTRIM(RA_NOME), RA_SALARIO, RA_CODFUNC FROM SRA010 WHERE D_E_L_E_T_ = ' '
AND SUBSTRING(RA_FILIAL,1,5) >= '001NE'
AND RA_SITFOLH <> 'D'


SELECT RD_FILIAL, RD_MAT, RD_DATARQ ,SUM(RD_VALOR) FROM SRD010 
WHERE D_E_L_E_T_ = ' '
--AND RD_FILIAL = '001NE001'
AND RD_PD IN ('274','282','764','766')
AND RD_DATARQ = '201213'
AND RD_FILIAL = '001NE002'
AND RD_MAT = '000175'
GROUP BY RD_FILIAL, RD_MAT, RD_DATARQ


SELECT RA_FILIAL, RA_MAT,RTRIM(RA_NOME), RA_SALARIO FROM SRA010 WHERE D_E_L_E_T_ = ' '

WHERE D_E_L_E_T_ = ' '
--AND RD_FILIAL = '001NE001'
AND RD_PD IN ('274','282','764')
AND RD_DATARQ = '201213'
AND RD_FILIAL = '014NE004'
AND RD_MAT = '035273'
GROUP BY RD_FILIAL, RD_MAT, RD_DATARQ


SELECT * FROM SRA010 WHERE D_E_L_E_T_ = ' '
AND RA_NOME LIKE 'MARCIO VIEIRA PADILHA'


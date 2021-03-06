SELECT * FROM SRA010 WHERE D_E_L_E_T_ = ' '
AND RA_MAT LIKE '%5130%'


SELECT RA_FILIAL, RA_MAT, RA_NOME, RA_SINDICA, RA_ASSIST
FROM SRA010 WHERE D_E_L_E_T_ = ' '
AND RA_SITFOLH <> 'D'
AND RA_FILIAL = '014NE006'
--AND RA_SINDICA = '17'
--AND RA_ASSIST = ' '
and RA_SINDICA = '44'


SELECT RA_MAT FROM SRA010 WHERE D_E_L_E_T_ = ' '
AND RA_FILIAL = '014NE004'
AND RA_SINDICA = '43'
AND RA_SITFOLH <> 'A'

SELECT RD_FILIAL, SUM(RD_VALOR) FROM SRD010 WHERE D_E_L_E_T_ = ' '
AND RD_PD < '500'
AND RD_DATARQ = '201308'
GROUP BY RD_FILIAL, RD_VALOR


SELECT P8_MAT, RA_NOME, P8_DATA, P8_HORA, P8_TPMARCA
 FROM SP8010 A, SRA010 B
  WHERE A.D_E_L_E_T_ = ' '
  AND B.D_E_L_E_T_ = ' '
  AND RA_FILIAL = P8_FILIAL
  AND RA_MAT = P8_MAT
--AND P8_CC = '070010007'
AND P8_DATA >= '20131211'
--AND P8_TPMARCA IN ('1E','2S')
and RA_FILIAL = '001NE001'


SELECT PB_FILIAL, PB_MAT, RA_NOME, PB_PD, RV_DESC, PB_TIPO1, PB_HORAS, PB_CC 
FROM SPB010 A, SRA010 B, SRV010 C
WHERE A.D_E_L_E_T_ = ' '
AND B.D_E_L_E_T_ = ' '
AND C.D_E_L_E_T_ = ' '
AND RA_FILIAL = PB_FILIAL
AND RA_MAT = PB_MAT
AND PB_PD = RV_COD
AND PB_FILIAL = '001NE001'
AND PB_DATA = '20140115'


SELECT SUM(RC_HORAS) FROM SRC010 WHERE D_E_L_E_T_ = ' '
AND RC_FILIAL = '001NE001'
AND RC_PD = '130'
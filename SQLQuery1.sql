SELECT * FROM SRM010
WHERE RM_CALCULO = 'FOL'
AND D_E_L_E_T_=''
AND RM_FORMULA LIKE '%067%'

SELECT * FROM RC3010
WHERE RC3_CODIGO IN (SELECT RC3_CODIGO FROM RC3010 WHERE RC3_RESULT LIKE '%067%')

SELECT RA_SINDICA, * FROM SRA010
WHERE RA_FILIAL IN ('014NE009','017NE001')
AND RA_SITFOLH<>'D' AND (RA_INSMIN + RA_INSMED + RA_INSMAX) > 0
AND D_E_L_E_T_<>'*'

SELECT * FROM RC3010
WHERE RC3_FORM01 LIKE '%99F%'

SELECT DISTINCT(RA_FILIAL) FROM SRA010
WHERE --RA_FILIAL IN ('014NE009','017NE001')
RA_SITFOLH<>'D' AND (RA_INSMIN + RA_INSMED + RA_INSMAX) > 0
AND D_E_L_E_T_<>'*' and RA_SINDICA='33'


SELECT RA_FILIAL, RA_MAT, RA_CC, RA_SINDICA, RA_SITFOLH, RA_ADMISSA FROM SRA010
WHERE RA_SITFOLH<>'D' AND D_E_L_E_T_<>'*'
SELECT RA_SINDICA,RA_CC, RC_CC,	* FROM SRC010 RC
INNER JOIN SRA010 RA ON RA.RA_FILIAL=RC.RC_FILIAL AND RC.RC_MAT=RA.RA_MAT AND RC.RC_CC=RA.RA_CC
WHERE RA.RA_FILIAL = '014NE004'
AND RA_SITFOLH<>'D' AND RA.D_E_L_E_T_='' AND RC.D_E_L_E_T_=''
AND RC_PD IN ('764')
AND RA.RA_SINDICA='43'
AND RA_CC IN ('021080401','021082301')

SELECT* FROM RCE010
ORDER BY 2
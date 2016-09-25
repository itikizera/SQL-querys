 SELECT RA_FILIAL,RA_MAT,RA_NOME,
 CONVERT(VARCHAR , CAST ( RA_ADMISSA AS DATETIME ), 103 ) AS ADMISSAO,
 RA_SITFOLH,RJ_DESC,CTT_DESC01,RD_PD,RV_DESC,RD_HORAS,RD_VALOR, 
 SUBSTRING(RD_DATARQ,5,2)+'/'+SUBSTRING(RD_DATARQ,1,4)RD_DATARQ
 FROM SRA010 A, SRJ010 B, CTT010 C, SRD010 D, SRV010 E
 WHERE RA_CODFUNC = RJ_FUNCAO
   AND RA_CC = CTT_CUSTO 
   AND RA_MAT = RD_MAT 
   AND RA_FILIAL = RD_FILIAL
   AND RD_PD = RV_COD
   AND A.D_E_L_E_T_  = ' ' 
   AND B.D_E_L_E_T_  = ' ' 
   AND C.D_E_L_E_T_  = ' '
   AND D.D_E_L_E_T_  = ' '
   AND E.D_E_L_E_T_  = ' '
   AND RA_FILIAL BETWEEN '001NE001' AND '001NE001'
   AND RD_DATARQ = '201411'
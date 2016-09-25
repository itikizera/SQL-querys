select RA_FILIAL, RA_MAT, RA_NOME , RA_DEMISSA, RA_AFASFGT, RC_PD, RC_VALOR, RC_DATA
 from SRA010 A ,SRC010 B
  where A.D_E_L_E_T_ = ' '
AND B.D_E_L_E_T_ = ' '
AND RA_FILIAL = RC_FILIAL
AND RA_MAT = RC_MAT
AND RC_PD = '690'
ORDER BY RC_FILIAL

select * from SRC010 where D_E_L_E_T_ = ' '
AND RC_FILIAL = '014NE001'
AND RC_PD in ('701','702','703','715')



SELECT

select * from SRA010 where D_E_L_E_T_ = ' '
AND RA_FILIAL = '014NE001'
AND RA_SINDICA = '07'

SELECT * FROM RCE010 WHERE D_E_L_E_T_ = ' '
AND RCE_CGC = '07101503000100'


SELECT T.*, PROVENTO_INSS - DESCONTO_INSS - BASE_INSS DIVERGENCIA FROM (
SELECT SRA.* FROM( 
      SELECT 
            SRA.RA_FILIAL,
            SRA.RA_MAT,
            SRA.RA_NOME,
            SRA.RA_ADMISSA,
            SRA.RA_DEMISSA,
            RA_CC,RA_CATFUNC, 
            SRA.D_E_L_E_T_, 
            CAST(ISNULL((     SELECT SUM(RC_VALOR)         
                        FROM SRC010 SRC,SRV010 SRV       
                        WHERE           
                             SRC.D_E_L_E_T_ = ' '    
                             AND SRV.D_E_L_E_T_ = ' '     
                             AND RC_PD = RV_COD      
                             AND RA_FILIAL = RC_FILIAL    
                             AND RA_MAT = RC_MAT     
                             AND ((SUBSTRING(RA_FILIAL,1,3) = '014' AND RV_INSS = 'S' AND RV_COD NOT IN ('237','245','260','271')) OR (SUBSTRING(RA_FILIAL,1,3) <> '014' AND RV_INSS = 'S') )     
                             AND RV_TIPOCOD = '1'),0) AS NUMERIC(12,2)) AS PROVENTO_INSS, 
            CAST(ISNULL((     SELECT SUM(RC_VALOR)         
                        FROM SRC010 SRC,SRV010 SRV       
                        WHERE           
                             SRC.D_E_L_E_T_ = ' '    
                              AND SRV.D_E_L_E_T_ = ' '     
                             AND RC_PD = RV_COD      
                             AND RA_FILIAL = RC_FILIAL    
                             AND RA_MAT = RC_MAT     
                             AND RV_INSS = 'S'       
                             AND RV_TIPOCOD = '2'),0) AS NUMERIC(12,2)) AS DESCONTO_INSS,
            CAST(ISNULL((     SELECT SUM(RC_VALOR)         
                        FROM SRC010 SRC,SRV010 SRV       
                        WHERE           
                             SRC.D_E_L_E_T_ = ' '    
                             AND SRV.D_E_L_E_T_ = ' '     
                             AND RC_PD = RV_COD      
                             AND RA_FILIAL = RC_FILIAL    
                             AND RA_MAT = RC_MAT     
                             AND RV_CODFOL IN ('013','014','019','020','221','399','338')),0) AS NUMERIC(12,2)) AS BASE_INSS
                             
      FROM SRA010 SRA 
      WHERE       
            D_E_L_E_T_ = ' ')SRA 
WHERE 
      SRA.D_E_L_E_T_ = ' '  
	  )T
	  WHERE PROVENTO_INSS - DESCONTO_INSS - BASE_INSS <> 0
ORDER BY T.RA_FILIAL, T.RA_MAT

SELECT * FROM SPB010 WHERE D_E_L_E_T_ = ' '

select RA_FILIAL, RA_MAT, RA_NOME , RA_CC, PB_PD, PB_TIPO1, PB_HORAS
 from SRA010 A ,SPB010 B
  where A.D_E_L_E_T_ = ' '
AND B.D_E_L_E_T_ = ' '
AND RA_FILIAL = PB_FILIAL
AND RA_MAT = PB_MAT
AND RA_FILIAL = '014NE004' 
AND PB_DATA ='20130215'
and PB_PD = 'A01'


SELECT * FROM SD1010 WHERE D_E_L_E_T_ = ' '
AND D1_CC = '070010007'

SELECT * from SRA010

SELECT RA_FILIAL, RA_MAT, RA_NOME, RA_CIC, RA_ADMISSA, RA_NASC, RA_SEXO, RA_MAE,RA_ESTCIVI, RB_NOME, RB_DTNASC
FROM SRA010 A, SRB010 B
WHERE A. D_E_L_E_T_ = ' '
AND B.D_E_L_E_T_ = ' '
AND RA_FILIAL = RB_FILIAL
AND RA_MAT = RB_MAT
AND RA_SITFOLH <> 'D'


select * from SRV010 where D_E_L_E_T_ = ' '
and RC_FILIAL = '014NE004'
ORDER BY RC_MAT


SELECT * FROM SRA010 WHERE D_E_L_E_T_ = ' '
AND RA_SITFOLH = 'D'
AND RA_FILIAL = '014NE001'

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
                        FROM RC011303 SRC,SRV010 SRV       
                        WHERE           
                             SRC.D_E_L_E_T_ = ' '    
                             AND SRV.D_E_L_E_T_ = ' '     
                             AND RC_PD = RV_COD      
                             AND RA_FILIAL = RC_FILIAL    
                             AND RA_MAT = RC_MAT     
                             AND RV_INSS = 'S'       
                             AND RV_TIPOCOD = '1'),0) AS NUMERIC(12,2)) AS PROVENTO_INSS, 
            CAST(ISNULL((     SELECT SUM(RC_VALOR)         
                        FROM RC011303 SRC,SRV010 SRV       
                        WHERE           
                             SRC.D_E_L_E_T_ = ' '    
                              AND SRV.D_E_L_E_T_ = ' '     
                             AND RC_PD = RV_COD      
                             AND RA_FILIAL = RC_FILIAL    
                             AND RA_MAT = RC_MAT     
                             AND RV_INSS = 'S'       
                             AND RV_TIPOCOD = '2'),0) AS NUMERIC(12,2)) AS DESCONTO_INSS,
            CAST(ISNULL((     SELECT SUM(RC_VALOR)         
                        FROM RC011303 SRC,SRV010 SRV       
                        WHERE           
                             SRC.D_E_L_E_T_ = ' '    
                             AND SRV.D_E_L_E_T_ = ' '     
                             AND RC_PD = RV_COD      
                             AND RA_FILIAL = RC_FILIAL    
                             AND RA_MAT = RC_MAT     
                             --AND RV_INSS = 'S'     
                             AND RV_CODFOL IN ('013','014','019','020','221','399','338')),0) AS NUMERIC(12,2)) AS BASE_INSS
                             
      FROM SRA010 SRA 
      WHERE       
            D_E_L_E_T_ = ' ')SRA 
WHERE 
      SRA.D_E_L_E_T_ = ' '  
ORDER BY SRA.RA_FILIAL, SRA.RA_MAT


SELECT RD_FILIAL, RD_MAT, RA_NOME, RD_PD, RD_VALOR 
FROM SRD010 A, SRA010 B
WHERE A.D_E_L_E_T_ = ' '
AND B.D_E_L_E_T_ = ' '
AND RA_FILIAL = RD_FILIAL
AND RA_MAT = RD_MAT
AND RD_FILIAL = '022NE001'
AND RD_PD IN ('764','766')
AND RD_DATARQ = '201303'


SELECT RD_FILIAL, RD_MAT, RA_NOME, RA_PIS, RD_PD, RD_VALOR 
FROM SRD010 A, SRA010 B
WHERE A.D_E_L_E_T_ = ' '
AND B.D_E_L_E_T_ = ' '
AND RA_FILIAL = RD_FILIAL
AND RA_MAT = RD_MAT
AND RD_FILIAL = '022NE002'
AND RD_PD in ('701','702','703','704','764','765','766')
AND RD_DATARQ = '201303'

SELECT * FROM SRX010 WHERE D_E_L_E_T_ = ' '
ORDER BY RX_TIP

SELECT * FROM SRG010 WHERE D_E_L_E_T_ = ' '

SELECT RA_FILIAL, RA_MAT, RA_NOME, RG_SALMES, RA_PIS,RA_ADMISSA, RA_DEMISSA, RG_TIPORES, RX_TXT, RR_PD, RV_DESC, RR_HORAS, RR_VALOR, RG_DATAHOM, RG_CHAMADO  
FROM  SRA010 A, SRG010 B, SRR010 C, SRV010 D, SRX010 E
WHERE A.D_E_L_E_T_ = ' '
AND B.D_E_L_E_T_ = ' '
AND C. D_E_L_E_T_ = ' '
AND D.D_E_L_E_T_ = ' '
AND E.D_E_L_E_T_ = ' '
AND RA_FILIAL = RG_FILIAL
AND RA_MAT = RG_MAT
AND RA_FILIAL = RR_FILIAL
AND RA_MAT = RR_MAT
AND RG_FILIAL = RR_FILIAL
AND RG_MAT = RR_MAT
AND RR_PD = RV_COD
AND RX_COD = RG_TIPORES
AND RA_DEMISSA >= '20130401'
AND RR_TIPO3 = 'R'

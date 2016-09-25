select RA_FILIAL,RA_MAT,RA_NOME,RA_CIC,RD_CC,RD_PD,RV_DESC,RD_HORAS,RD_VALOR,RD_DATARQ
from SRA010 A,SRD010 B, SRV010 C
where RA_FILIAL = RD_FILIAL 
and RA_MAT = RD_MAT 
and RD_PD = RV_COD 
and RV_XDEBDES = '50101010104'
and RV_XDEBCUS = '40101010104'
and RD_DATARQ >= '201201'
and RD_VALOR <> '0'
and A.D_E_L_E_T_ = ' '
and B.D_E_L_E_T_ = ' '
and C.D_E_L_E_T_ = ' '

SELECT T.*,ROUND((PROV_JAN - PROV_DEZ),2) DIF
 FROM(
SELECT RA_FILIAL,RA_MAT,RA_NOME,RA_CC,RA_ADMISSA,RA_SITFOLH,RA_SALARIO,RA_PERICUL
,ROUND(ISNULL((SELECT SUM(RT_VALOR) FROM SRT010 WHERE D_E_L_E_T_ = '' AND RT_FILIAL = RA_FILIAL AND RA_MAT = RT_MAT AND RT_DATACAL = '20121231' AND RT_VERBA = '950'),0),2) PROV_DEZ
,ROUND(ISNULL((SELECT SUM(RT_VALOR) FROM SRT010 WHERE D_E_L_E_T_ = '' AND RT_FILIAL = RA_FILIAL AND RA_MAT = RT_MAT AND RT_DATACAL = '20130131' AND RT_VERBA = '950'),0),2) PROV_JAN
FROM SRA010
WHERE 
    D_E_L_E_T_ = ''
AND RA_SITFOLH <> 'D')T 
WHERE PROV_DEZ <> PROV_JAN
AND SUBSTRING(RA_FILIAL,1,3) = '014'
ORDER BY 1,2


select RA_FILIAL,RA_MAT,RA_NOME,RA_PIS,RA_SITFOLH,RC_PD,RC_VALOR
from SRA010 A,SRC010 B
where RA_FILIAL = RC_FILIAL and RA_MAT = RC_MAT and RC_PD in ('701','702','703','704') and RC_FILIAL = '001NE001'
and A.D_E_L_E_T_ = ' '
and B.D_E_L_E_T_ = ' '

SELECT RA_MAT,RA_NOME,RA_CIC,RA_SITFOLH,RA_CC,RA_ADMISSA,RA_HRSMES,RA_TNOTRAB,RA_REGRA
FROM SRA010 
WHERE  D_E_L_E_T_ = ' '
AND RA_FILIAL = '001NE001'
AND RA_SITFOLH <> 'D'


SELECT * FROM SRV010

SELECT RA_FILIAL,RA_MAT,RA_NOME,RA_CIC,RJ_DESC,RA_ADMISSA,RA_DEMISSA
FROM SRA010 A, SRJ010 B
WHERE RA_CODFUNC = RJ_FUNCAO
AND A. D_E_L_E_T_ = ' '
AND B. D_E_L_E_T_ = ' '
AND RA_ADMISSA >= '20120801'

SELECT * FROM CTT010

SELECT * FROM CT2010 WHERE CT2_DATA >= '20130131' AND CT2_LOTE = '008890' and D_E_L_E_T_ = ' ' 

SELECT T.* FROM(
 SELECT dbo.FU_DESEMBARALHA(RA_USERLGI) INCLUSAO,RA_ADMISSA,RA_FILIAL,RA_MAT,RA_NOME,RJ_DESC,CTT_CUSTO,CTT_DESC01 
 FROM SRA010 A, SRJ010 B, CTT010 C
 WHERE RA_CODFUNC = RJ_FUNCAO AND RA_CC = CTT_CUSTO AND
 A.D_E_L_E_T_  = ' ' AND
 B.D_E_L_E_T_  = ' ' AND
 C.D_E_L_E_T_  = ' ')
 T
 WHERE SUBSTRING(INCLUSAO,1,8) >= '20110101'

 select * from SRC010 where D_E_L_E_T_ = ' '
 AND RC_VALOR > '5'
 AND RC_VALOR < '6'
 AND RC_FILIAL = '014NE008'
 AND RC_PD = '765'
 ORDER BY RC_VALOR

 select * from SRA010 where D_E_L_E_T_ = ' '
  AND RA_FILIAL = '014NE008'
  AND RA_CODFUNC = '10242'
    ORDER BY RA_MAT
  
  select * from SRS010 where D_E_L_E_T_ = ' '
  ORDER BY RS_FILIAL,RS_MES

  select * from SRC010 where D_E_L_E_T_ = ' '
 AND RC_PD in ('701','702','703','704','764','766','765','767')
 AND RC_FILIAL = '014NE008'
  ORDER BY RC_VALOR


  select RA_FILIAL, RA_MAT, RA_NOME, RA_ADMISSA, RA_DEMISSA, RA_SITFOLH from SRA010 where D_E_L_E_T_ = ' '
 
  select RA_FILIAL,RA_MAT,RA_NOME,RA_CIC,RA_SITFOLH,RA_CC,RD_PD,RV_DESC,RD_HORAS,RD_VALOR,RD_DATARQ
from SRA010 A,SRD010 B, SRV010 C
where RA_FILIAL = RD_FILIAL 
and RA_MAT = RD_MAT 
and RD_PD = RV_COD 
and RD_PD in ('123','130','131','133','134','135','136','144','217') 
and RD_DATARQ >= '201201'
and RD_CC = '070010006'
and RD_VALOR <> '0'
and A.D_E_L_E_T_ = ' '
and B.D_E_L_E_T_ = ' '
and C.D_E_L_E_T_ = ' '

SRA->RA_MAT $ '027466/035134/035625/035696/035703/036312/036322'

SRA->RA_MAT $ '033742/033751/037569/037574/037751'

SRA->RA_MAT $ '021119/023146/024774/026109/030676/033164/033202/033450/036312/036406/037192/037859'

SRA->RA_MAT $ '029200'

select * from SRA010 where D_E_L_E_T_ =  ' '
AND RA_SITFOLH = 'A'

select * from SRD010 where D_E_L_E_T_ = ' '
AND RD_PD = '300'
AND RD_DATARQ >= '201201'


select * from SRJ010 where D_E_L_E_T_ = ' '
AND RJ_DESC LIKE '%SUP%' AND RJ_DESC LIKE '%REG%'
ORDER BY RJ_DESC

: SUPERVISOR REGIONAL DE MANUTENÇÃO


select * FROM SRD010 WHERE D_E_L_E_T_ = ' ' 
AND RD_DATARQ = '201203'
AND RD_FILIAL = '001NE001'
AND RD_PD in ('701','702','703','704','764','765')

select * FROM RC011212 WHERE D_E_L_E_T_ = ' ' 
AND RC_FILIAL = '001NE001'

SELECT * FROM SRA010 WHERE D_E_L_E_T_ = ' '
AND RA_MAT IN ('000377','001008', '001068')

select RA_NOME, RA_SITFOLH, RA_SALARIO FROM SRA010 WHERE D_E_L_E_T_ = ' ' 
and RA_FILIAL = '001NE001'
AND RA_SITFOLH <> 'D'
AND RA_CATFUNC =  'P'

select *  FROM SRA010 WHERE D_E_L_E_T_ = ' ' 

select *  FROM SRV010 WHERE D_E_L_E_T_ = ' ' 

SELECT * FROM SR8010 WHERE D_E_L_E_T_ = ' '
AND R8_FILIAL = '014NE008'
AND R8_TIPO = 'O'
AND R8_DATAFIM = ' '


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
                        FROM RC011212 SRC,SRV010 SRV       
                        WHERE           
                             SRC.D_E_L_E_T_ = ' '    
                             AND SRV.D_E_L_E_T_ = ' '     
                             AND RC_PD = RV_COD      
                             AND RA_FILIAL = RC_FILIAL    
                             AND RA_MAT = RC_MAT     
                             AND RV_INSS = 'S'       
                             AND RV_TIPOCOD = '1'),0) AS NUMERIC(12,2)) AS PROVENTO_INSS, 
            CAST(ISNULL((     SELECT SUM(RC_VALOR)         
                        FROM RC011212 SRC,SRV010 SRV       
                        WHERE           
                             SRC.D_E_L_E_T_ = ' '    
                              AND SRV.D_E_L_E_T_ = ' '     
                             AND RC_PD = RV_COD      
                             AND RA_FILIAL = RC_FILIAL    
                             AND RA_MAT = RC_MAT     
                             AND RV_INSS = 'S'       
                             AND RV_TIPOCOD = '2'),0) AS NUMERIC(12,2)) AS DESCONTO_INSS,
            CAST(ISNULL((     SELECT SUM(RC_VALOR)         
                        FROM RC011212 SRC,SRV010 SRV       
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

select RA_FILIAL,RA_MAT,RA_NOME,RA_CIC,RA_CC,RD_PD,RV_DESC,RD_HORAS,RD_VALOR,RD_DATARQ
from SRA010 A,SRD010 B, SRV010 C
where RA_FILIAL = RD_FILIAL and RA_MAT = RD_MAT and RD_PD = RV_COD and RD_PD in ('123','130','131','133','134','135','136','144') and RD_DATARQ >= '201210'
and A.D_E_L_E_T_ = ' '
and B.D_E_L_E_T_ = ' '
and C.D_E_L_E_T_ = ' '

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
                        FROM RC011212 SRC,SRV010 SRV       
                        WHERE           
                             SRC.D_E_L_E_T_ = ' '    
                             AND SRV.D_E_L_E_T_ = ' '     
                             AND RC_PD = RV_COD      
                             AND RA_FILIAL = RC_FILIAL    
                             AND RA_MAT = RC_MAT     
                             AND (RV_INSS = 'S'  AND RV_COD NOT IN ('237','245','260','271'))      
                             AND RV_TIPOCOD = '1'),0) AS NUMERIC(12,2)) AS PROVENTO_INSS, 
            CAST(ISNULL((     SELECT SUM(RC_VALOR)         
                        FROM RC011212 SRC,SRV010 SRV       
                        WHERE           
                             SRC.D_E_L_E_T_ = ' '    
                              AND SRV.D_E_L_E_T_ = ' '     
                             AND RC_PD = RV_COD      
                             AND RA_FILIAL = RC_FILIAL    
                             AND RA_MAT = RC_MAT     
                             AND RV_INSS = 'S'       
                             AND RV_TIPOCOD = '2'),0) AS NUMERIC(12,2)) AS DESCONTO_INSS,
            CAST(ISNULL((     SELECT SUM(RC_VALOR)         
                        FROM RC011212 SRC,SRV010 SRV       
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

select * from SRD010 WHERE D_E_L_E_T_ = ' '
AND RD_PD = '537'
AND RD_FILIAL = '014NE008'


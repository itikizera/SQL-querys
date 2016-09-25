
--Juliana
SELECT RA_FILIAL,RA_MAT,RA_NOME,RA_CIC,RA_ADMISSA,RJ_DESC,CTT_DESC01
FROM SRA010 A, SRJ010 B, CTT010 C
WHERE
A.D_E_L_E_T_ = ''
AND B.D_E_L_E_T_ = ''
AND C.D_E_L_E_T_ = '' 
AND RA_SITFOLH <> 'D'
AND RA_ADMISSA >= '20130501'
AND RA_CODFUNC = RJ_FUNCAO
AND RA_CC = CTT_CUSTO



SELECT RA_FILIAL,RA_MAT,RA_NOME,RA_CIC,RA_ADMISSA,RJ_DESC,CTT_DESC01
FROM SRA010 A, SRJ010 B, CTT010 C
WHERE
A.D_E_L_E_T_ = ''
AND B.D_E_L_E_T_ = ''
AND C.D_E_L_E_T_ = '' 
AND RA_SITFOLH <> 'D'
AND RA_ADMISSA >= '20121101'
AND RA_CODFUNC = RJ_FUNCAO
AND RA_CC = CTT_CUSTO

--Indicador
SELECT T.* FROM(
 SELECT dbo.FU_DESEMBARALHA(RA_USERLGI) INCLUSAO,RA_ADMISSA,RA_FILIAL,RA_MAT,RA_NOME,RJ_DESC,CTT_CUSTO,CTT_DESC01 
 FROM SRA010 A, SRJ010 B, CTT010 C
 WHERE RA_CODFUNC = RJ_FUNCAO AND RA_CC = CTT_CUSTO AND
 A.D_E_L_E_T_  = ' ' AND
 B.D_E_L_E_T_  = ' ' AND
 C.D_E_L_E_T_  = ' ')
 T
 WHERE SUBSTRING(INCLUSAO,1,8) >= '20130401'


 SELECT RA_FILIAL,RA_MAT,RA_NOME,RA_CIC,RA_ADMISSA,RA_DEMISSA,RJ_DESC, RA_CC
FROM SRA010 A, SRJ010 B
WHERE
A.D_E_L_E_T_ = ''
AND B.D_E_L_E_T_ = ''
AND RA_CODFUNC = RJ_FUNCAO
AND RA_SITFOLH = 'D'
AND RA_RESCRAI <> '31'
AND RA_DEMISSA >= '20130501'

--demitidos
SELECT RA_FILIAL,RA_CC,RA_MAT,RTRIM(RA_NOME),RA_CIC,RA_ADMISSA,RG_TIPORES,RA_DEMISSA,RJ_DESC,RG_CHAMADO 
FROM SRA010 A, SRJ010 B, SRG010 C
WHERE
A.D_E_L_E_T_ = ''
AND B.D_E_L_E_T_ = ''
AND C.D_E_L_E_T_ = ''
AND RA_FILIAL = RG_FILIAL
AND RA_MAT = RG_MAT
AND RA_CODFUNC = RJ_FUNCAO
AND RA_SITFOLH = 'D'
AND RA_RESCRAI <> '31'
AND RA_DEMISSA >= '20130501'


SELECT RA_FILIAL,RA_MAT,RTRIM(RA_NOME),RA_CIC,RA_ADMISSA,RJ_DESC,RA_CC, RH_CHAMADO, RH_DATAINI
FROM SRA010 A, SRJ010 B, SRH010 C
WHERE
A.D_E_L_E_T_ = ''
AND B.D_E_L_E_T_ = ''
AND C.D_E_L_E_T_ = ''
AND RA_CODFUNC = RJ_FUNCAO
AND RA_FILIAL = RH_FILIAL
AND RA_MAT = RH_MAT
AND RA_SITFOLH <> 'D'
AND RA_RESCRAI <> '31'
AND RH_DATAINI >= '20130501'


select * from SRG010 WHERE D_E_L_E_T_ = ' '

select * from SRR010 WHERE D_E_L_E_T_ = ' '

SELECT RG_FILIAL, RG_MAT, RA_NOME, RG_TIPORES, RG_DATADEM, RG_DTAVISO, RG_DAVISO, RR_TIPO3
FROM SRG010 A, SRR010 B, SRA010 C
WHERE A.D_E_L_E_T_ = ' '
AND B.D_E_L_E_T_ = ' '
AND C.D_E_L_E_T_ = ' '
AND RA_FILIAL = RG_FILIAL
AND RA_MAT = RG_MAT
AND RA_FILIAL = RR_FILIAL
AND RA_MAT = RR_MAT
AND RG_FILIAL = RR_FILIAL
AND RG_MAT = RR_MAT
--AND RG_DATAHOM = RR_DATA
AND RG_DATADEM = RR_DATA


SELECT RA_FILIAL, RA_MAT, RTRIM(RA_NOME), RJ_DESC, RA_CC, RA_SALARIO, RG_SALMES, RA_PIS,RA_ADMISSA, RA_DEMISSA, RG_DTAVISO, RG_DAVISO, RG_TIPORES, RX_TXT, RR_PD, RV_DESC, RR_HORAS, RR_VALOR, RG_DATAHOM, RG_CHAMADO  
FROM  SRA010 A, SRG010 B, SRR010 C, SRV010 D, SRX010 E, SRJ010 F
WHERE A.D_E_L_E_T_ = ' '
AND B.D_E_L_E_T_ = ' '
AND C. D_E_L_E_T_ = ' '
AND D.D_E_L_E_T_ = ' '
AND E.D_E_L_E_T_ = ' '
AND F.D_E_L_E_T_ = ' '
AND RA_FILIAL = RG_FILIAL
AND RA_MAT = RG_MAT
AND RA_CODFUNC = RJ_FUNCAO
AND RA_FILIAL = RR_FILIAL
AND RA_MAT = RR_MAT
AND RG_FILIAL = RR_FILIAL
AND RG_MAT = RR_MAT
AND RR_PD = RV_COD
AND RX_COD = RG_TIPORES
AND RA_DEMISSA = '20130301'
--AND RR_TIPO3 = 'R'
AND RR_PD = '764'

SELECT * FROM SRR010 WHERE D_E_L_E_T_ = ' '
AND RR_FILIAL = '001NE003'
AND RR_MAT = '000159'


SELECT RA_FILIAL, RA_MAT, RA_PIS, RJ_FUNCAO, RJ_DESC, RA_SALARIO
FROM SRA010 A, SRJ010 B
WHERE A.D_E_L_E_T_ = ' '
AND B.D_E_L_E_T_ = ' '
AND RA_CODFUNC = RJ_FUNCAO
AND RA_FILIAL = '001NE002'
AND RA_SITFOLH <> 'D'
ORDER BY RJ_DESC


select RA_FILIAL,RA_MAT,RA_SITFOLH, RTRIM(RA_NOME) ,RA_CIC,RA_CC, RA_ASSMED_, RA_ASSODO_, RD_PD,RD_DATARQ,RD_VALOR
from SRA010 A,SRD010 B
where RA_FILIAL = RD_FILIAL and RA_MAT = RD_MAT and RD_PD in ('550','552','560','562','569') and RD_DATARQ >= '201304'
and A.D_E_L_E_T_ = ' '
and B.D_E_L_E_T_ = ' '


SELECT RA_FILIAL, RA_MAT, RTRIM(RA_NOME), RA_SALARIO, RA_PIS, RA_ADMISSA, RA_DEMISSA, RD_PD, RD_VALOR  
FROM  SRA010 A, SRD010 B
WHERE A.D_E_L_E_T_ = ' '
AND B.D_E_L_E_T_ = ' '
AND RA_FILIAL = RD_FILIAL
AND RA_MAT = RD_MAT
AND RD_DATARQ = '201303'
AND RD_PD = '764'


select RR_MAT, RR_PD, RV_DESC, RR_HORAS,RR_VALOR , RR_DATA
from SRR010 A, SRV010 B
WHERE A.D_E_L_E_T_ = ' '
AND B.D_E_L_E_T_ = ' '
AND RR_PD = RV_COD
AND RR_FILIAL = '014NE008'
AND RR_MAT = '037753'
AND RR_DATA < '20130501'
AND RR_TIPO3 = 'R'


SELECT RA_SITFOLH, * FROM SRA010 WHERE D_E_L_E_T_ = ' '
AND RA_FILIAL = '014NE008'
AND RA_CODFUNC = '10008'


select * from SRR010 WHERE D_E_L_E_T_ = ' '
AND RR_TIPO3 = 'R'
AND RR_FILIAL = '014NE004'
AND RR_DATAPAG = '20130518'

select * from SRJ010 WHERE D_E_L_E_T_ = ' ' ORDER BY RJ_DESC

select RA_FILIAL, RA_CC, RA_MAT, RA_NOME, RJ_DESC, RA_ADMISSA, RF_DATABAS, RF_DFERVAT, RF_DFALVAT, RF_DFERAAT, RF_DFALAAT, RA_LOTACA_,  --, X5_DESCRI   

FROM SRA010 A, SRF010 B, SRJ010 C --, SX5010 D
WHERE A.D_E_L_E_T_ = ' '
AND B.D_E_L_E_T_ = ' '
AND C.D_E_L_E_T_ = ' '
--AND D.D_E_L_E_T_ = ' '
AND RA_CODFUNC = RJ_FUNCAO
AND RA_FILIAL = RF_FILIAL
AND RA_MAT = RF_MAT
--AND X5_TABELA = 'LT'
--AND X5_CHAVE = RA_LOTACA_
AND RA_FILIAL = '014NE008'
AND RA_SITFOLH <> 'D'

SELECT RA_FILIAL,RA_MAT,RTRIM(RA_NOME),RA_CIC,RA_ADMISSA,RJ_DESC,RA_CC, RF_CHAMADO, RH_DATAINI
FROM SRA010 A, SRJ010 B, SRH010 C, SRF010 D
WHERE
A.D_E_L_E_T_ = ''
AND B.D_E_L_E_T_ = ''
AND C.D_E_L_E_T_ = ''
AND D.D_E_L_E_T_ = ' '
AND RA_CODFUNC = RJ_FUNCAO
AND RA_FILIAL = RH_FILIAL
AND RA_MAT = RH_MAT
AND RA_SITFOLH <> 'D'
AND RA_RESCRAI <> '31'
AND RH_DATAINI >= '20130501'
AND RF_DATAINI = RH_DATAINI
AND RF_FILIAL = RH_FILIAL
AND RF_MAT = RH_MAT

SELECT * FROM SRF010

select RF_CHAMADO, RH_CHAMADO
from SRF010 A, SRH010 B
WHERE A.D_E_L_E_T_ = ' '
AND B.D_E_L_E_T_ = ' '
AND RF_CHAMADO = RH_CHAMADO


select *  from SRR010 WHERE D_E_L_E_T_ = ''
AND RR_TIPO3 = 'R'
AND RR_DATAPAG >= '20121001'


select * from SRA010 where D_E_L_E_T_ = ' '
AND RA_FILIAL = '009NE001'
ORDER BY RA_NOME




select RA_DEMISSA, RTRIM(RA_NOME), RA_FILIAL, RA_MAT from SRA010 where D_E_L_E_T_ = ' '
--AND RA_FILIAL = '022NE002'
AND RA_SITFOLH = 'D'
ORDER BY RA_NOME


select RD_FILIAL, RD_MAT, RD_VALOR, RV_DESC, RD_DATARQ
from SRD010 A, SRV010 B
WHERE A.D_E_L_E_T_ = ' '
AND B.D_E_L_E_T_ = ' '
AND RV_COD = RD_PD
AND RD_PD IN ('764', '766', '282', '274')
AND RD_DATARQ >= '201303'
AND RD_FILIAL = '014NE004'


select * from SRC010 WHERE D_E_L_E_T_ = ' '
AND RC_FILIAL = '023NE001'
AND RC_PD = '587'

select RV_COD, RV_DESC, RV_CODCOM_ from SRV010 WHERE D_E_L_E_T_ =  ' ' order by RV_DESC

SELECT RA_MAT, RA_SALARIO, RJ_DESC 
FROM SRA010 A, SRJ010 B
WHERE A.D_E_L_E_T_ = ' '
AND B.D_E_L_E_T_ = ' '
AND RA_CODFUNC = RJ_FUNCAO
AND RA_FILIAL = '023NE001'


select RA_FILIAL, RA_MAT, RA_ADMISSA, RF_DATABAS
FROM SRA010 A, SRF010 B
WHERE A.D_E_L_E_T_ = ' '
AND B.D_E_L_E_T_ = ' '
AND RA_FILIAL = RF_FILIAL
AND RA_MAT = RF_MAT
AND RA_SITFOLH <> 'D'

SELECT * FROM  SR9010 WHERE D_E_L_E_T_ = ' '

SELECT T.* FROM(
SELECT RA_FILIAL,RA_MAT,RA_NOME,RA_CATEG,RA_OCORREN,RA_SITFOLH,RA_AFASFGT,RA_RESCRAI,RA_DEMISSA,RA_ADMISSA,RA_TPCONTR
,ISNULL((SELECT SUM(RC_VALOR) FROM SRC010 WHERE D_E_L_E_T_ = '' AND
RC_FILIAL = RA_FILIAL AND RC_MAT = RA_MAT AND RC_PD IN
('701','702')),0) BASE_INSS
,ISNULL((SELECT SUM(RC_VALOR) FROM SRC010 WHERE D_E_L_E_T_ = '' AND
RC_FILIAL = RA_FILIAL AND RC_MAT = RA_MAT AND RC_PD IN
('503','501')),0) INSS_DESC
,ISNULL((SELECT SUM(RC_VALOR) FROM SRC010 WHERE D_E_L_E_T_ = '' AND
RC_FILIAL = RA_FILIAL AND RC_MAT = RA_MAT AND RC_PD IN
('703','704')),0) BASE_INSS13
,ISNULL((SELECT SUM(RC_VALOR) FROM SRC010 WHERE D_E_L_E_T_ = '' AND
RC_FILIAL = RA_FILIAL AND RC_MAT = RA_MAT AND RC_PD IN ('502')),0)
INSS_DESC_13
,ISNULL((SELECT SUM(RC_VALOR) FROM SRC010 WHERE D_E_L_E_T_ = '' AND
RC_FILIAL = RA_FILIAL AND RC_MAT = RA_MAT AND RC_PD IN ('764')),0)
BASE_FGTS
,ISNULL((SELECT SUM(RC_VALOR) FROM SRC010 WHERE D_E_L_E_T_ = '' AND
RC_FILIAL = RA_FILIAL AND RC_MAT = RA_MAT AND RC_PD IN ('765')),0)
FGTS
,ISNULL((SELECT SUM(RC_VALOR) FROM SRC010 WHERE D_E_L_E_T_ = '' AND
RC_FILIAL = RA_FILIAL AND RC_MAT = RA_MAT AND RC_PD IN ('766')),0)
BASE_FGTS13
,ISNULL((SELECT SUM(RC_VALOR) FROM SRC010 WHERE D_E_L_E_T_ = '' AND
RC_FILIAL = RA_FILIAL AND RC_MAT = RA_MAT AND RC_PD IN ('767')),0)
FGTS13
FROM SRA010
WHERE
D_E_L_E_T_ = ''
AND RA_FILIAL = '002NE003')T
WHERE BASE_FGTS > 0 OR BASE_FGTS13 > 0 OR BASE_INSS > 0 AND BASE_INSS13 > 0



SELECT * FROM SRA010 WHERE D_E_L_E_T_ = ' '
AND RA_DEMISSA >='20130501'
AND RA_FILIAL = '022NE005'
ORDER BY RA_MAT


SELECT * FROM SRR010 WHERE D_E_L_E_T_ = ' '
AND RR_FILIAL = '022NE002'
AND RR_MAT = '004243'
ORDER BY RR_PD


select RA_FILIAL, RA_CC, RA_MAT, RA_NOME, RJ_DESC, RA_ADMISSA, RF_DATABAS, RF_DFERVAT, RF_DFALVAT, RF_DFERAAT, RF_DFALAAT, RA_LOTACA_   
FROM SRA010 A, SRF010 B, SRJ010 C
WHERE A.D_E_L_E_T_ = ' '
AND B.D_E_L_E_T_ = ' '
AND C.D_E_L_E_T_ = ' '
AND RA_CODFUNC = RJ_FUNCAO
AND RA_FILIAL = RF_FILIAL
AND RA_MAT = RF_MAT
--AND SUBSTRING(RA_CC,1,5) = '07001'
AND RA_SITFOLH <> 'D'
AND RA_RESCRAI <> '31'
and RA_FILIAL = '001NE001'


select RA_MAT, RA_NOME, RA_ADMISSA, RA_DEMISSA, RJ_DESC, RA_SALARIO
from SRA010 A, SRJ010 B
WHERE A.D_E_L_E_T_ = ' '
AND B.D_E_L_E_T_ = ' '
AND RA_CODFUNC = RJ_FUNCAO
AND RA_CC = '070010007'


SELECT W.* FROM(
SELECT T.* 
,ROUND(ISNULL((SELECT SUM(RZ_VAL) FROM SRZ010 WHERE D_E_L_E_T_ = '' AND RA_FILIAL = RZ_FILIAL AND RA_MAT = RZ_MAT AND RZ_CC = CC AND RZ_PD = '058'),0),2) PERIC
,ROUND(ISNULL((SELECT SUM(RZ_VAL) FROM SRZ010 WHERE D_E_L_E_T_ = '' AND RA_FILIAL = RZ_FILIAL AND RA_MAT = RZ_MAT AND RZ_CC = CC AND RZ_PD IN ('048','049','050')),0),2) INSALUB
,ROUND(ISNULL((SELECT SUM(RZ_VAL) FROM SRZ010 WHERE D_E_L_E_T_ = '' AND RA_FILIAL = RZ_FILIAL AND RA_MAT = RZ_MAT AND RZ_CC = CC AND RZ_PD = '765'),0),2) FGTS
,ROUND(ISNULL((SELECT SUM(RZ_VAL) FROM SRZ010 WHERE D_E_L_E_T_ = '' AND RA_FILIAL = RZ_FILIAL AND RA_MAT = RZ_MAT AND RZ_CC = CC AND RZ_PD IN ('713','714','715')),0),2) INSS
,ROUND(ISNULL((SELECT SUM(RZ_VAL) FROM SRZ010 WHERE D_E_L_E_T_ = '' AND RA_FILIAL = RZ_FILIAL AND RA_MAT = RZ_MAT AND RZ_CC = CC AND RZ_PD IN ('953')),0),2) PROV_13SAL
,ROUND(ISNULL((SELECT SUM(RZ_VAL) FROM SRZ010 WHERE D_E_L_E_T_ = '' AND RA_FILIAL = RZ_FILIAL AND RA_MAT = RZ_MAT AND RZ_CC = CC AND RZ_PD IN ('955')),0),2) PROV_FGTS_13SAL
,ROUND(ISNULL((SELECT SUM(RZ_VAL) FROM SRZ010 WHERE D_E_L_E_T_ = '' AND RA_FILIAL = RZ_FILIAL AND RA_MAT = RZ_MAT AND RZ_CC = CC AND RZ_PD IN ('954')),0),2) PROV_INSS_13SAL
,ROUND(ISNULL((SELECT SUM(RZ_VAL) FROM SRZ010 WHERE D_E_L_E_T_ = '' AND RA_FILIAL = RZ_FILIAL AND RA_MAT = RZ_MAT AND RZ_CC = CC AND RZ_PD IN ('950','960','961')),0),2) PROV_FERIAS
,ROUND(ISNULL((SELECT SUM(RZ_VAL) FROM SRZ010 WHERE D_E_L_E_T_ = '' AND RA_FILIAL = RZ_FILIAL AND RA_MAT = RZ_MAT AND RZ_CC = CC AND RZ_PD IN ('952')),0),2) PROV_FERIAS_FGTS
,ROUND(ISNULL((SELECT SUM(RZ_VAL) FROM SRZ010 WHERE D_E_L_E_T_ = '' AND RA_FILIAL = RZ_FILIAL AND RA_MAT = RZ_MAT AND RZ_CC = CC AND RZ_PD IN ('951')),0),2) PROV_FERIAS_INSS
,ROUND(ISNULL((SELECT SUM(RZ_VAL) FROM SRZ010 WHERE D_E_L_E_T_ = '' AND RA_FILIAL = RZ_FILIAL AND RA_MAT = RZ_MAT AND RZ_CC = CC AND RZ_PD IN ('900')),0),2) ASS_MED_EMPRESA
,ROUND(ISNULL((SELECT SUM(RZ_VAL) FROM SRZ010 WHERE D_E_L_E_T_ = '' AND RA_FILIAL = RZ_FILIAL AND RA_MAT = RZ_MAT AND RZ_CC = CC AND RZ_PD IN ('B09')),0),2) ASS_ODO_EMPRESA
,ROUND(ISNULL((SELECT SUM(RZ_VAL) FROM SRZ010 WHERE D_E_L_E_T_ = '' AND RA_FILIAL = RZ_FILIAL AND RA_MAT = RZ_MAT AND RZ_CC = CC AND RZ_PD IN ('831')),0),2) SEGURO_VIDA
,ROUND(ISNULL((SELECT SUM(RZ_VAL) FROM SRZ010 WHERE D_E_L_E_T_ = '' AND RA_FILIAL = RZ_FILIAL AND RA_MAT = RZ_MAT AND RZ_CC = CC AND RZ_PD IN ('872')),0),2) VT_EMPRESA
,ROUND(ISNULL((SELECT SUM(RZ_VAL) FROM SRZ010 WHERE D_E_L_E_T_ = '' AND RA_FILIAL = RZ_FILIAL AND RA_MAT = RZ_MAT AND RZ_CC = CC AND RZ_PD IN ('871')),0),2) REFEICAO_EMPRESA
,ROUND(ISNULL((SELECT SUM(RZ_VAL) FROM SRZ010 WHERE D_E_L_E_T_ = '' AND RA_FILIAL = RZ_FILIAL AND RA_MAT = RZ_MAT AND RZ_CC = CC AND RZ_PD IN ('870')),0),2) ALIMENTACAO_EMPRESA
FROM(
SELECT RA_FILIAL,RA_CC CC,CTT_DESC01,RA_MAT,RA_NOME,RA_SALARIO
FROM SRA010 A, CTT010 B
WHERE
    A.D_E_L_E_T_ = '' AND B.D_E_L_E_T_ = '' AND CTT_CUSTO = RA_CC
    AND SUBSTRING(RA_FILIAL,1,3) IN ('001','002','003','004','005','006','007','008','009','010','011','012','013','014','015','016','017','018','019','020','021','022','023','024','025'))T)W
WHERE PERIC+FGTS+INSS+PROV_13SAL+PROV_FGTS_13SAL+PROV_INSS_13SAL+PROV_FERIAS_FGTS+PROV_FERIAS_INSS+ASS_MED_EMPRESA+ASS_ODO_EMPRESA+SEGURO_VIDA+VT_EMPRESA+REFEICAO_EMPRESA+ALIMENTACAO_EMPRESA > 0
ORDER BY RA_FILIAL,RA_MAT



select * from SRC010 WHERE D_E_L_E_T_ = ' '
AND RC_FILIAL = '022NE002'
AND RC_TIPO2 = 'E'


select RA_FILIAL, RA_MAT, RTRIM(RA_NOME), RA_SINDICA, RA_SALARIO, RA_ADMISSA, RC_PD, RC_VALOR
 FROM SRA010 A, SRC010  B
 WHERE A.D_E_L_E_T_ = ' '
 AND B.D_E_L_E_T_ = ' '
 AND RA_FILIAL = RC_FILIAL
 AND RA_MAT = RC_MAT
 and RA_FILIAL = '022NE005'
 AND RC_PD = '592'
 --AND SUBSTRING(RA_FILIAL,1,3) = '001'


 select RA_FILIAL, RA_MAT, RTRIM(RA_NOME), RA_SINDICA, RA_SALARIO, RA_ADMISSA, RA_SITFOLH
 FROM SRA010 
 WHERE D_E_L_E_T_ = ' '
 and RA_FILIAL = '022NE005'


 SELECT T.* FROM(
SELECT RA_FILIAL,RA_MAT,RA_NOME,RA_CATEG,RA_OCORREN,RA_SITFOLH,RA_AFASFGT,RA_RESCRAI,RA_DEMISSA
,ISNULL((SELECT SUM(RC_VALOR) FROM SRC010 WHERE D_E_L_E_T_ = '' AND
RC_FILIAL = RA_FILIAL AND RC_MAT = RA_MAT AND RC_PD IN
('701','702')),0) BASE_INSS
,ISNULL((SELECT SUM(RC_VALOR) FROM SRC010 WHERE D_E_L_E_T_ = '' AND
RC_FILIAL = RA_FILIAL AND RC_MAT = RA_MAT AND RC_PD IN
('503','501')),0) INSS_DESC
,ISNULL((SELECT SUM(RC_VALOR) FROM SRC010 WHERE D_E_L_E_T_ = '' AND
RC_FILIAL = RA_FILIAL AND RC_MAT = RA_MAT AND RC_PD IN
('703','704')),0) BASE_INSS13
,ISNULL((SELECT SUM(RC_VALOR) FROM SRC010 WHERE D_E_L_E_T_ = '' AND
RC_FILIAL = RA_FILIAL AND RC_MAT = RA_MAT AND RC_PD IN ('502')),0)
INSS_DESC_13
,ISNULL((SELECT SUM(RC_VALOR) FROM SRC010 WHERE D_E_L_E_T_ = '' AND
RC_FILIAL = RA_FILIAL AND RC_MAT = RA_MAT AND RC_PD IN ('764')),0)
BASE_FGTS
,ISNULL((SELECT SUM(RC_VALOR) FROM SRC010 WHERE D_E_L_E_T_ = '' AND
RC_FILIAL = RA_FILIAL AND RC_MAT = RA_MAT AND RC_PD IN ('765')),0)
FGTS
,ISNULL((SELECT SUM(RC_VALOR) FROM SRC010 WHERE D_E_L_E_T_ = '' AND
RC_FILIAL = RA_FILIAL AND RC_MAT = RA_MAT AND RC_PD IN ('766')),0)
BASE_FGTS13
,ISNULL((SELECT SUM(RC_VALOR) FROM SRC010 WHERE D_E_L_E_T_ = '' AND
RC_FILIAL = RA_FILIAL AND RC_MAT = RA_MAT AND RC_PD IN ('767')),0)
FGTS13
FROM SRA010
WHERE
D_E_L_E_T_ = ''
AND RA_FILIAL = '022NE005')T
WHERE BASE_FGTS > 0 OR BASE_FGTS13 > 0 OR BASE_INSS > 0 AND BASE_INSS13 > 0


SELECT W.* FROM(
SELECT T.* 
,ROUND(ISNULL((SELECT SUM(RZ_VAL) FROM SRZ010 WHERE D_E_L_E_T_ = '' AND RA_FILIAL = RZ_FILIAL AND RA_MAT = RZ_MAT AND RZ_CC = CC AND RZ_PD = '058'),0),2) PERIC
,ROUND(ISNULL((SELECT SUM(RZ_VAL) FROM SRZ010 WHERE D_E_L_E_T_ = '' AND RA_FILIAL = RZ_FILIAL AND RA_MAT = RZ_MAT AND RZ_CC = CC AND RZ_PD IN ('048','049','050')),0),2) INSALUB
,ROUND(ISNULL((SELECT SUM(RZ_VAL) FROM SRZ010 WHERE D_E_L_E_T_ = '' AND RA_FILIAL = RZ_FILIAL AND RA_MAT = RZ_MAT AND RZ_CC = CC AND RZ_PD = '765'),0),2) FGTS
,ROUND(ISNULL((SELECT SUM(RZ_VAL) FROM SRZ010 WHERE D_E_L_E_T_ = '' AND RA_FILIAL = RZ_FILIAL AND RA_MAT = RZ_MAT AND RZ_CC = CC AND RZ_PD IN ('713','714','715')),0),2) INSS
,ROUND(ISNULL((SELECT SUM(RZ_VAL) FROM SRZ010 WHERE D_E_L_E_T_ = '' AND RA_FILIAL = RZ_FILIAL AND RA_MAT = RZ_MAT AND RZ_CC = CC AND RZ_PD IN ('953')),0),2) PROV_13SAL
,ROUND(ISNULL((SELECT SUM(RZ_VAL) FROM SRZ010 WHERE D_E_L_E_T_ = '' AND RA_FILIAL = RZ_FILIAL AND RA_MAT = RZ_MAT AND RZ_CC = CC AND RZ_PD IN ('955')),0),2) PROV_FGTS_13SAL
,ROUND(ISNULL((SELECT SUM(RZ_VAL) FROM SRZ010 WHERE D_E_L_E_T_ = '' AND RA_FILIAL = RZ_FILIAL AND RA_MAT = RZ_MAT AND RZ_CC = CC AND RZ_PD IN ('954')),0),2) PROV_INSS_13SAL
,ROUND(ISNULL((SELECT SUM(RZ_VAL) FROM SRZ010 WHERE D_E_L_E_T_ = '' AND RA_FILIAL = RZ_FILIAL AND RA_MAT = RZ_MAT AND RZ_CC = CC AND RZ_PD IN ('950','960','961')),0),2) PROV_FERIAS
,ROUND(ISNULL((SELECT SUM(RZ_VAL) FROM SRZ010 WHERE D_E_L_E_T_ = '' AND RA_FILIAL = RZ_FILIAL AND RA_MAT = RZ_MAT AND RZ_CC = CC AND RZ_PD IN ('952')),0),2) PROV_FERIAS_FGTS
,ROUND(ISNULL((SELECT SUM(RZ_VAL) FROM SRZ010 WHERE D_E_L_E_T_ = '' AND RA_FILIAL = RZ_FILIAL AND RA_MAT = RZ_MAT AND RZ_CC = CC AND RZ_PD IN ('951')),0),2) PROV_FERIAS_INSS
,ROUND(ISNULL((SELECT SUM(RZ_VAL) FROM SRZ010 WHERE D_E_L_E_T_ = '' AND RA_FILIAL = RZ_FILIAL AND RA_MAT = RZ_MAT AND RZ_CC = CC AND RZ_PD IN ('900')),0),2) ASS_MED_EMPRESA
,ROUND(ISNULL((SELECT SUM(RZ_VAL) FROM SRZ010 WHERE D_E_L_E_T_ = '' AND RA_FILIAL = RZ_FILIAL AND RA_MAT = RZ_MAT AND RZ_CC = CC AND RZ_PD IN ('B09')),0),2) ASS_ODO_EMPRESA
,ROUND(ISNULL((SELECT SUM(RZ_VAL) FROM SRZ010 WHERE D_E_L_E_T_ = '' AND RA_FILIAL = RZ_FILIAL AND RA_MAT = RZ_MAT AND RZ_CC = CC AND RZ_PD IN ('831')),0),2) SEGURO_VIDA
,ROUND(ISNULL((SELECT SUM(RZ_VAL) FROM SRZ010 WHERE D_E_L_E_T_ = '' AND RA_FILIAL = RZ_FILIAL AND RA_MAT = RZ_MAT AND RZ_CC = CC AND RZ_PD IN ('872')),0),2) VT_EMPRESA
,ROUND(ISNULL((SELECT SUM(RZ_VAL) FROM SRZ010 WHERE D_E_L_E_T_ = '' AND RA_FILIAL = RZ_FILIAL AND RA_MAT = RZ_MAT AND RZ_CC = CC AND RZ_PD IN ('871')),0),2) REFEICAO_EMPRESA
,ROUND(ISNULL((SELECT SUM(RZ_VAL) FROM SRZ010 WHERE D_E_L_E_T_ = '' AND RA_FILIAL = RZ_FILIAL AND RA_MAT = RZ_MAT AND RZ_CC = CC AND RZ_PD IN ('870')),0),2) ALIMENTACAO_EMPRESA
,ROUND(ISNULL((SELECT SUM(RZ_VAL) FROM SRZ010 WHERE D_E_L_E_T_ = '' AND RA_FILIAL = RZ_FILIAL AND RA_MAT = RZ_MAT AND RZ_CC = CC AND RZ_PD IN ('123','130','131','132','133','134','135','136','137','141','142','143','144','145','146','147','148')),0),2) HORAS_EXTRAS
,ROUND(ISNULL((SELECT SUM(RZ_VAL) FROM SRZ010 WHERE D_E_L_E_T_ = '' AND RA_FILIAL = RZ_FILIAL AND RA_MAT = RZ_MAT AND RZ_CC = CC AND RZ_PD IN ('090','091','092','093','094','095','096')),0)+RA_SALARIO,2)  SALARIO_INCORP
FROM(
SELECT RA_FILIAL,RA_CC CC,CTT_DESC01,RA_MAT,RA_NOME,RA_SALARIO
FROM SRA010 A, CTT010 B
WHERE
    A.D_E_L_E_T_ = '' AND B.D_E_L_E_T_ = '' AND CTT_CUSTO = RA_CC
    AND SUBSTRING(RA_FILIAL,1,3) in ('001','002','003','004','005','006','007','008','009','010','011','012','013','014','015','016','017','022','023','024'))T)W
WHERE PERIC+FGTS+INSS+PROV_13SAL+PROV_FGTS_13SAL+PROV_INSS_13SAL+PROV_FERIAS_FGTS+PROV_FERIAS_INSS+ASS_MED_EMPRESA+ASS_ODO_EMPRESA+SEGURO_VIDA+VT_EMPRESA+REFEICAO_EMPRESA+ALIMENTACAO_EMPRESA > -10
ORDER BY RA_FILIAL,RA_MAT

SELECT * FROM SRZ010 WHERE D_E_L_E_T_ = ' '
AND RZ_MAT = '036407'



SELECT RA_FILIAL, RA_MAT, RA_NOME, RA_ADMISSA, RA_DEMISSA, RA_SITFOLH, RJ_DESC, RA_CC
FROM SRA010 A, SRJ010 B
WHERE A.D_E_L_E_T_ = ' '
AND B.D_E_L_E_T_ = ' '
and RA_CODFUNC = RJ_FUNCAO
AND RA_CC IN ('023030202','023030102','023010102','023010101','023010102','023020102','023040101','023040201','023040301','023040401')


--pensao ferias e rescisao	
select * from SRR010 WHERE D_E_L_E_T_ = ' '
AND RR_PD IN ('520','521','522','523','524','525','526','527','528','546','549','614') 
AND RR_DATA >= '20130501'



select * from SRD010 
WHERE RD_DATARQ = '201305'
and RD_TIPO2 <> 'C'
and RD_TIPO2 <> 'K'
and RD_TIPO2 <> 'V'
and RD_TIPO2 <> 'R'
and RD_TIPO2 <> 'A'

AND RD_PD = '999'

select *from SRR010 WHERE D_E_L_E_T_ = ' '
AND RR_TIPO3 = 'R'
AND RR_DATAPAG >= '20130501'


SELECT * from RC011305
WHERE RC_TIPO2 <> 'C'
and RC_TIPO2 <> 'K'
and RC_TIPO2 <> 'V'
and RC_TIPO2 <> 'R'
and RC_TIPO2 <> 'A'


SELECT RA_FILIAL,RA_MAT,RA_NOME,RA_CIC,RA_ADMISSA,RA_DEMISSA,RJ_DESC, RA_CC
FROM SRA010 A, SRJ010 B
WHERE
A.D_E_L_E_T_ = ''
AND B.D_E_L_E_T_ = ''
AND RA_CODFUNC = RJ_FUNCAO
AND RA_SITFOLH = 'D'
AND RA_RESCRAI <> '31'
AND RA_DEMISSA >= '20130601'


SELECT RA_FILIAL,RA_CC,RA_MAT,RTRIM(RA_NOME),RA_CIC,RA_ADMISSA,RG_TIPORES,RA_DEMISSA,RJ_DESC,RG_CHAMADO 
FROM SRA010 A, SRJ010 B, SRG010 C
WHERE
A.D_E_L_E_T_ = ''
AND B.D_E_L_E_T_ = ''
AND C.D_E_L_E_T_ = ''
AND RA_FILIAL = RG_FILIAL
AND RA_MAT = RG_MAT
AND RA_CODFUNC = RJ_FUNCAO
AND RA_SITFOLH = 'D'
AND RA_RESCRAI <> '31'
AND RA_DEMISSA >= '20130401'

select RA_ADMISSA, * from SRA010 WHERE D_E_L_E_T_ = ' '
AND RA_CIC = '16072660835'
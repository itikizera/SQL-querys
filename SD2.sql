--Mauro, precisa incluir o SC6 para validar o tipo de operação, grupo de produto, TES, etc...
-- LOCAÇÃO E VENDA DE MAQUINAS -- 17550
SELECT DISTINCT
'ITALIAN INDUSTRIA' AS EMPRESA,
CASE WHEN D2_FILIAL='01'  THEN 'MATRIZ' 
     WHEN D2_FILIAL='02'  THEN 'ANHAIA' 
       WHEN D2_FILIAL='03'  THEN 'CAMPINAS' 
     ELSE D2_FILIAL+'-OUTRAS'  END AS FILIAL,

D2_TES,
C5_LOCADO, -- TIPO DE PEDIDO
C5_ICBCN, -- CANAL DE NEGOCIO
F4_DUPLIC,
(SELECT A3_NOME FROM SA3010 SA3 WHERE D_E_L_E_T_=' ' AND SA3.A3_COD=SC5.C5_VEND1) AS NVEND1,
C5_VEND2,
(SELECT A3_NOME FROM SA3010 SA3 WHERE D_E_L_E_T_=' ' AND SA3.A3_COD=SC5.C5_VEND2) AS NVEND2,
C5_VEND3,
(SELECT A3_NOME FROM SA3010 SA3 WHERE D_E_L_E_T_=' ' AND SA3.A3_COD=SC5.C5_VEND3) AS NVEND3,
C5_VEND4,
(SELECT A3_NOME FROM SA3010 SA3 WHERE D_E_L_E_T_=' ' AND SA3.A3_COD=SC5.C5_VEND4) AS NVEND4,
C5_VEND4,
(SELECT A3_NOME FROM SA3010 SA3 WHERE D_E_L_E_T_=' ' AND SA3.A3_COD=SC5.C5_VEND5) AS NVEND5,
C5_USUARIO, 
D2_COD,
D2_COD+'-'+B1_DESC AS CHAVE,
B1_PRV1,
B1_DESC,
B1_GRUPO,
(SELECT DISTINCT BM_DESC FROM SBM010 WHERE D_E_L_E_T_=' ' AND B1_GRUPO=BM_GRUPO) AS DESCGRUPO,
B1_XCODFAM,
(SELECT DISTINCT ZA4_DESCRI FROM ZA4010 ZA4 WHERE D_E_L_E_T_=' ' AND ZA4.ZA4_CODIGO=B1_XCODFAM) AS FAMILIA

FROM SD2010 SD2 
LEFT JOIN
SB2010 SB2
ON SB2.D_E_L_E_T_=' '
AND SB2.B2_COD=SD2.D2_COD
--AND B2_LOCAL='01'
LEFT JOIN
SF4010 SF4
ON SF4.D_E_L_E_T_=' '
AND SF4.F4_CODIGO=SD2.D2_TES
LEFT JOIN
SB1010 SB1
ON SB1.D_E_L_E_T_=' '
AND SB1.B1_COD=SD2.D2_COD
INNER JOIN
SC5010 SC5
ON SC5.D_E_L_E_T_=' '
AND SC5.C5_NUM=SD2.D2_PEDIDO
LEFT JOIN
SA1010 SA1
ON SA1.D_E_L_E_T_=' '
AND SA1.A1_COD=SD2.D2_CLIENTE
WHERE SD2.D_E_L_E_T_=' 'AND SB1.D_E_L_E_T_=' 'AND SC5.D_E_L_E_T_=' 'AND SA1.D_E_L_E_T_=' 'AND SF4.D_E_L_E_T_=' 'AND D2_EMISSAO>='20140601'
AND D2_EMISSAO<='20140831'AND D2_COD=B1_COD
AND D2_PEDIDO=C5_NUM
AND D2_FILIAL=C5_FILIAL
AND D2_LOCAL=B2_LOCAL
AND A1_COD=D2_CLIENTE
AND A1_LOJA=D2_LOJA
AND F4_CODIGO=D2_TES
AND B2_FILIAL=D2_FILIAL
AND F4_DUPLIC='S'
--AND C5_LOCADO IN ('VEN','VD1','VD2','LOC','LTL','EMP','DEM','CHT') -- CANAIS
AND C5_LOCADO NOT IN ('VIC','COM') -- remessas de insumos e transferencias intercompany
--AND C5_LOCADO IN ('COM')
AND C5_CONDPAG <> '999'
AND C5_VEND1='1103'

UNION ALL

SELECT distinct
'ITALIAN SERVIÇO' AS EMPRESA,
CASE WHEN D2_FILIAL='01'  THEN 'MATRIZ' 
     WHEN D2_FILIAL='02'  THEN 'CAMPINAS' 
     ELSE D2_FILIAL+'-OUTRAS'  END AS FILIAL,
D2_TES,
C5_LOCADO,
C5_ICBCN, 
F4_DUPLIC,
(SELECT A3_NOME FROM SA3010 SA3 WHERE D_E_L_E_T_=' ' AND SA3.A3_COD=SC5.C5_VEND1) AS NVEND1,
C5_VEND2,
(SELECT A3_NOME FROM SA3010 SA3 WHERE D_E_L_E_T_=' ' AND SA3.A3_COD=SC5.C5_VEND2) AS NVEND2,
C5_VEND3,
(SELECT A3_NOME FROM SA3010 SA3 WHERE D_E_L_E_T_=' ' AND SA3.A3_COD=SC5.C5_VEND3) AS NVEND3,
C5_VEND4,
(SELECT A3_NOME FROM SA3010 SA3 WHERE D_E_L_E_T_=' ' AND SA3.A3_COD=SC5.C5_VEND4) AS NVEND4,
C5_VEND4,
(SELECT A3_NOME FROM SA3010 SA3 WHERE D_E_L_E_T_=' ' AND SA3.A3_COD=SC5.C5_VEND5) AS NVEND5,
C5_USUARIO, 
D2_COD,
D2_COD+'-'+B1_DESC AS CHAVE,
B1_PRV1,
B1_DESC,
B1_GRUPO,
(SELECT DISTINCT BM_DESC FROM SBM010 WHERE D_E_L_E_T_=' ' AND B1_GRUPO=BM_GRUPO) AS DESCGRUPO,
B1_XCODFAM,
(SELECT DISTINCT ZA4_DESCRI FROM ZA4010 ZA4 WHERE D_E_L_E_T_=' ' AND ZA4.ZA4_CODIGO=B1_XCODFAM) AS FAMILIA

FROM SD2020 SD2 

LEFT JOIN
SB2020 SB2
ON SB2.D_E_L_E_T_=' '
AND SB2.B2_COD=SD2.D2_COD

LEFT JOIN
SF4020 SF4
ON SF4.D_E_L_E_T_=' '
AND SF4.F4_CODIGO=SD2.D2_TES


LEFT JOIN
SB1010 SB1
ON SB1.D_E_L_E_T_=' '
AND SB1.B1_COD=SD2.D2_COD

INNER JOIN
SC5020 SC5
ON SC5.D_E_L_E_T_=' '
AND SC5.C5_NUM=SD2.D2_PEDIDO

LEFT JOIN
SA1010 SA1
ON SA1.D_E_L_E_T_=' '
AND SA1.A1_COD=SD2.D2_CLIENTE




WHERE SD2.D_E_L_E_T_=' '
AND SB1.D_E_L_E_T_=' '
AND SC5.D_E_L_E_T_=' '
AND SA1.D_E_L_E_T_=' '
AND SF4.D_E_L_E_T_=' '
AND D2_EMISSAO>='20140601'
AND D2_EMISSAO<='20140831'
AND D2_COD=B1_COD
AND D2_PEDIDO=C5_NUM
AND D2_FILIAL=C5_FILIAL
AND D2_LOCAL=B2_LOCAL
AND A1_COD=D2_CLIENTE
AND A1_LOJA=D2_LOJA
AND F4_CODIGO=D2_TES
AND B2_FILIAL=D2_FILIAL
AND F4_DUPLIC='S'
--AND C5_LOCADO IN ('VEN','VD1','VD2','LOC','LTL','EMP','DEM','CHT')
AND C5_LOCADO NOT IN ('VIC','COM') 
--AND C5_LOCADO IN ('COM')
AND C5_CONDPAG <> '999'
AND C5_VEND1='1103'

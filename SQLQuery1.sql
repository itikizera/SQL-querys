select * from ZZC010 WHERE ZZC_NUMNF='0803204'
SELECT * FROM ZZ5010 WHERE ZZ5_NUMNF='0001378'
SELECT * FROM SF2010 WHERE F2_DOC='0001378'

UPDATE ZZC010 SET ZZC_DATINT='' FROM ZZC010 WHERE ZZC_NUMNF='0001378' AND ZZC_VEND='0101'
select * from ZZD010 WHERE ZZD_NUMNF='0803204'

select * from SC5010 WHERE C5_NUM='018364'

SELECT * FROM SC9010 WHERE C9_PEDIDO='018364' AND D_E_L_E_T_=''
SELECT * FROM SF2010 WHERE F2_DOC='065318'
select * from SD2010 WHERE D2_PEDIDO='018364' 
--AND D_E_L_E_T_=''
order by D2_ITEM

select * from AUDIT_TRAIL WHERE AT_TABLE='SC5010' AND AT_RECID=2149
order by AT_DATE,AT_TIME


SELECT ZZD_FILIAL, ZZD_VEND, ZZD_NFORI, ZZD_SERORI, ZZD_PRODUT,  
SUM (CASE WHEN ZZC_TIPVEN IN ('0','5','7') AND ZZC_TIPONF = 'S' 
THEN ZZD_QTDVEN ELSE 0 END ) AS TOTVEN,  SUM (CASE WHEN ZZC_TIPVEN IN ('3','4','8') AND ZZC_TIPONF = 'S' 
THEN ZZD_QTDVEN ELSE 0 END ) AS TOTFOG,  SUM (CASE WHEN ZZC_TIPVEN = '2' AND ZZC_TIPONF = 'E' 
THEN ZZD_QTDVEN ELSE 0 END ) AS TOTRET  FROM ZZD010 ZZD  
INNER JOIN ZZC010 ZZC ON (ZZC_FILIAL = ZZD_FILIAL AND ZZC_VEND = ZZD_VEND AND ZZC_NUMNF = ZZD_NUMNF AND
ZZC_SERNF = ZZD_SERNF AND ZZC.D_E_L_E_T_ = ' ')  
WHERE  ZZD_FILIAL = '02' AND ZZD_VEND = '0222  ' AND ZZD_NFORI = '0800232  ' AND ZZD_SERORI = '22 ' 
AND ZZD.D_E_L_E_T_ = ' '  GROUP BY ZZD_FILIAL, ZZD_VEND, ZZD_NFORI, ZZD_SERORI, ZZD_PRODUT


select * from SF1010 WHERE F1_FILIAL='02'

SELECT * FROM ZZ6010 WHERE ZZ6_VEND='0224' AND ZZ6_NUMNF='0800232'

select * from ZZD010 where ZZD_NUMNF='0800230'

select 



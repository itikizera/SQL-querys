BEGIN TRANSACTION 
UPDATE SC5010 SET C5_NUM    = '*' + SUBSTRING(C5_NUM,2,5) WHERE SUBSTRING(C5_NUM,1,1) = 'F'
UPDATE SC6010 SET C6_NUM    = '*' + SUBSTRING(C6_NUM,2,5) WHERE SUBSTRING(C6_NUM,1,1) = 'F' 
UPDATE SC9010 SET C9_PEDIDO = '*' + SUBSTRING(C9_PEDIDO,2,5) WHERE SUBSTRING(C9_PEDIDO,1,1) = 'F' 
UPDATE SD2010 SET D2_PEDIDO = '*' + SUBSTRING(D2_PEDIDO,2,5) WHERE SUBSTRING(D2_PEDIDO,1,1) = 'F' 
UPDATE DAI010 SET DAI_PEDIDO = '*' + SUBSTRING(DAI_PEDIDO,2,5) WHERE SUBSTRING(DAI_PEDIDO,1,1) = 'F' 

--COMMIT

SELECT Funcionario.cvCodFil AS RB_FILIAL,  
ROW_NUMBER() OVER(PARTITION BY Dependente.cvCodFun ORDER BY Dependente.CVCODFUN) AS RB_COD,
RIGHT(Funcionario.ccVarFun,7) AS RB_MAT, Dependente.ccNomDep AS RB_NOME, 
CONVERT(VARCHAR, Dependente.cdDatNascDep, 112) AS RB_DTNASC, 
(CASE Dependente.cbSexDep WHEN '0' THEN 'F' ELSE 'M' END) AS RB_SEXO,
(CASE Dependente.cvGrauPrnt WHEN '144' THEN '1' WHEN '145' THEN '1' WHEN '139' THEN '2' ELSE '4' END) AS RB_TIPIR,
(CASE Dependente.cvDepSalFml WHEN '3' THEN '1' WHEN '1' THEN '2' ELSE '2' END) AS RB_TIPSF,
(CASE Dependente.cvGrauPrnt WHEN '144' THEN 'C' WHEN '145' THEN 'C' WHEN '139' THEN 'F' WHEN '154' THEN 'E'  
	WHEN '141' THEN 'P' WHEN '142' THEN 'P' ELSE 'O' END) AS RB_GRAUPAR, ISNULL(Dependente.ccNumCpfDep,'') AS RB_CIC
FROM Dependente
INNER JOIN Funcionario ON Funcionario.cvCodFun = Dependente.cvCodFun
INNER JOIN EQUIPAV.dbo.Filial FIL ON Funcionario.CVCODFIL = FIL.CVCODFIL
WHERE Funcionario.cdDatRes IS NULL


RB_COD, RB_NOME, RB_DTNASC, RB_SEXO, RB_TIPIR, RB_GRAUPAR, RB_TIPSL, RB_CIC

SELECT DISTINCT(cvCodFun) FROM Dependente
SELECT COUNT(DISTINCT(cvCodFun)) FROM Dependente

SELECT cvCodFun,  COUNT(cvCodFun) FROM Dependente
GROUP BY cvCodFun

SELECT ROW_NUMBER() OVER(PARTITION BY cvCodFun ORDER BY CVCODFUN) AS LINHA, cvCodFun, cvCodDep  
FROM Dependente

-- begin tran
-- commit
select * 
from S008_FORNECEDOR S8
INNER JOIN C002_FORNECEDOR_0001  C2
	ON C2.S008_ID = S8.S008_ID
	AND C2.C002_DELETE = 0
where s008_erpcod = ''

-------------------------------------------------------	
/*
	INICIO QUERYS T001_COTACAO E T004_COTXFOR
*/	
-------------------------------------------------------

-- Filtro por data
select * 
from T001_COTACAO_0001
where T001_DTEMISSAO > '2015-02-05 18:19:10.000'


-- Filtro por codigo de cotação
select *
from T001_COTACAO_0001
where T001_CODIGO = '000234'

-- Filtro por ID fornecedor
select *
from T004_COTXFOR_0001
where C002_ID = 138

-- Quantidade de cotações com mesmo número
SELECT T001_CODIGO, COUNT (*)
FROM T001_COTACAO_0001
GROUP BY T001_CODIGO
HAVING COUNT (*) > 1

-- Filtro por T004_ID
select *
from T004_COTXFOR_0001
where T004_ID = 1755

-------------------------------------------------------
/*
	FIM QUERYS T001_COTACAO
*/	
-------------------------------------------------------



-------------------------------------------------------	
/*
	INICIO QUERYS T005_FILAINTEGRACAO
*/	
-------------------------------------------------------

-- Filtro por Data
select *
from T005_FILAINTEGRACAO_0001
where T005_DTREG > '2015-02-05 18:19:50.420'



-------------------------------------------------------	
/*
	FIM QUERYS S008_FORNECEDOR e C002_FORNECEDOR
*/	
-------------------------------------------------------

-- Quantidade de Fornecedores com mesmo CNPJ na S008_FORNECEDOR
SELECT S008_CNPJ, COUNT(*)
FROM S008_FORNECEDOR
GROUP BY S008_CNPJ
HAVING COUNT(*) > 1

-- Quantidade de Fornecedores com mesmo CNPJ na C002_FORNECEDOR
SELECT C002_CPFCNPJ, COUNT(*)
FROM C002_FORNECEDOR_0001
GROUP BY C002_CPFCNPJ
HAVING COUNT(*) > 1

-- Filtro por CNPJ na S008_FORNECEDOR
select * 
from S008_FORNECEDOR
where S008_CNPJ = '34151100000130'

-- Filtro por CNPJ na C002_FORNECEDOR
select * 
from C002_FORNECEDOR_0001
where C002_CPFCNPJ = '34151100000130'

-- Filtro por ID na S008_FORNECEDOR
select * 
from S008_FORNECEDOR
where S008_ID = 132

-- Filtro por ID na C002_FORNECEDOR
select * 
-- DELETE 
from C002_FORNECEDOR_0001
where C002_ID = 138
-------------------------------------------------------	
/*
	FIM QUERYS S008_FORNECEDOR e C002_FORNECEDOR
*/	
-------------------------------------------------------


-------------------------------------------------------	
/*
	INICIO QUERYS S005_USUARIOPERFIL e S002_USUARIO
*/	
-------------------------------------------------------

-- Filtro por Email usuário
select * 
from S002_USUARIO
where S002_LOGIN = 'carlos.jacob@sotreq.com.br'

-- Filtro por ID de usuário
select * 
from S005_USUARIOPERFIL
where S002_ID = 188

-- Filtro por ID de fornecedor
select * 
from S005_USUARIOPERFIL
where S008_ID = 132
-------------------------------------------------------	
/*
	FIM QUERYS S005_USUARIOPERFIL e S002_USUARIO
*/	
-------------------------------------------------------


select T001_ID, COUNT(*) AS Qtde_repet, SUM(T003_VLRTOT), COUNT(T003_OBS)
from T003_ITEMCOTXFOR_0001
Group by T001_ID
having COUNT(*)>1
order by COUNT(*) DESC




select * 
from S002_USUARIO
where S002_LOGIN = 'brunomoreira@morelate.com.br'

select * 
from S005_USUARIOPERFIL
where S002_ID = 84

select *
from S008_FORNECEDOR
where S008_ID = 92 or S008_ID = 154 or S008_ID = 625











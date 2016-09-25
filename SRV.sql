-- Acumulados de um unico funcionário
SELECT FUN.cvCodFil, RIGHT(FUN.ccVarFun,7), FUN.ccNomFun, FicFin.cvCodEve, Evento.ccNomEve, FicFin.cvVlrBasFicFin, FicFin.cvVlrFimFicFin, Escolha.ccNomEscl,
(('0'+CONVERT(VARCHAR,FicFin.cvMesFicFin))+(CONVERT(VARCHAR,FicFin.cvAnoFicFin))) FROM FicFin
INNER JOIN Funcionario FUN ON FUN.cvCodFun = FicFin.cvCodFun AND FUN.cdDatRes IS NULL
INNER JOIN Evento ON Evento.cvCodEve = FicFin.cvCodEve
INNER JOIN Escolha ON Escolha.cvCodEscl = Evento.cvTipEve
WHERE FicFin.cvAnoFicFin  >= '2012' --AND FUN.ccNomFun = 'ALEXANDRE CORREA CRUZ'
ORDER BY FicFin.cvCodFicFin, Evento.cvTipEve desc


SELECT cvTipEve, * FROM Evento
INNER JOIN FicFin ON FicFin.cvCodEve = Evento.cvCodEve AND FicFin.cvAnoFicFin >= 2013

SELECT * FROM AgrpCtb
--Relação de Verbas
SELECT Evento.cvCodEve, Evento.ccNomEve, Evento.ccAbrEve, Escolha.ccNomEscl FROM Evento
INNER JOIN Escolha ON Escolha.cvCodEscl = Evento.cvTipEve
WHERE cvCodEve IN (SELECT DISTINCT(cvCodEve) FROM FicFin WHERE cvAnoFicFin >= 2012)
AND Evento.cvCodEve NOT IN (SELECT cvCodEve FROM Evento WHERE ccNomEve LIKE '%RECIBO%')
ORDER BY ccNomEscl DESC,ccNomEve

SELECT * FROM FicFin
INNER JOIN Funcionario FUN ON FUN.cvCodFun = FicFin.cvCodFun AND FUN.cdDatRes IS NULL
INNER JOIN Evento ON Evento.cvCodEve = FicFin.cvCodEve
INNER JOIN Escolha ON Escolha.cvCodEscl = Evento.cvTipEve
WHERE FicFin.cvAnoFicFin  >= '2012' AND FUN.ccNomFun = 'ALEXANDRE CORREA CRUZ'

SELECT cvCodEve FROM Evento
WHERE ccNomEve LIKE '%RECIBO%'
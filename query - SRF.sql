SELECT COUNT(*)CONT, CPD_CdiContratado AS RA_CRACHA,convert(varchar(10), MIN(CPD_DtdPeriodoInicio), 112) as RF_DATABAS,
MAX(CPD_QtnDiasSaldo)AS RF_DFERVAT,MIN(CPD_QtnDiasSaldo)AS RF_DFERAAT
FROM ConPeriodosDescansos A
WHERE --CPD_CdiContratado BETWEEN '100013930' AND '100013968'
CPD_QtnDiasGozFerAboLic =0
AND CPD_CdiTipoDescanso ='1'
AND CPD_CdiStatusPeriodo ='1' AND CPD_QtiDiasPerAfastado =0
 AND CPD_QtnDiasSaldo > 0 AND CPD_DtdPeriodoFim IS NOT NULL  AND CPD_DtdLimite IS NOT NULL
GROUP BY CPD_CdiContratado
HAVING COUNT(*) > 1
UNION ALL
SELECT COUNT(*)CONT, CPD_CdiContratado AS RA_CRACHA,convert(varchar(10), MAX(CPD_DtdPeriodoInicio), 112)as RF_DATABAS,
RF_DFERVAT='',MIN(CPD_QtnDiasSaldo)AS RF_DFERAAT
FROM ConPeriodosDescansos A
WHERE --CPD_CdiContratado BETWEEN '100013930' AND '100013968'
CPD_QtnDiasGozFerAboLic =0
AND CPD_CdiTipoDescanso ='1'
AND CPD_CdiStatusPeriodo ='1' AND CPD_QtiDiasPerAfastado =0
 AND CPD_QtnDiasSaldo > 0 AND CPD_DtdPeriodoFim IS NOT NULL  AND CPD_DtdLimite IS NOT NULL
GROUP BY CPD_CdiContratado
HAVING COUNT(*) <= 1
ORDER BY 3

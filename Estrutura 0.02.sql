--CONFORME CALCULO PROTHEUS
SELECT OLD.RT_FILIAL, OLD.RT_MAT, OLD.RT_CC, OLD.RT_DATACAL, OLD.RT_TIPPROV,
	OLD.RT_VERBA, NEW.RT_VALOR, OLD.RT_DATABAS, OLD.RT_DFERVEN, OLD.RT_DFERPRO, OLD.RT_SALARIO FROM SRT990 OLD
LEFT JOIN SRTBASE NEW 
	ON NEW.RT_FILIAL = OLD.RT_FILIAL
AND	   NEW.RT_MAT	 = OLD.RT_MAT
AND	   NEW.RT_VERBA	 = OLD.RT_VERBA
AND NEW.RT_TIPPROV = OLD.RT_TIPPROV
--AND NEW.RT_MAT IN (SELECT TST.RT_MAT FROM SRT990 TST)
ORDER BY 2,1,5,6
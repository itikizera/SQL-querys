	SELECT * FROM PCC_SE5 
	UNION ALL
	SELECT DISTINCT																																																																											
  E5_FILIAL, 																																																																													
  E1_EMISSAO,  																																																																													
 	E5_PREFIXO,  																																																																												
 	E5_NUMERO,  																																																																												
 	E5_CLIENTE,  																																																																												
 	E5_LOJA,  																																																																													
 	A1_NOME, 																																																																													
 	A1_CGC, 																																																																													
 	F2_VALBRUT, 																																																																												
 	E5_VALOR, 																																																																													
 TIT_PIS_VAL = CASE WHEN (SELECT E1_VALOR FROM SE1010 IE1 WITH(NOLOCK) WHERE IE1.D_E_L_E_T_='' AND IE1.E1_FILIAL = E1.E1_FILIAL AND  IE1.E1_TIPO IN ('PI-','PIS') AND IE1.E1_PREFIXO = E1.E1_PREFIXO AND IE1.E1_NUM = E1.E1_NUM AND IE1.E1_CLIENTE = E1.E1_CLIENTE AND IE1.E1_PARCELA = E1.E1_PARCELA) IS NULL	
 	THEN (SELECT MAX(E5_VRETPIS) FROM SE5010 IE5 WITH(NOLOCK) WHERE IE5.D_E_L_E_T_='' AND IE5.E5_FILIAL = E1.E1_FILIAL AND  IE5.E5_PREFIXO = E1.E1_PREFIXO AND IE5.E5_NUMERO = E1.E1_NUM AND IE5.E5_CLIENTE = E1.E1_CLIENTE AND IE5.E5_PARCELA = E1.E1_PARCELA AND E5.E5_DTDISPO=IE5.E5_DTDISPO    				
 		AND (E5_MOTBX NOT IN ('PIS','CSL','COF','PI-','CS-','CF-','ISS') AND E5_VRETPIS<>0) AND(E5_TIPODOC NOT IN ('DC','ES','BA','JR') OR (E5_TIPODOC='BA' AND E5_PARCELA<>'')) AND E5_RECPAG='R' AND IE5.E5_SEQ=E5.E5_SEQ GROUP BY E5_VRETPIS, E5_SEQ)																		
 	ELSE (SELECT E1_VALOR FROM  SE1010 IE1 WITH(NOLOCK) WHERE IE1.D_E_L_E_T_='' AND IE1.E1_FILIAL = E1.E1_FILIAL AND  IE1.E1_TIPO IN ('PI-','PIS') AND IE1.E1_PREFIXO = E1.E1_PREFIXO AND IE1.E1_NUM = E1.E1_NUM AND IE1.E1_CLIENTE = E1.E1_CLIENTE AND IE1.E1_PARCELA = E1.E1_PARCELA)							
 	END, 																																																																														
 TIT_COF_VAL = CASE WHEN (SELECT E1_VALOR FROM SE1010 IE1 WITH(NOLOCK) WHERE IE1.D_E_L_E_T_='' AND IE1.E1_FILIAL = E1.E1_FILIAL AND  IE1.E1_TIPO IN ('CF-','COF') AND IE1.E1_PREFIXO = E1.E1_PREFIXO AND IE1.E1_NUM = E1.E1_NUM AND IE1.E1_CLIENTE = E1.E1_CLIENTE AND IE1.E1_PARCELA = E1.E1_PARCELA) IS NULL	
 	THEN (SELECT MAX(E5_VRETCOF) FROM SE5010 IE5 WITH(NOLOCK) WHERE IE5.D_E_L_E_T_='' AND IE5.E5_FILIAL = E1.E1_FILIAL AND  IE5.E5_PREFIXO = E1.E1_PREFIXO AND IE5.E5_NUMERO = E1.E1_NUM AND IE5.E5_CLIENTE = E1.E1_CLIENTE AND IE5.E5_PARCELA = E1.E1_PARCELA AND E5.E5_DTDISPO=IE5.E5_DTDISPO 				
 		AND (E5_MOTBX NOT IN ('PIS','CSL','COF','PI-','CS-','CF-','ISS') AND E5_VRETCOF<>0) AND(E5_TIPODOC NOT IN ('DC','ES','BA','JR') OR (E5_TIPODOC='BA' AND E5_PARCELA<>'')) AND E5_RECPAG='R' AND IE5.E5_SEQ=E5.E5_SEQ GROUP BY E5_VRETCOF, E5_SEQ)																		
 	ELSE (SELECT E1_VALOR FROM  SE1010 IE1 WITH(NOLOCK) WHERE IE1.D_E_L_E_T_='' AND IE1.E1_FILIAL = E1.E1_FILIAL AND  IE1.E1_TIPO IN ('CF-','COF') AND IE1.E1_PREFIXO = E1.E1_PREFIXO AND IE1.E1_NUM = E1.E1_NUM AND IE1.E1_CLIENTE = E1.E1_CLIENTE AND IE1.E1_PARCELA = E1.E1_PARCELA)							
 	END, 																																																																														
 TIT_CSLL_VAL = CASE WHEN (SELECT E1_VALOR FROM SE1010 IE1 WITH(NOLOCK) WHERE IE1.D_E_L_E_T_='' AND IE1.E1_FILIAL = E1.E1_FILIAL AND  IE1.E1_TIPO IN ('CS-','CSL') AND IE1.E1_PREFIXO = E1.E1_PREFIXO AND IE1.E1_NUM = E1.E1_NUM AND IE1.E1_CLIENTE = E1.E1_CLIENTE AND IE1.E1_PARCELA = E1.E1_PARCELA) IS NULL	
 	THEN (SELECT MAX(E5_VRETCSL) FROM  SE5010 IE5 WHERE IE5.D_E_L_E_T_='' AND IE5.E5_FILIAL = E1.E1_FILIAL AND  IE5.E5_PREFIXO = E1.E1_PREFIXO AND IE5.E5_NUMERO = E1.E1_NUM AND IE5.E5_CLIENTE = E1.E1_CLIENTE AND IE5.E5_PARCELA = E1.E1_PARCELA AND E5.E5_DTDISPO=IE5.E5_DTDISPO 							
 		AND (E5_MOTBX NOT IN ('PIS','CSL','COF','PI-','CS-','CF-','ISS') AND E5_VRETCSL<>0) AND (E5_TIPODOC NOT IN ('DC','ES','BA','JR') OR (E5_TIPODOC='BA' AND E5_PARCELA<>''))  AND E5_RECPAG='R' AND IE5.E5_SEQ=E5.E5_SEQ GROUP BY E5_VRETCSL, E5_SEQ)																		
 	ELSE (SELECT E1_VALOR FROM  SE1010 IE1 WITH(NOLOCK) WHERE IE1.D_E_L_E_T_='' AND IE1.E1_FILIAL = E1.E1_FILIAL AND  IE1.E1_TIPO IN ('CS-','CSL') AND IE1.E1_PREFIXO = E1.E1_PREFIXO AND IE1.E1_NUM = E1.E1_NUM AND IE1.E1_CLIENTE = E1.E1_CLIENTE AND IE1.E1_PARCELA = E1.E1_PARCELA)							
 	END,  																																																																														
 E1.E1_BAIXA, E5_NATUREZ, ORIG = 'SE1', E1.E1_PARCELA																																																																			
   FROM SE5010 E5 WITH(NOLOCK) 																																																																					
 	LEFT JOIN SE1010 E1 WITH(NOLOCK)  																																																																			
 		ON E1.D_E_L_E_T_='' 																																																																									
 		AND E1.E1_FILIAL = E5_FILIAL																																																																							
 		AND E1.E1_NUM = E5_NUMERO																																																																								
 		AND E1.E1_PREFIXO = E5_PREFIXO  																																																																						
 		AND E1.E1_CLIENTE = E5_CLIENTE 																																																																							
 		AND E1.E1_LOJA = E5_LOJA 																																																																								
 		AND E1_TIPO = 'NF'  																																																																									
 		AND E1_PARCELA=E5_PARCELA																																																																								
 	INNER JOIN SA1010 A1 WITH(NOLOCK)  																																																																		
 		ON A1.D_E_L_E_T_='' 																																																																									
 		AND E1_CLIENTE = A1_COD 																																																																								
 		AND E1_LOJA = A1_LOJA  																																																																									
 	INNER JOIN SF2010 F2 WITH(NOLOCK)  																																																																		
 		ON F2.D_E_L_E_T_='' 																																																																									
 		AND E1_FILIAL = F2_FILIAL  																																																																								
 		AND E1_PREFIXO = F2_PREFIXO  																																																																							
 		AND E1_NUM = F2_DOC  																																																																									
 		AND E1_CLIENTE = F2_CLIENTE 																																																																							
 		AND E1_LOJA = F2_LOJA  		 																																																																							
 WHERE E5.D_E_L_E_T_=''   																																																																									
 AND E1_TIPO = 'NF'  			
	AND E1_FILIAL BETWEEN  '001NE001 ' AND '001NE001 ' 
	AND E1_CLIENTE BETWEEN  '' AND 'ZZZZZZ' 
	AND E1_LOJA BETWEEN  '' AND 'ZZ' 
	AND E1_BAIXA BETWEEN  '20140901' AND '20140930' 
 AND (E5_TIPODOC NOT IN ('DC','ES','BA','JR','MT') OR (E5_TIPODOC='BA' AND E5_PARCELA<>'') OR ((E5_TIPODOC='BA' AND E1_TIPO='NF' AND E1_STATUS='B' AND E1_RELATO='' AND E5_MOTBX='DAC')))  																																		
 AND (((((((((SELECT IE1.E1_VALOR FROM SE1010 IE1 WITH(NOLOCK) WHERE IE1.D_E_L_E_T_='' AND IE1.E1_FILIAL = E1.E1_FILIAL AND  IE1.E1_PREFIXO = E1.E1_PREFIXO 																																						
 		AND IE1.E1_NUM = E1.E1_NUM AND IE1.E1_CLIENTE = E1.E1_CLIENTE AND IE1.E1_LOJA = E1.E1_LOJA AND IE1.E1_TIPO IN ('PI-','PIS') AND IE1.E1_PARCELA = E1.E1_PARCELA AND IE1.E1_VALOR >= 0) IS NOT NULL ))																													
 	OR (SELECT E5_VRETPIS FROM  SE5010 IE5 WHERE																																																																
 IE5.R_E_C_N_O_ = (SELECT MAX(R_E_C_N_O_) FROM  SE5010 IE5 WITH(NOLOCK) 																																																											
 	WHERE IE5.D_E_L_E_T_='' AND IE5.E5_FILIAL = E1.E1_FILIAL AND  IE5.E5_PREFIXO = E1.E1_PREFIXO 																																																								
 AND IE5.E5_NUMERO = E1.E1_NUM  AND IE5.E5_CLIENTE = E1.E1_CLIENTE AND IE5.E5_PARCELA = E1.E1_PARCELA AND E1.E1_BAIXA=IE5.E5_DTDISPO AND (IE5.E5_VRETPIS >=0 OR IE5.E5_VRETCOF >=0 OR IE5.E5_VRETCSL >=0)																														
 AND (E5_MOTBX NOT IN ('PIS','CSL','COF','PI-','CS-','CF-','ISS') AND E5_VRETPIS<>0) AND E5_RECPAG='R' AND E5_TIPODOC NOT IN ('DC','ES','BA'))) IS NOT NULL))																																									
 	OR (SELECT IE1.E1_VALOR FROM SE1010 IE1 WITH(NOLOCK) WHERE IE1.D_E_L_E_T_='' AND IE1.E1_FILIAL = E1.E1_FILIAL AND  IE1.E1_PREFIXO = E1.E1_PREFIXO 																																							
 		AND IE1.E1_NUM = E1.E1_NUM AND IE1.E1_CLIENTE= E1.E1_CLIENTE AND IE1.E1_LOJA = E1.E1_LOJA AND IE1.E1_TIPO IN ('CS-','CSL') AND IE1.E1_PARCELA = E1.E1_PARCELA AND IE1.E1_VALOR >= 0) IS NOT NULL 																														
 	OR (SELECT E5_VRETCOF FROM  SE5010 IE5 WHERE																																																																
 IE5.R_E_C_N_O_ = (SELECT MAX(R_E_C_N_O_) FROM  SE5010 IE5 WITH(NOLOCK) 																																																											
 	WHERE IE5.D_E_L_E_T_='' AND IE5.E5_FILIAL = E1.E1_FILIAL AND  IE5.E5_PREFIXO = E1.E1_PREFIXO 																																																								
 AND IE5.E5_NUMERO = E1.E1_NUM  AND IE5.E5_CLIENTE = E1.E1_CLIENTE AND IE5.E5_PARCELA = E1.E1_PARCELA AND E1.E1_BAIXA=IE5.E5_DTDISPO AND (IE5.E5_VRETPIS >=0 OR IE5.E5_VRETCOF >=0 OR IE5.E5_VRETCSL >=0)																														
 AND (E5_MOTBX NOT IN ('PIS','CSL','COF','PI-','CS-','CF-','ISS') AND E5_VRETPIS<>0) AND E5_RECPAG='R' AND E5_TIPODOC NOT IN ('DC','ES','BA'))) IS NOT NULL))																																									
 	OR (SELECT IE1.E1_VALOR FROM SE1010 IE1 WITH(NOLOCK) WHERE IE1.D_E_L_E_T_='' AND IE1.E1_FILIAL = E1.E1_FILIAL AND  IE1.E1_PREFIXO = E1.E1_PREFIXO 																																							
 		AND IE1.E1_NUM = E1.E1_NUM AND IE1.E1_CLIENTE = E1.E1_CLIENTE AND IE1.E1_LOJA = E1.E1_LOJA AND IE1.E1_TIPO IN ('CF-','COF') AND IE1.E1_PARCELA = E1.E1_PARCELA AND IE1.E1_VALOR >= 0) IS NOT NULL																														
 	OR (SELECT E5_VRETCSL FROM  SE5010 IE5 WHERE																																																																
 IE5.R_E_C_N_O_ = (SELECT MAX(R_E_C_N_O_) FROM  SE5010 IE5 WITH(NOLOCK) 																																																											
 	WHERE IE5.D_E_L_E_T_='' AND IE5.E5_FILIAL = E1.E1_FILIAL AND  IE5.E5_PREFIXO = E1.E1_PREFIXO 																																																								
 AND IE5.E5_NUMERO = E1.E1_NUM  AND IE5.E5_CLIENTE = E1.E1_CLIENTE AND IE5.E5_PARCELA = E1.E1_PARCELA AND E1.E1_BAIXA=IE5.E5_DTDISPO AND (IE5.E5_VRETPIS >=0 OR IE5.E5_VRETCOF >=0 OR IE5.E5_VRETCSL >=0)																														
 AND (E5_MOTBX NOT IN ('PIS','CSL','COF','PI-','CS-','CF-','ISS') AND E5_VRETPIS<>0) AND E5_RECPAG='R' AND E5_TIPODOC NOT IN ('DC','ES','BA'))) IS NOT NULL))																																									
 ORDER BY 1,2,3,4  
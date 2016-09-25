SELECT     CONVERT(char(20), c.CodCliente) AS ExtRefCustomer, CONVERT(varchar(20), o.CodCancelamento) AS ExtRefQuoteCancellation, CONVERT(varchar(20), 
                      o.CodConcorrente) AS ExtRefQuoteCompetitor, CONVERT(varchar(20), o.Situacao) AS ExtRefQuoteSituation, CONVERT(varchar(20), tp.Codigo) 
                      AS ExtRefQuoteProductType, CONVERT(varchar(20), ve.CodVendedor) AS ExtRefSalesMan, o.NumOrdem AS ExtRefWo, o.IdMoeda AS ExtRefIdCurrency, 
                      CAST(o.NumOrcamento AS varchar(50)) AS ExtRef, o.Titulo AS description, o.Contato AS Contact, o.CondPagto AS Payment, o.DtInclusao AS InsDt, 
                      o.DtLibProducao AS LibDt, o.CodUsuarioInc AS InsUser, o.SPreco AS Preco, 
                      o.SPreco - o.SCustosMat - o.SCustosTerc - o.SCustosImpostos - o.SCustosComissoes - o.SCustosVenOutros - o.SCustosFin AS ContribuicaoMarginal, 
                      (CASE WHEN o.Situacao = 600 OR
                      o.Situacao = 950 THEN o.SPreco ELSE 0 END) AS ValorAprovado, (CASE WHEN o.Situacao = 600 OR
                      o.Situacao = 950 THEN (o.SPreco - o.SCustosMat - o.SCustosTerc - o.SCustosImpostos - o.SCustosComissoes - o.SCustosVenOutros - o.SCustosFin) ELSE 0 END) 
                      AS ContribuicaoMarginalAprovada, o.QtdOpcoes AS OptionsQty, o.SCustosMat AS MaterialCust, o.SCustosMO AS SCustoMo, o.SCustosTerc AS ThirdPartyCust, 
                      o.SCustosImpostos AS TaxCust, o.SCustosComissoes AS CommissionCusts, o.SCustosFin, o.SCustosVenOutros, o.SQuantidade AS Qty, 
                      c.RazaoSocial AS cus_RazaoSocial, c.Nome AS cus_Nome, c.CGC AS cus_Cgc, c.DtInclusao AS cus_DtInclusao, c.LimiteCredito AS cus_LimiteCredito, 
                      c.LimiteDias AS cus_LimiteDias, CASE WHEN c.ClienteBloqueado = 'S' THEN '1' ELSE '0' END AS cus_ClienteBloqueado, c.DtUltimaCompra AS cus_LastPurchase, 
                      c.DtUltimoOrcamento AS cus_LastQuote, c.Corporacao AS cus_Corporation, cl.Descricao AS can_Description, cc.Nome AS com_Name, st.Descricao AS sit_Description, 
                      tp.Descricao AS typ_Description, tp.UnidadeVenda AS typ_SalesUnit, tp.ObjidGrupoComissao AS typ_IDCommissionGroup, 
                      tp_gp.Codigo AS typ_CommissionGroupCode, tp_gp.Descricao AS typ_CommissionGroupDescription, 
                      CASE WHEN tp_gp.Ativo = 'S' THEN '1' ELSE '0' END AS typ_CommissionGroupIsActv, ve.Nome AS sal_Name, 
                      CASE WHEN ve.Inativo = 'N' THEN '1' ELSE '0' END AS sal_IsActv, mo.NomeMoeda AS cur_Name, wo.Descricao AS wo_Description, 
                      wo.DtMinimaInicio AS wo_MinStartDt, wo.DtEntrega AS wo_DeliveryDt, wo.Prioridade AS wo_Priority, wo.DtInclusao AS wo_InsDt, 
                      wo.DtEmissao AS wo_EmissionDt
FROM         dbo.orcHdr AS o LEFT OUTER JOIN
                      dbo.Crm_Clientes AS c ON c.CodCliente = o.CodCliente LEFT OUTER JOIN
                      dbo.OrcCodigosCancelamento AS cl ON cl.Codigo = o.CodCancelamento LEFT OUTER JOIN
                      dbo.OrcConcorrentes AS cc ON cc.Codigo = o.CodConcorrente LEFT OUTER JOIN
                      dbo.OrcCodSitOrcamento AS st ON st.Codigo = o.Situacao LEFT OUTER JOIN
                      dbo.ORCTiposDeProduto AS tp ON tp.Codigo = o.CodTipoProduto LEFT OUTER JOIN
                      dbo.GrupoComissao AS tp_gp ON tp_gp.ObjId = tp.ObjidGrupoComissao LEFT OUTER JOIN
                      dbo.Vendedores AS ve ON ve.CodVendedor = o.CodVendedor LEFT OUTER JOIN
                      dbo.FIN_Moedas AS mo ON mo.IdMoeda = o.IdMoeda LEFT OUTER JOIN
                      dbo.OrdensProducao AS wo ON wo.NumOrdem = o.NumOrdem

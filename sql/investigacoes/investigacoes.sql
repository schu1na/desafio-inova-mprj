-- ============================================
-- Consultas de investigação de dados
-- Objetivo: investigar a qualidade e integridade dos dados
-- Observações: essas consultas foram feitas no DBeaver
-- ============================================

-- Identificação de empenhos que foram pagos porém não foram liquidados
SELECT e.id_empenho, e.valor, e.data_empenho, e.id_contrato
FROM empenho e
JOIN pagamento p ON p.id_empenho = e.id_empenho
LEFT JOIN liquidacao_nota_fiscal l ON l.id_empenho = e.id_empenho
WHERE l.id_empenho IS NULL;

-- Identificação de pagamentos com valores maiores que o empenho 
SELECT p.id_empenho, p.valor as valor_pagamento, e.valor as valor_empenho, e.id_contrato
FROM pagamento p
JOIN empenho e ON p.id_empenho = e.id_empenho 
WHERE p.valor > e.valor;

-- Identificação de contratos com pagamentos totais maiores que o valor do contrato
SELECT 
	c.id_contrato, 
	c.objeto,
	c.valor as valor_contrato, 
	sum(p.valor) as valor_pago,
	sum(p.valor) - c.valor as diferenca
FROM contrato c
JOIN empenho e ON c.id_contrato = e.id_contrato
JOIN pagamento p ON p.id_empenho = e.id_empenho 
GROUP BY c.id_contrato
HAVING sum(p.valor) > c.valor;

-- Identificação de empenhos com data de pagamento anterior à data do empenho
SELECT 
	e.id_empenho,
	e.id_contrato, 
	e.data_empenho as data_empenho,
	p.datapagamentoempenho  as data_pagamento
FROM  empenho e
JOIN pagamento p ON e.id_empenho  = p.id_empenho 
WHERE e.data_empenho > p.datapagamentoempenho;

-- Identificação de notas fiscais com valor diferente do valor liquidado
SELECT 
	l.chave_danfe,
	l.valor as valor_liquidado,
	n.valor_total as valor_nota_fiscal,
	l.valor - n.valor_total as diferenca
FROM liquidacao_nota_fiscal l
JOIN nfe n ON l.chave_danfe = n.chave_nfe
WHERE l.valor <> n.valor_total;
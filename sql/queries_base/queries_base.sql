-- Contagem de registros em tabelas principais
SELECT 'contrato' AS tabela, COUNT(*) AS total FROM contrato
UNION ALL
SELECT 'empenho', COUNT(*) FROM empenho
UNION ALL
SELECT 'liquidacao_nota_fiscal', COUNT(*) FROM liquidacao_nota_fiscal
UNION ALL
SELECT 'pagamento', COUNT(*) FROM pagamento;

-- Identificação de contratos sem nenhum empenho associado
SELECT 
    c.objeto,
    c."data",
    c.valor 
FROM contrato c
LEFT JOIN empenho e ON c.id_contrato = e.id_contrato
WHERE e.id_contrato IS NULL;

-- Identificação de empenhos sem nenhum contrato associado
SELECT 
    e.id_empenho,
    e.valor,
    e.data_empenho
FROM empenho e
LEFT JOIN contrato c ON c.id_contrato = e.id_contrato
WHERE c.id_contrato IS NULL;


-- Empenhos com pagamentos totais maiores que o valor empenhado e fornecedor
SELECT
    e.valor AS valor_empenhado,
    p.valor AS total_pago,
    c.objeto as objeto_contrato,
    f.nome as nome_fornecedor
FROM empenho e
JOIN pagamento p ON p.id_empenho = e.id_empenho
JOIN contrato c ON e.id_contrato = c.id_contrato
JOIN fornecedor f ON c.id_fornecedor = f.id_fornecedor
WHERE p.valor > e.valor;


-- Identificação de empenhos com data de pagamento anterior à data do empenho
SELECT 
	e.id_empenho, 
	e.data_empenho as data_empenho,
	p.datapagamentoempenho  as data_pagamento,
	p.valor as valor_pago,
	c.objeto as objeto_contrato
FROM empenho e
JOIN pagamento p ON e.id_empenho  = p.id_empenho 
JOIN contrato c ON e.id_contrato = c.id_contrato
WHERE e.data_empenho > p.datapagamentoempenho;

-- Soma dos pagamentos com data de pagamento anterior à data do empenho por objeto de contrato
SELECT 
	SUM(p.valor) as valor_pago,
	c.objeto as objeto_contrato
    e.data_empenho - p.datapagamentoempenho as diferenca_datas
FROM empenho e
JOIN pagamento p ON e.id_empenho  = p.id_empenho 
JOIN contrato c ON e.id_contrato = c.id_contrato
WHERE e.data_empenho > p.datapagamentoempenho
GROUP BY c.objeto as objeto_contrato;

-- Identificação de pagamentos sem nota fiscal associada
SELECT 
    SUM(p.valor) as valor_total_pago,
    c.objeto as objeto_contrato,
    COUNT(*) as numero_ocorrencias
FROM empenho e
JOIN pagamento p ON p.id_empenho = e.id_empenho
JOIN contrato c ON e.id_contrato = c.id_contrato
LEFT JOIN liquidacao_nota_fiscal l ON l.id_empenho = e.id_empenho
WHERE l.id_empenho IS NULL
  AND p.valor > 0
GROUP BY c.objeto
ORDER BY valor_total_pago DESC;

-- Identificação de empenhos sem liquidação
SELECT 
    e.id_empenho,
    e.valor as valor_empenho
FROM empenho e
LEFT JOIN liquidacao_nota_fiscal l ON l.id_empenho = e.id_empenho
WHERE l.id_empenho IS NULL
ORDER BY e.valor DESC;


-- Identificação de liquidações sem empenho
SELECT 
    l.id_liquidacao_empenhonotafiscal,
    l.valor as valor_liquidacao,
    e.valor as valor_empenho
FROM liquidacao_nota_fiscal l
LEFT JOIN empenho e ON l.id_empenho = e.id_empenho
WHERE e.id_empenho IS NULL;
    
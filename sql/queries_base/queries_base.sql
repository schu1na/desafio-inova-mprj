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
    c.id_contrato,
    c.objeto,
    c."data",
    c.valor 
FROM contrato c
LEFT JOIN empenho e ON c.id_contrato = e.id_contrato
WHERE e.id_contrato IS NULL;

-- Soma dos valores empenhados por contrato
SELECT 
    c.id_contrato,
    c.valor AS valor_contratado,
    SUM(e.valor) AS valor_empenhado
FROM contrato c
JOIN empenho e ON e.id_contrato = c.id_contrato
GROUP BY c.id_contrato, c.valor;

-- Empenhos com pagamentos totais maiores que o valor empenhado
SELECT
    e.id_empenho,
    e.valor AS valor_empenhado,
    p.valor AS total_pago
FROM empenho e
JOIN pagamento p ON p.id_empenho = e.id_empenho
WHERE p.valor > e.valor
GROUP BY e.id_empenho, e.valor


-- Contratos com pagamentos totais maiores que o valor do contrato
SELECT 
    c.id_contrato,
    c.valor AS valor_contrato,
    SUM(p.valor) AS total_pago,
    SUM(p.valor) - c.valor AS diferenca
FROM contrato c
JOIN empenho e ON e.id_contrato = c.id_contrato
JOIN pagamento p ON p.id_empenho = e.id_empenho
GROUP BY c.id_contrato, c.valor
HAVING SUM(p.valor) > c.valor;


-- Fornecedores com maior volume de pagamentos recebidos
SELECT
    f.nome,
    SUM(p.valor) AS total_pago
FROM fornecedor f
JOIN contrato c ON c.id_fornecedor = f.id_fornecedor
JOIN empenho e ON e.id_contrato = c.id_contrato
JOIN pagamento p ON p.id_empenho = e.id_empenho
GROUP BY f.nome
ORDER BY total_pago DESC;

-- Identificação de empenhos com data de pagamento anterior à data do empenho
SELECT 
	e.id_empenho,
	e.id_contrato, 
	e.data_empenho as data_empenho,
	p.datapagamentoempenho  as data_pagamento
FROM  empenho e
JOIN pagamento p ON e.id_empenho  = p.id_empenho 
WHERE e.data_empenho > p.datapagamentoempenho;

-- Identificação de pagamentos sem nota fiscal associada
SELECT 
    p.id_pagamento,
    p.id_empenho,
    p.valor,
    p.datapagamentoempenho
FROM pagamento p
LEFT JOIN liquidacao_nota_fiscal l ON p.id_empenho = l.id_empenho
WHERE l.id_empenho IS NULL;

-- ============================================
-- Exploração das tabelas
-- Objetivo: entender intervalos e relações entre as principais tabelas
-- Observações: essas consultas foram feitas no DBeaver
-- ============================================

-- Intervalo temporal dos empenhos
SELECT
    MIN(data_empenho) AS data_min,
    MAX(data_empenho) AS data_max
FROM empenho;

-- Intervalo temporal dos pagamentos
SELECT
    MIN(datapagamentoemp) AS data_min,
    MAX(datapagamentoemp) AS data_max
FROM pagamento;

-- Identificação de contratos que não possuem empenho associado
SELECT c.id_contrato, c.valor, c.objeto 
FROM contrato c 
LEFT JOIN empenho e ON e.id_contrato = c.id_contrato
WHERE e.id_contrato IS NULL;

-- Identificação de empenhos que não foram liquidados
SELECT e.id_empenho, e.valor, e.data_empenho, e.id_contrato
FROM empenho e
LEFT JOIN liquidacao_nota_fiscal l ON l.id_empenho = e.id_empenho
WHERE l.id_empenho IS NULL;

-- Identificação de pagamentos sem empenho associado
SELECT p.id_pagamento, p.valor, p.datapagamentoemp, p.id_empenho
FROM pagamento p
LEFT JOIN empenho e ON e.id_empenho = p.id_empenho
WHERE e.id_empenho IS NULL; 

-- Identificação liquidações sem nota fiscal associada
SELECT l.id_liquidacao, l.valor, l.data_liquidacao, l.id_empenho
FROM liquidacao_nota_fiscal l
LEFT JOIN nfe n ON n.chave_danfe = l.chave_danfe
WHERE n.chave_danfe IS NULL;


-- Identificação pagamento antes da liquidação
SELECT 
	e.id_empenho, 
	p.datapagamentoempenho as pagamento_empenho, 
	l.data_emissao as emissao_liquidacao 
FROM pagamento p
JOIN empenho e ON p.id_empenho = e.id_empenho 
JOIN liquidacao_nota_fiscal l ON e.id_empenho = l.id_empenho 
WHERE p.datapagamentoempenho < l.data_emissao 
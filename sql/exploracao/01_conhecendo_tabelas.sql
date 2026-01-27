-- ============================================
-- Exploração inicial da tabelas
-- Objetivo: entender volume, datas e chaves
-- Observações: essas consultas foram feitas no DBeaver
-- ============================================

-- Contagem total de registros em todas as tabelas
SELECT count(*) FROM entidade;
SELECT count(*) FROM contrato;
SELECT count(*) FROM fornecedor;
SELECT count(*) FROM empenho;
SELECT count(*) FROM pagamento;
SELECT count(*) FROM liquidacao_nota_fiscal;
SELECT count(*) FROM nfe;
SELECT count(*) FROM nfe_pagamento;

-- Identificação de campos nulos que não deveriam ser nulos

-- campos id_entidade e id_fornecedor na tabela contrato
SELECT count(*) FROM contrato WHERE id_entidade IS NULL;
SELECT count(*) FROM contrato WHERE id_fornecedor IS NULL;

-- campos id_entidade e id_contrato na tabela empenho
SELECT count(*) FROM empenho WHERE id_entidade IS NULL;
SELECT count(*) FROM empenho WHERE id_contrato IS NULL;

-- campo id_empenho na tabela pagamento
SELECT count(*) FROM pagamento WHERE id_empenho IS NULL;

-- campos id_empenho e chave_danfe na tabela liquidacao_nota_fiscal
SELECT count(*) FROM liquidacao_nota_fiscal WHERE id_empenho IS NULL;
SELECT count(*) FROM liquidacao_nota_fiscal WHERE chave_danfe IS NULL;

-- campo chave_nfe na tabela nfe_pagamento
SELECT count(*) FROM nfe_pagamento WHERE chave_nfe IS NULL;

-- Procurando fornecedores duplicados 
SELECT documento, COUNT(*) as quantidade
FROM fornecedor
GROUP BY documento
HAVING COUNT(*) > 1;
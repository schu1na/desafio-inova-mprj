SELECT 
    l.id_liquidacao_empenhonotafiscal,
    l.valor as valor_liquidacao,
    e.valor as valor_empenho
FROM liquidacao_nota_fiscal l
LEFT JOIN empenho e ON l.id_empenho = e.id_empenho
WHERE e.id_empenho IS NULL;
    
SELECT 
    e.id_empenho,
    e.valor as valor_empenho
FROM empenho e
LEFT JOIN liquidacao_nota_fiscal l ON l.id_empenho = e.id_empenho
WHERE l.id_empenho IS NULL
ORDER BY e.valor DESC;
    
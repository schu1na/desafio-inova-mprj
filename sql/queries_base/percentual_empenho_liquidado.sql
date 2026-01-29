SELECT
    l.valor AS valor_liquidado
FROM empenho e
LEFT JOIN liquidacao_nota_fiscal l ON l.id_empenho = e.id_empenho;
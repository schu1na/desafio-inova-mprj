SELECT 
    e.id_empenho,
    e.valor,
    e.data_empenho
FROM empenho e
LEFT JOIN contrato c ON c.id_contrato = e.id_contrato
WHERE c.id_contrato IS NULL;
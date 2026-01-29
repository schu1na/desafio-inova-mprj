SELECT 
    c.objeto,
    c."data",
    c.valor 
FROM contrato c
LEFT JOIN empenho e ON c.id_contrato = e.id_contrato
WHERE e.id_contrato IS NULL;

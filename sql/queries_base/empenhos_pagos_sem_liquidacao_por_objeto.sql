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
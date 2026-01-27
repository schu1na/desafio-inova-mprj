SELECT
    e.id_empenho,
    e.valor AS valor_empenhado,
    p.valor AS total_pago
FROM empenho e
JOIN pagamento p ON p.id_empenho = e.id_empenho
WHERE p.valor > e.valor

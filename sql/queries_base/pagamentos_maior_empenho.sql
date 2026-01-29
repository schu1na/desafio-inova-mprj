SELECT
    e.valor AS valor_empenhado,
    p.valor AS total_pago,
    c.objeto as objeto_contrato,
    f.nome as nome_fornecedor
FROM empenho e
JOIN pagamento p ON p.id_empenho = e.id_empenho
JOIN contrato c ON e.id_contrato = c.id_contrato
JOIN fornecedor f ON c.id_fornecedor = f.id_fornecedor
WHERE p.valor > e.valor;


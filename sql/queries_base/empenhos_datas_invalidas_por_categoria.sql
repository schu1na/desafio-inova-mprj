SELECT 
	SUM(p.valor) as valor_pago,
	c.objeto as objeto_contrato,
    e.data_empenho - p.datapagamentoempenho as diferenca_datas
FROM empenho e
JOIN pagamento p ON e.id_empenho  = p.id_empenho 
JOIN contrato c ON e.id_contrato = c.id_contrato
WHERE e.data_empenho > p.datapagamentoempenho
GROUP BY c.objeto, diferenca_datas;
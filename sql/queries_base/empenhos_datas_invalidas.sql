SELECT 
	e.id_empenho, 
	e.data_empenho as data_empenho,
	p.datapagamentoempenho  as data_pagamento,
	p.valor as valor_pago,
	c.objeto as objeto_contrato
FROM empenho e
JOIN pagamento p ON e.id_empenho  = p.id_empenho 
JOIN contrato c ON e.id_contrato = c.id_contrato
WHERE e.data_empenho > p.datapagamentoempenho;




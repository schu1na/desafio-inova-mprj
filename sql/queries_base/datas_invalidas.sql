SELECT 
	e.id_empenho,
	e.id_contrato, 
	e.data_empenho as data_empenho,
	p.datapagamentoempenho  as data_pagamento
FROM  empenho e
JOIN pagamento p ON e.id_empenho  = p.id_empenho 
WHERE e.data_empenho > p.datapagamentoempenho;

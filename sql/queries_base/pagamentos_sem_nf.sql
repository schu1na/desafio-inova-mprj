SELECT 
    p.id_pagamento,
    p.id_empenho,
    p.valor,
    p.datapagamentoempenho
FROM pagamento p
LEFT JOIN liquidacao_nota_fiscal l ON p.id_empenho = l.id_empenho
WHERE l.id_empenho IS NULL;

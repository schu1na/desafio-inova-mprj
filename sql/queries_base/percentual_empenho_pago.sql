SELECT
    p.valor AS valor_pagamento
FROM empenho e
LEFT JOIN pagamento p ON p.id_empenho = e.id_empenho;
SELECT 'contrato' AS tabela, COUNT(*) AS total FROM contrato
UNION ALL
SELECT 'empenho', COUNT(*) FROM empenho
UNION ALL
SELECT 'liquidacao_nota_fiscal', COUNT(*) FROM liquidacao_nota_fiscal
UNION ALL
SELECT 'pagamento', COUNT(*) FROM pagamento;

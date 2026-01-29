# Dashboard de Despesas Públicas

Este diretório contém os recursos de visualização do projeto de análise de despesas públicas. O dashboard tem como objetivo apresentar de forma intuitiva os resultados da auditoria de dados orçamentários, destacando inconsistências e fluxos financeiros.

## Visão Geral

O painel foi construído para monitorar a conformidade da execução orçamentária (Empenho $\to$ Liquidação $\to$ Pagamento), identificando gargalos e irregularidades.

**Acesso ao Dashboard Interativo:**
[Google Looker Studio](https://lookerstudio.google.com/reporting/3a945586-fd2a-4d3c-9d47-0aadddd61cb0)

**Versão Estática:**
O arquivo `Dashboard Despesas Públicas - Desafio Inova MPRJ.pdf` presente nesta pasta é uma exportação estática da visão final do dashboard.

---

## Principais Análises e Indicadores

O dashboard foca em três pilares principais de inconsistência identificados na base de dados:

### 1. Violação de Teto (Pagamentos > Empenho)
Monitora casos onde o valor pago excede o montante reservado no empenho.
- **Indicadores Chave**: Valor total excedente (aprox. R$ 3,5 Mi) e contagem de registros afetados.
- **Visualização**: Gráficos de barra por fornecedor e objeto de serviço, permitindo identificar os maiores ofensores.

### 2. Quebra de Fluxo (Pagamento sem Liquidação)
Identifica despesas pagas sem o registro prévio da liquidação, o que compromete a comprovação da entrega do serviço.
- **Indicadores Chave**: Total pago irregularmente (aprox. R$ 985 mil).
- **Visualização**: Distribuição por tipo de serviço e alerta de processos críticos.

### 3. Inversão Cronológica
Rastreia pagamentos realizados com data anterior à emissão do empenho, violando a ordem lógica da despesa pública.
- **Padrão Identificado**: O painel destaca ocorrências sistemáticas (delta de -5 dias), sugerindo falhas em automações ou processos de, ingestão de dados.

## Ferramenta Utilizada

- **Google Looker Studio**: Utilizado para a construção das visualizações interativas e compartilhamento do relatório.

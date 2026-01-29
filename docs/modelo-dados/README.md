# Explicação sobre a Modelagem de Dados

A modelagem lógica-relacional do banco de dados foi feita com base no arquivo `dicionário_de_dados_desafio_tecnico.pdf` e no acesso ao banco de dados disponível. Para modelar, foi escolhido o dbdiagram.io (Acesso em: [Despesa Pública - Desafio Inova MPRJ](https://dbdiagram.io/d/Desafio-Inova-MPRJ-6976884dbd82f5fce28d0a33)) e  a modelagem foi feita com base no compreendido sobre o conceito de despesa pública.

Com base no dicionário de dados, foi possível identificar dependências conceituais entre algumas entidades do banco, não só devido às chaves estrangeiras presentes na tabela, mas também devido ao seu conceito em si. Alguns exemplos de tabelas assim foram: `contrato` e `empenho`. A cardinalidade das relações também pôde ser captada pelo entendimento do fluxo de uma despesa pública:

1.  Contrato
2.  Empenho
3.  Liquidação
4.  Pagamento

Uma vez que toda despesa pública é composta por empenhos, foi indicado que um contrato está relacionado a múltiplos empenhos, porém cada empenho se relaciona, de forma única, a uma liquidação e a um pagamento.

Ademais, apesar de uma entidade e um fornecedor poderem fazer diversos contratos, cada contrato está ligado a um único fornecedor e uma única entidade. Com relação ao pagamento de liquidação do empenho, ainda temos as entidades `nfe` e `nfe_pagamento` as quais também estão intimamente ligadas uma a uma entre si, e há apenas uma nfe para uma liquidação.

A modelagem buscou refletir fielmente a estrutura do banco físico existente, evitando alterações conceituais que pudessem divergir do modelo já implementado.

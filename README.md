# Desafio | Processo Seletivo para Estagiário de Dados & Analytics

## Contexto
Este projeto tem como objetivo estruturar, analisar e visualizar informações da despesa pública, fornecendo insights e permitindo a identificação de padrões, inconsistências e indícios de irregularidades nos gastos governamentais, focando no ciclo da despesa pública.

## Estrutura do Projeto

Abaixo está a descrição das principais pastas e arquivos contidos neste repositório, seguida pela estrutura de pastas:

- `dashboards/`: Contém os arquivos estáticos do dashboard e o link para o dashboard interativo.
- `docs/`: Documentação do projeto.
    - `modelo-dados/`: Contém o diagrama e explicação da modelagem de dados.
- `notebooks/`: Notebooks Jupyter contendo a Investigação de Anomalias (Questão 2), EDA e documentação das hipóteses de negócio.
- `relatorio/`: Contém o relatório final da análise em formato PDF e seus arquivos fonte (LaTeX).
- `sql/`: Scripts SQL para registro das consultas e investigações realizadas.
    - `exploracao/`: Contém as consultas de exploração das tabelas para melhor entendimento do volume e qualidade dos dados.
    - `investigacoes/`: Contém as consultas de investigação de dados para identificação de anomalias e inconsistências.
    - `queries_base/`: Contém as consultas principais utilizadas com os principais questionamentos formulados. Todas as consultas estão registradas no arquivo `queries_base.sql`, porém foi feita modularização de cada consulta para facilitar implementação no notebook.
- `src/`: Código fonte Python modularizado.
    - `database.py`: Módulo responsável pela conexão com o banco de dados.
- `requirements.txt`: Lista das dependências Python do projeto.


```text
.
├── dashboards/
├── docs/
│   └── modelo-dados/
├── notebooks/
│   └── eda_despesa_publica.ipynb
├── relatorio/
│   ├── img/
│   ├── relatorio.pdf
│   └── relatorio.tex
├── sql/
│   ├── exploracao/
│   ├── investigacoes/
│   └── queries_base/
├── src/
│   ├── database.py
│   └── test_connection.py
├── .env.example
├── README.md
└── requirements.txt
```

## Configuração

1.  **Configurar Ambiente Virtual**:
    Crie e ative um ambiente virtual para isolar as dependências do projeto.
    ```bash
    # Criar o ambiente virtual
    python -m venv .venv

    # Ativar o ambiente (Windows)
    .\.venv\Scripts\activate

    # Linux/Mac:
    source .venv/bin/activate

    ```

2.  **Instalar Dependências**:
    Instale as bibliotecas necessárias listadas no `requirements.txt`:
    ```bash
    pip install -r requirements.txt
    ```

3.  **Configurar Banco de Dados**:
    - Crie um arquivo `.env` na raiz do projeto com base no exemplo:
      ```bash
      copy .env.example .env
      ```
    - Edite o arquivo `.env` inserindo as credenciais de acesso ao banco de dados.


## Como Usar (Exemplo Python)

Este projeto foi desenhado para ser modular. Abaixo estão as instruções para executar as análises interativas ou testar a conexão com o banco de dados via código.

### 1. Executando as Análises (Jupyter Notebooks)
Para reproduzir a investigação de anomalias e a análise exploratória:

1. Ative o ambiente virtual (caso não esteja ativo veja a seção de Configuração).
2. Abra o arquivo `notebooks/eda_despesa_publica.ipynb` no Jupyter Notebook.

### 2. Consumindo Dados via Python (Script)
Para conectar ao banco de dados e executar consultas utilizando o código fonte:

```python
from src.database import run_query

# Exemplo: Listar os 5 primeiros contratos
query = "SELECT * FROM contrato LIMIT 5"
df = run_query(query)

print(df.head())
```


## Acessar Informações

- **Modelo de Dados (Questão 1)**:
  A visualização e explicação da modelagem de dados utilizada no projeto estão disponível em:
  [Visualizar Modelo de Dados](./docs/modelo-dados/diagrama-bd-desafio-inova-mprj.png)
  *(Veja também a explicação detalhada em [Explicação do Modelo de Dados](./docs/modelo-dados/README.md))*

- **Investigação de Anomalias (Questão 2)**:
  A documentação dos questionamentos de negócio (ex: pagamentos sem empenhos, contratos excedidos) e a análise exploratória detalhada encontram-se estruturadas no Jupyter Notebook:
  [Ver Notebook de Investigação](./notebooks/eda_despesa_publica.ipynb)
  *(Nota: As queries SQL puras utilizadas nesta análise também podem ser consultadas individualmente na pasta [`sql/`](./sql/).)*

- **Dashboard (Questão 3)**:
  Os painéis de visualização podem ser encontrados na sua versão em PDF no diretório:
  [Acessar Dashboards](./dashboards/). Porém para uma visualização interativa, acesse o link do report no Google Looker Studio:
  [Acessar Dashboard no Google Looker Studio](https://lookerstudio.google.com/reporting/3a945586-fd2a-4d3c-9d47-0aadddd61cb0)

- **Relatório de Análise**:
  O relatório técnico completo com os resultados da análise pode ser acessado no link abaixo:
  [Ler Relatório Final (PDF)](./relatorio/relatorio.pdf)
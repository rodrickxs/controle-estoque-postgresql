# Controle de Estoque de uma Loja de Informática

## Sobre o projeto

Este projeto consiste no desenvolvimento de um banco de dados relacional para auxiliar o controle de estoque de uma loja de informática, utilizando PostgreSQL.

O objetivo é organizar os registros de produtos, categorias, fornecedores e movimentações, permitindo acompanhar entradas, saídas e níveis atuais de estoque.

## Tecnologias utilizadas

- PostgreSQL 16.15
- SQL
- Draw.io

## Estrutura do banco de dados

O banco de dados controle_estoque_informatica é composto por quatro tabelas:

| Tabela | Finalidade |
|---|---|
| categoria | Armazena as categorias dos produtos. |
| fornecedor | Armazena os dados dos fornecedores. |
| produto | Registra os produtos e seus estoques mínimos. |
| movimentacao | Registra as entradas e saídas de produtos. |

Os relacionamentos são estabelecidos por meio de chaves primárias e estrangeiras, garantindo a integridade dos registros.

## Funcionalidades

- Cadastro de categorias, fornecedores e produtos;
- Registro de entradas e saídas;
- Cálculo do saldo atual;
- Identificação de produtos abaixo do estoque mínimo;
- Consulta de movimentações por fornecedor;
- Restrições para impedir registros inconsistentes.

## Testes de integridade

Foram realizados testes para verificar se o banco rejeita:

- Quantidades negativas;
- Produtos inexistentes;
- Fornecedores inexistentes;
- Tipos de movimentação não permitidos;
- Saídas associadas a fornecedores;
- Estoques mínimos negativos.

Os registros inválidos foram utilizados intencionalmente para testar as restrições do banco.

## Análise de desempenho

Foi criado um índice sobre a coluna data_movimentacao da tabela movimentacao. Também foi utilizada a instrução EXPLAIN ANALYZE.

Como a quantidade de registros utilizada no projeto é pequena, o PostgreSQL optou por uma varredura sequencial (Seq Scan), não sendo possível demonstrar ganho de desempenho com o índice nesse cenário.

## Imagens do projeto

A pasta imagens contém o diagrama do banco, capturas das tabelas, dados cadastrados, consultas gerenciais e testes de integridade.

## Como restaurar o banco de dados

O arquivo controle_estoque_informatica.sql contém a estrutura e os dados do banco.

Primeiro, crie um banco vazio:

    createdb -U SEU_USUARIO controle_estoque_informatica

Depois, execute o arquivo:

    psql -U SEU_USUARIO -d controle_estoque_informatica -f controle_estoque_informatica.sql

Substitua SEU_USUARIO pelo usuário configurado no PostgreSQL.

A restauração deve ser realizada em um banco vazio.

## Dados utilizados

Os dados cadastrados são fictícios e foram utilizados para demonstrar o funcionamento das tabelas, consultas e restrições implementadas.

---

Projeto acadêmico desenvolvido para demonstrar a aplicação de banco de dados relacionais no controle de estoque de uma loja de informática.

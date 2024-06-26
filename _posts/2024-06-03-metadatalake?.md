---
date: 2024-06-03 02:04:23
layout: post
title: "Metadata...lake?"
subtitle:
description:
image: https://i.imgur.com/1rrS7oM.png
optimized_image:
category:
tags: metadata datalake
author: andre-ls
paginate: false
---
Em anos recentes, os Metadados ganharam uma certa relevância para as organizações. Primeiro, como uma ferramenta essencial para a construção de uma nova arquitetura de dados, mas depois como uma forma de auxiliar consumidores de dados a encontrarem os melhores conjuntos para o desenvolvimento de um solução.

Mas assim como a quantidade de dados vem crescendo cada vez mais, os metadados parecem estar seguindo o mesmo caminho.

## Novos tipos de Metadados
Com o surgimento de novas ferramentas no mundo da Qualidade e Governança de Dados, novos tipos de metadados, além dos tradicionais vem surgindo.

- Ambientes de Nuvem e sistemas de Orquestração de pipelines de dados estão gerando logs sobre as operações a todo momento, criando *Metadados de Performance*.
- Ferramentas consumidoras dos dados, como plataformas de BI e Machine Learning e Data Warehouses, geram *Metadados de Consumo* sobre os dados utilizados.
- Ferramentas de processamento de dados podem gerar informações sobre a origem do dado, bem como sobre quais operações foram aplicadas sobre o mesmo, gerando os chamados *Metadados de Proveniência*.
- Ferramentas de qualidade de dados e observabilidade vem gerando diversas métricas sobre a qualidade de conjuntos de dados, como o percentual de testes aprovados, gerando os *Metadados de Qualidade*.
- Algumas plataformas de Catálogo e Governança de Dados até geram os chamados *Metadados Sociais*, que medem a popularidade de uso de um determinado conjunto de dados e até avaliações de seus usuários.

## Infinitas Combinações
![Infinitas Combinações](https://i.imgur.com/r1zkrJF.gif)

Com tantas novas fontes de metadados, novas possibilidades de extrair valor começam a surgir a partir da combinação desses diferentes recursos e a sua integração com as demais ferramentas que de fato tratam dos dados. Imagine:

- Consultar um catálogo de dados, e descobrir, além do conjunto de dados, o responsável pelo dado ou possíveis experts da área pesquisada com base em informações do responsável pelo processamento dos dados.
- Com base nos logs passados de performance ou nos metadados de uso de determinados conjuntos de dados, uma pipeline de processamento de dados pode receber mais recursos computacionais para atender a sua demanda.
- Descobrir a fonte de erros em dashboards e visualizações a partir de informações dos conjuntos de dados utilizados para o gráfico ou métrica afetada.
- Analisar o impacto da alteração de estrutura de uma tabela a partir do conhecimento de tabelas dependentes.

São tantas as novas fontes de metadados e possibilidades, que alguns profissionais já começaram a dizer que…

## Metadados estão virando Big Data
Então, combina-se:

- Um grande volume de dados captados, oriundos de diversas fontes.
- Várias possibilidades de utilização dos dados, em incontáveis combinações e casos de uso.

Com esses dois fatores em mente, alguns profissionais no mercado já começaram a considerar o armazenamento e gerenciamento de metadados um problema de Big Data.

E assim, o que foi o cenário para os dados a alguns anos atrás, agora é o cenário para os metadados. E bem, se o cenário é o mesmo, a solução talvez seja a mesma: **Criar um Data Lake**.

## Um Data Lake Exclusivo para Metadados
Bem, aqui talvez valha a pena inserir uma breve explicação sobre Data Lakes. Não vou entrar muito em detalhes, visto que é um conceito bem popular, e já existem várias definições por aí.

Um Data Lake basicamente é um grande repositório central de dados que suporta o armazenamento de grandes quantidades de dados de diversos formatos, estejam eles estruturados (em formato tabular, com colunas bem definidas) ou não estruturados (imagens, áudios, vídeos e outros formatos). Sua filosofia central é a de armazenar dados inicialmente em um estado bruto, assim como são gerados, e processá-los para um uso específico apenas quando forem realmente necessários. Além disso, é uma arquitetura bastante baseada na ideia de [separar os sistemas de processamento e armazenamento de dados](https://andre-ls.github.io/nebula/a-separa%C3%A7%C3%A3o-entre-processamento-e-armazenamento-de-dados-(e-o-p%C3%A9ssimo-exemplo-de-uma-loja-de-perfumes)/).

É uma solução muito robusta e eficiente que vem sendo bastante utilizada para o armazenamento e processamento de grandes quantidades de dados nos dias atuais. E de fato, também pode ser um forte candidato para o armazenamento centralizado de metadados, atendendo o seu crescimento de volume, de tipos diferentes (já que suporta dados de vários formatos), e de casos de uso (com o armazenamento de dados brutos que podem ser processados futuramente para a construção de uma aplicação).

![Fonte: Medium, 2021.](https://i.imgur.com/YnMaAQo.png)
*Fonte: Medium, 2021.*

Mas para os metadados parece existir um fator que merece algumas tratativas próprias: A Capacidade de Integração.

É importante perceber, que ao menos boa parte das soluções envolvendo metadados se baseiam em alguma integração, seja entre ferramentas ou conjuntos de dados diferentes.

- Uma ferramenta de processamento de dados precisa se integrar a um catálogo de dados para descobrir a estrutura dos dados a serem lidos.
- Uma ferramenta capaz de analisar a linhagem dos dados precisa de metadados sobre o seu processamento para saber de onde os dados vieram.
- Para descobrir a popularidade de um conjunto de dados, metadados de usabilidade fornecidos por dashboards precisam ser obtidos.

Para atender essas necessidades, algumas proposições adicionais já vem sendo sugeridas aos Data Lakes de Metadados.

- **API’s e Interfaces:** Os metadados precisam ser facilmente acessíveis não somente por usuários, mas também pelas ferramentas que precisam se integrar a esses dados. A utilização de API’s é uma das maneiras mais populares de criar integração entre ferramentas, e portanto, pode ser um importante requisito nessa nova arquitetura.
- **Armazenamento em Grafos:** O grande valor dos metadados está na conexão de informações de diferentes fontes, e para suportar isso da melhor maneira, algumas ideias indicam a possibilidade de utilizar um formato de armazenamento dos dados baseado em uma estrutura de grafos, onde os nós são os diversos recursos de dados, e as setas indicam a relação entre eles.
    
![Fonte: Medium, 2023.](https://i.imgur.com/hgQbg03.png)
*Fonte: Medium, 2023.*
    

## Mais Novo do que o Recente
Sendo sincero, esse assunto é algo ainda muito novo (e consequentemente meio vago). A extração de valores dos metadados já é algo muito recente para muitas empresas, imagina então falar em armazená-los em data lakes. Mas é interessante perceber a velocidade com que esse conceito já está sendo discutido.

Pode ser que ele aconteça, pode ser que não, mas o aprendizado que fica é que além de importância na indústria, os metadados parecem também estar ganhando volume. Bem rapidamente.

## Referências
[The Rise of the Metadata Lake por Prukalpa, cofounder da Atlan](https://towardsdatascience.com/the-rise-of-the-metadata-lake-1e95127594de)

[Implementing the Metadata Lake… por Anand Govindarajan](https://medium.com/@ganandg/implementing-the-metadata-lake-7676f9dadb89)

[The Role of Metadata and Metadata Lake for a Successful Data Architecture por HyperRight](https://hyperight.com/the-role-of-metadata-and-metadata-lake-for-successful-data-architecture/)

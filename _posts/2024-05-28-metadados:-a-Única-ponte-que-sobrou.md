---
date: 2024-05-28 03:15:37
layout: post
title: "Metadados: A Única Ponte que Sobrou"
subtitle:
description:
image: https://i.imgur.com/6hQ6dtl.jpeg
optimized_image:
category:
tags: bigdata metadata hive
author: andre-ls
paginate: false
---
[Como analisado nesse artigo](https://andre-ls.github.io/nebula/a-separa%C3%A7%C3%A3o-entre-processamento-e-armazenamento-de-dados-(e-o-p%C3%A9ssimo-exemplo-de-uma-loja-de-perfumes)/), os sistemas de dados evoluíram de uma arquitetura onde o processamento dos dados e o seu armazenamento eram mantidos no mesmo dispositivo para um modelo onde cada um se encontra em sistemas separados. Isso trouxe obviamente vantagens e desvantagens. Mas fica a pergunta? Agora que os sistemas estão separados, como o sistema de processamento encontra os dados necessários para realizar uma determinada operação?

A resposta está nos…

## Metadados
A definição mais comum por aí é que metadados são dados sobre dados. É uma definição direta e sucinta, mas um pouco vaga. Mas vasculhando a internet, encontrei outra definição um pouco mais interessante:

> “Metadados são uma carta para o futuro - pode ser para você mesmo, mas de fato é uma carta para alguém depois de você, ou uma máquina depois de você, que pode salvar o tempo precioso de procurar algo indicando o conteúdo de um determinado objeto” - Jason Scott
> 

![Fonte: Ontotext, 2024.](https://i.imgur.com/HmUzhXz.png)
Fonte: Ontotext, 2024.

Esse é um dos aspectos mais importantes dos Metadados. Auxiliar a descoberta de algum recurso, seja ele um artigo, um filme ou documentário, um livro, ou uma tabela em um banco de dados. E através disso, o usuário pode não apenas encontrar recursos para uma determinada tarefa, mas também pode identificar o quão valioso cada recurso é para o que ele realmente precisa. 

Um exemplo muito simples. Você vai em uma livraria à procura de um livro sobre Machine Learning. Você pretende estudar sobre o assunto de uma maneira geral, mas tem um interesse específico em Redes Neurais. Logo, ao encontrar alguns livros sobre o tema (que você provavelmente encontrou através do título), você checa o sumário e a sinopse de cada um buscando saber se eles falam sobre o tema que te interessa. O sumário, a sinopse e o título, bem como o nome do autor, data de publicação, a editora, são todos metadados que te ajudaram a identificar livros que possam te ajudar entre centenas de outros livros presentes na livraria.

### Tipos de Metadados
As possibilidades de informações que podem ser cobertas pelos Metadados é um pouco grande, e naturalmente, criam-se alguns tipos de Metadados. Acredito que existam mais de uma definição quanto a isso por aí, especialmente se tratando de um assunto em evolução no momento em que escrevo, mas segue uma definição que encontrei em mais de uma fonte.

- *Metadados Descritivos*: Incluem informações sobre o conteúdo de um recurso e a sua origem, como título, autor, data de criação e descrições, como resumos, sinopses entre outros.
- *Metadados Estruturais*: Incluem informações a respeito da organização e estruturação dos elementos dentro do recurso. Vão desde um sumário, contendo a estrutura de capítulos de um livro, até a listagem e definição de tipos de colunas em uma tabela (o famoso schema).
- *Metadados Administrativos*: Incluem informações que auxiliam na administração e governança dos recursos. Podem envolver o responsável pelos recursos e quem tem acesso a eles, de onde os dados do recurso foram derivados, além de aspectos técnicos, como tamanho e formato do recurso.

## Fechando a Ponte
Ok, com todo esse poder de identificação de recursos dos metadados, vamos entender agora como ele fecha a ponte entre o processamento e o armazenamento. E para isso, vamos voltar ao mundo do Hadoop, onde temos um precursor das ferramentas de armazenamento e gerenciamento de metadados: O Hive Metastore.

O Apache Hive é uma ferramenta do ambiente Hadoop que cria uma interface SQL sobre o ambiente Hadoop, permitindo a execução de consultas sobre os dados armazenados no HDFS, o sistema padrão de armazenamento do Hadoop. O problema aqui é: Como executar uma query em SQL, que fala em tabelas e colunas, em cima de dados que estão armazenados em arquivos?

Para sanar esse problema, o Hive introduziu um elemento chave em sua arquitetura, o Metastore, que consiste em um elemento responsável por armazenar os metadados dos dados acessíveis pelo Hive, incluindo definições sobre as tabelas, suas colunas com os devidos tipos de dados, processos para leitura e gravação dos dados, e a localização dos arquivos que compõem os dados da tabela.

Dessa forma, cada consulta a ser executada pelo Hive envolve uma comunicação com o Metastore, primeiro para saber se as tabelas e colunas requisitadas pelo usuário existem, e caso positivo, obter informações de onde os dados necessários se encontram e como alcançá-los. É literalmente uma tradução do mundo SQL para o mundo técnico do Hadoop, e os usuários podem continuar falando em colunas e tabelas sem se preocupar com os detalhes técnicos por trás disso.

![Conexão entre Queries e o Mundo Técnico do Hadoop](https://i.imgur.com/QhMPM8H.png)

Com a separação do processamento e armazenamento, e o surgimento de novas ferramentas que dominaram o mercado, o Hive Metastore se atualizou e não ficou para trás. Com o poder de armazenar metadados de outras fontes, como os populares armazenamentos de objetos, e o poder de fornecer os seus metadados via API para outras ferramentas de processamento além do Hive, criou-se um ecossistema em torno do Hive Metastore de ferramentas open-source presentes em algumas arquiteturas de Data Lakes por aí.

![Fonte: Hive, 2024.](https://i.imgur.com/8sreMLr.png)
Fonte: Hive, 2024.

E assim, com o Metastore no centro de diversas ferramentas, os metadados se tornaram a única ponte que sobrou entre as ferramentas de processamento e armazenamento…Mas não é só isso.

## Um acelerador de resultados
Além da função de conexão entre ferramentas, a gestão de metadados vem sendo um tema razoavelmente importante dentro das organizações, por um motivo singular.

> “As organizações estão se afogando em dados, e ainda assim com sede de insights” - Priya Iragavarapu, Vice-Presidente de Data Science e Analytics na AArete.
> 

Há muitos dados, mas pouca conversão deles em informações e insights que trazem de fato valor para as empresas. Para acelerar esse processo, e reverter esse cenário, os metadados deixaram de ser apenas um meio de conectar ferramentas, e passaram a ser o pilar para a construção de uma ferramenta central, o chamado Catálogo de Dados. 

O Catálogo de Dados é basicamente um repositório central que mantém metadados sobre todos os recursos de dados de uma organização. A partir disso, cria-se uma plataforma através da qual qualquer usuário pode consultar, pesquisar, descobrir e identificar conjuntos de dados disponíveis com potencial de serem utilizados para a criação de uma aplicação de dados, seja um dashboard, uma análise estatística, um modelo de machine learning, ou qualquer outro. É literalmente o exemplo anterior da livraria, só que dentro de todo o ecossistema de dados de uma empresa.

![Fonte: Analytics Yogi, 2022.](https://i.imgur.com/KfxXaxO.png)
Fonte: Analytics Yogi, 2022.

## Novas armas
Para potencializar ainda mais essa ideia, novas soluções de armazenamento e gerenciamento de metadados vem surgindo no mercado, trazendo uma gama de funcionalidades que não só facilitam ainda mais a identificação e localização de conjuntos de dados, mas também ampliam a quantidade de informações que os metadados podem conter.

- **Mais fontes de Dados**: Dados existentes em bancos de dados, serviços de streaming e até em diferentes ambientes de nuvem podem ser catalogados.
- **Mais ferramentas de processamento**: Diferentes ferramentas de processamento, além do ambiente Apache podem aproveitar dos catálogos de dados para consumir dados e já identificar a sua estrutura.
- **Arquiteturas Sem Servidor**: Diferentemente do Hive Metastore, que precisa ser implantado em uma infraestrutura específica, novas ferramentas podem ser ativadas pelo usuário em ambientes de nuvem sem se preocupar com a criação e manutenção de servidores.
- **Capacidades avançadas de Pesquisa**: Pesquisas por texto ou até mesmo por consultas SQL estão ganhando suporte.
- **Atualização automática de Metadados Estruturais**: Mudanças como a adição ou remoção de colunas são automaticamente captadas e os devidos metadados atualizados.
- **Acompanhamento da Linhagem dos Dados**: A Linhagem consiste em toda a sequência lógica até a composição de um determinado conjunto de dados, o que pode envolver por exemplo a combinação de colunas de diferentes grupos de dados ou até de diferentes fontes de dados. E as novas ferramentas vem permitindo esse acompanhamento.
- **Observabilidade e Qualidade dos Dados**: Talvez essa seja uma das mais importantes tendências dos metadados (bem, pelo menos no momento que escrevo). Novas categorias de metadados estão trazendo consigo informações sobre a qualidade dos dados, obtidas através de integração direta com ferramentas de testes e observabilidade. Isso vem tornando os metadados uma ferramenta cada vez mais importante para a aplicação da Governança de Dados dentro de uma empresa, e o usuário cada vez mais servido com dados de qualidade superior para suas aplicações.

## Metadados for the Win

Os Metadados ganharam relevância como uma forma de conectar os dois mundos recém separados do processamento e armazenamento. Mas hoje, parecem ter evoluído para uma ferramenta chave para o sucesso na utilização efetiva dos dados, pelo menos em grandes organizações. Ele deixou de ser apenas uma ferramenta que auxilia máquinas a localizarem dados, e passaram a ser também uma ferramenta que auxilia pessoas a encontrarem soluções. E isso aumentou consideravelmente o seu valor como ativo.

## Referências
[Documentação do Hive pelo próprio Apache Hive](https://hive.apache.org/)

[What is Metadata? por Ontotext](https://www.ontotext.com/knowledgehub/fundamentals/metadata-fundamental/)

[Metadata Basics por University of Texas](https://guides.lib.utexas.edu/metadata-basics/key-concepts)

[Hive Metastore (HMS): What it is & What Can Replace it por LakeFs](https://lakefs.io/blog/hive-metastore-why-its-still-here-and-what-can-replace-it/)

[18 top data catalog software tools to consider using in 2024 por TechTarget](https://www.techtarget.com/searchdatamanagement/feature/16-top-data-catalog-software-tools-to-consider-using)

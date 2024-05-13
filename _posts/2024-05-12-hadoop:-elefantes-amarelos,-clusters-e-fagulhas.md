---
date: 2024-05-12 20:46:31
layout: post
title: "Hadoop: Elefantes amarelos, Clusters e Fagulhas"
subtitle:
description:
image: https://i.imgur.com/mEgc9jG.jpeg
optimized_image:
category:
tags: hadoop bigdata spark
author: andre-ls
paginate: false
---
O Hadoop é um assunto paradoxal dentro do campo de Engenharia de Dados. Como atual estudante da área, vejo que muito se fala sobre o Apache Spark e a sua mágica velocidade de processamento, mas pouco se fala do Hadoop como a base sobre a qual o Spark foi criado. Ao mesmo tempo, múltiplas soluções ofertadas por ambientes de nuvem utilizadas para execução de tarefas do Spark, muitas vezes não são vendidas apenas como ambientes para o Spark, mas sim para ferramentas do ecossistema Hadoop. Então, qual a sacada do Hadoop? Qual sua importância? E ele ainda é relevante? 

De uma maneira inicial, o Hadoop é uma plataforma open source, desenvolvida em Java, de armazenamento e processamento de dados para aplicações de Big Data, utilizando para isso o poder da computação distribuída. Ou seja, ao invés de processar os dados em um único computador, o Hadoop utiliza um grupo de computadores, geralmente chamado de *cluster*, para a execução de tarefas, que são divididas adequadamente entre cada um dos computadores, geralmente chamados de *nós*. Através dessa divisão, múltiplas sub-tarefas são executadas ao mesmo tempo, diminuindo o tempo da execução como um todo. É literalmente “dividir para conquistar” usando computadores.

Bem, pelo menos esse era o conceito do Hadoop. Veremos que ao longo dos anos ele parece ter mudado um pouco.

## História
O desenvolvimento do Hadoop se iniciou em 2002 com dois desenvolvedores, Doug Cutting e Mike Cafarella, que trabalhavam em um projeto chamado Apache Nutch. A ideia do Nutch era de basicamente criar um sistema de mecanismo de buscas de páginas da web capaz de processar uma quantidade muito grande de dados, semelhante ao que hoje é encontrado por trás do portal de pesquisas do Google. Entretanto, após muita pesquisa, percebeu-se que o projeto era economicamente inviável, requerendo uma imensa quantidade de dinheiro em hardware para mantê-lo, especialmente quando se considerava o armazenamento e o processamento dos dados.

Estes dois problemas foram superados através da inspiração em duas tecnologias divulgadas via artigo pelo Google: o Google File System (GFS), solução para armazenamento de grandes quantidades de dados, e o MapReduce, que é uma tecnologia para processamento massivo de dados. A partir dessas ideias, o único obstáculo que ainda permanecia para o desenvolvimento do Nutch era mão de obra. Logo, buscando investimento para o seu projeto, Doug Cutting se junta ao Yahoo, onde encontrou um time de engenheiros que o ajudou a definitivamente criar a solução. Durante esse processo, Cutting separou o módulo de processamento de dados do restante do projeto, criando um novo projeto batizado de Hadoop, nome que veio de um elefante amarelo de brinquedo que pertencia ao seu filho. 

![Fonte: Wired, 2023](https://i.imgur.com/TpdZZCC.png)
*Fonte: Wired, 2023.*

Em 2008, o Hadoop foi lançado como um projeto Open Source através da Apache Software Foundation, uma organização sem fins lucrativos voltada para a divulgação e suporte de projetos Open Source, o que democratizou a várias empresas o acesso a um poder computacional de alta capacidade de processamento só disponível na época através de soluções proprietárias que dominavam o mercado.

## Arquitetura Principal
![Fonte: Quora, 2020.](https://i.imgur.com/EtjCAvu.jpg)
*Fonte: Quora, 2020.*

A Arquitetura Principal do Hadoop, o que poderíamos chamar do seu núcleo, é composto de quatro elementos:

- *Hadoop Distributed File System (HDFS)*: Sistema de armazenamento distribuído entre os vários nós de um cluster Hadoop, permitindo o seu processamento em paralelo por vários dispositivos, ao mesmo tempo que garante uma alta tolerância à falhas.
- *MapReduce*: Sistema responsável pelo processamento de dados do Hadoop, onde operações são mapeadas aos dados distribuídos (Map) e os resultados de todas as operações são agregados em um único valor final (Reduce).
- *Yet Another Resource Negotiator (YARN)*: Sistema para gerenciamento de recursos, planejamento e agendamento de tarefas no cluster.
- *Hadoop Commons*: Conjunto de serviços e utilitários que oferecem suporte a outros módulos do Hadoop.

## HDFS
O HDFS é um sistema de arquivos distribuído construído para armazenar grandes quantidade de dados operando eficientemente em hardware de baixo custo e garantindo a disponibilidade dos dados através de mecanismos de tolerância a falhas. Para entender cada pedaço dessa frase, vale a pena visitar o funcionamento interno do HDFS.

![Fonte: InterviewBit, 2024.](https://i.imgur.com/asY9nvx.png)
*Fonte: InterviewBit, 2024.*

A arquitetura do HDFS funciona através de um sistema Mestre-Servidor, ou seja, há um elemento central que controla vários outros elementos “subordinados”. Trazendo para o mundo do Hadoop, esses elementos são:

- *Name Node*: Opera como o mestre do sistema, gerenciando os arquivos e provisionando o seu acesso por usuários. Para isso, ele assume algumas importantes responsabilidades.
    - Primeiro, ele é responsável por distribuir os dados entre os vários nós do sistema. Para isso, um arquivo único é separado em pedaços chamados de blocos, e cada um desses blocos é alocado em diferentes nós do cluster. É como se cada arquivo fosse quebrado em pequenas peças de LEGO. Essas peças são guardadas em locais separados, mas podem ser juntadas novamente para formar o arquivo original.
    - Segundo, ele armazena metadados. Metadados são basicamente informações relevantes sobre os dados que estão sendo armazenados no sistema. Podem envolver desde informações básicas como nome do arquivo, data de criação e seu tamanho, até informações mais específicas do sistema, como quantidade de blocos de um arquivo e a localização destes blocos no cluster. Isso é importante pois, quando um determinado arquivo precisar ser lido do HDFS, os seus blocos devem ser reunidos para reconstruir o arquivo original e assim devolvê-lo ao usuário que o requisitou. Precisamos saber onde os blocos de LEGO se encontram para montar o arquivo. E o Name Node contém essa informação.
    - E por fim, o Name Node é o responsável por realizar operações sobre estes blocos, como criar, deletar, renomear, replicar, entre outros e sobre arquivos e diretórios, como abertura, fechamento e renomeação.
- *Data Node*: Opera como o servidor do sistema, estando presente em cada nó do cluster. São responsáveis basicamente por armazenar os blocos de dados alocados pelo Name Node, servir operações de leitura e escrita dos clientes, e atender operações sobre os blocos requisitadas pelo Name Node. 

A partir desta separação de um arquivo em múltiplos blocos armazenados em diferentes computadores, o HDFS consegue criar um sistema propício para o armazenamento de uma grande quantidade de dados. Mas como dito no início dessa seção, esse sistema foi desenvolvido para funcionar em máquinas comuns e de baixo custo, e essas máquinas podem naturalmente falhar. Assim, para tomar isso em conta, e evitar que dados sejam perdidos, o HDFS promove uma tolerância a estas possíveis falhas replicando dados. Ou seja, cada bloco de dados separado pelo Name Node é alocado em mais de um Data Node. Dessa forma, caso um nó do cluster falhe, algum outro nó ainda existente vai conter um dado que estava no nó que falhou, e assim nada é perdido. No caso do HDFS, cada bloco é por padrão replicado 3 vezes, ou seja, uma mesma informação é salva em 3 locais diferentes. Isso obviamente leva a um consumo maior de armazenamento, e portanto a mais custos, porém são custos justificados pela segurança de armazenamento dos dados.

![Fonte: Hdfstutorial, 2016.](https://i.imgur.com/yrVSslC.png)
*Fonte: Hdfstutorial, 2016.*

Com isso, riscamos o checklist do HDFS:

- ~~Armazenamento para grandes quantidade de Dados~~

- ~~Operação em Hardware Comum e de Baixo Custo~~

- ~~Tolerante à Falhas~~

## MapReduce
O MapReduce é a ferramenta de processamento de dados original do Hadoop, sendo responsável por ler os dados do HDFS, processá-los seguindo algum script, e devolver o resultado ao HDFS. Arquiteturalmente, uma das principais características do MapReduce é o fato de que a sua execução é feita no mesmo local onde os dados estão armazenados. Ou seja, se um determinado arquivo deve ser processado pelo MapReduce, cada um dos seus blocos será processado no mesmo nó do cluster em que ele já se encontra, não necessitando de movimentação de blocos entre os dispositivos, o que torna o sistema mais performático.

Um dos princípios centrais do MapReduce é realizar todo esse processo abstraindo a complexidade dos dados distribuídos (como visto na seção anterior) para o usuário, que se preocupa em apenas definir dois tipos principais de operações, que dão o nome à ferramenta.

![Fonte: DataScientest, 2023.](https://i.imgur.com/O2Zahxb.png)
*Fonte: DataScientest, 2023.*

- Map: Consiste em uma função aplicada aos blocos de dados, que já se encontram separados no HDFS. Os Mappers recebem os dados em um formato <chave,valor> e o seu resultado também gera um novo conjunto de <chave,valor>.
- Reduce: Os resultados das operações de Map ainda se encontram distribuídos nos nós do cluster, e o Reduce é a operação responsável por agregá-los e gerar o resultado final da tarefa. Os resultados intermediários com a mesma chave são enviados para o mesmo Reducer.

Além dessas duas funções principais, existem algumas funções intermediárias entre o Map e o Reduce, que possuem um impacto positivo na performance do sistema:

- Shuffle: Redistribuição de dados entre os nós, agregando informações com a mesma chave em um mesmo nó.
- Combine: Operação opcional, onde um reducer é executado em cada mapper, de forma a reduzir ainda mais os seus resultados antes de serem transmitidos, reduzindo a carga de dados a serem trafegados.
- Partition: Processo que decide como os dados resultantes do Map serão apresentados para o Reducer.

## YARN
E para gerenciar tudo isso, temos o YARN, que é o módulo do Hadoop responsável pelo gerenciamento de recursos, planejamento e agendamento de tarefas. Dito de uma maneira mais simples, o YARN recebe as tarefas a serem executadas no cluster e aloca para cada uma quantidade de máquinas do cluster necessários para sua execução no momento em que elas forem agendadas para serem executadas.

Em termos de arquitetura, o YARN se localiza entre o HDFS e a ferramenta de processamento, utilizando um gerenciador de recursos centralizado e gerenciadores de recurso em cada nó de forma a alocar os devidos recursos (representados em slots chamados de containers) para cada aplicação, cuja execução é garantida por um gerenciador específico.

![Fonte: TechTarget, 2018.](https://i.imgur.com/MtpDCRf.png)
*Fonte: TechTarget, 2018.*

Atualmente o Hadoop se encontra em sua terceira versão, e o YARN foi adicionado apenas a partir da segunda versão. Na primeira versão do Hadoop, essas funcionalidades de gerenciamento de recursos e agendamento de tarefas eram feitos pelo próprio MapReduce, o que limitava o Hadoop a executar apenas aplicações MapReduce. Com a adição do YARN, entretanto, o gerenciamento de recursos e o processamento dos dados em si foram desacoplados, abrindo portas para que outros sistemas, além do MapReduce, pudessem ser utilizados junto ao Hadoop. Isso transformou o Hadoop de uma ferramenta única para o que ele é hoje: Um ecossistema.

## Ecossistema Hadoop
Hoje em dia, o MapReduce já não é uma ferramenta muito utilizada, pelo menos diretamente. Com a flexibilidade criada pelo YARN, algumas outras ferramentas surgiram no mercado, trazendo mais funcionalidades e interfaces mais intuitivas para o MapReduce, ou em alguns casos, até o substituindo como ferramenta de processamento. Isso transformou o Hadoop de uma simples ferramenta única para um ambiente, onde várias soluções que utilizam o processamento de dados em paralelo como base podem ser encontradas. Obviamente algumas são mais populares do que outras, e vale a pena visitá-las brevemente.

![Fonte: Medium, 2023.](https://i.imgur.com/fMXQbv1.png)
*Fonte: Medium, 2023.*

### Hive
![Fonte: Wikipedia, 2022.](https://i.imgur.com/atHzQ4m.png)
*Fonte: Wikipedia, 2022.*

O Apache Hive é uma solução de data warehouse open source criada pelo Facebook, capaz de ler, escrever e gerenciar dados em grande escala. Sua ideia principal é a de utilizar o Hadoop como base para processamento e armazenamento de dados, mas fornecendo uma interface de interação muito mais fácil e flexível através de uma linguagem de sintaxe muito semelhante ao SQL. Isso permitiu que diversos engenheiros pudessem utilizar o processamento do Hadoop de uma maneira muito mais ágil, visto que profissionais com conhecimentos em SQL eram muito mais comuns do que profissionais com conhecimento em Java, a única linguagem através da qual os jobs MapReduce podiam ser definidos.

Além disso, o Hive trouxe como uma importante decisão de design um elemento central responsável por armazenar metadados, realizando o mapeamento entre os arquivos do HDFS e as devidas tabelas do Hive.

### Pig
![Fonte: Wikipedia, 2022.](https://i.imgur.com/gDmPYz3.png)
*Fonte: Wikipedia, 2022.*

O Apache Pig, semelhante ao Hive, é uma ferramenta que funciona sobre o Hadoop, fornecendo uma interface de programação mais simples e de alto nível. A diferença, entretanto, é que o Pig possui uma natureza mais voltada para processos de extração, limpeza e pré-processamento dos dados, enquanto o Hive é mais utilizado para a análise e operações de dados já transformados. De certa forma, as duas ferramentas podem ser utilizadas de maneira complementar: Enquanto o Pig pode ser utilizado para extração, limpeza e organização dos dados, o Hive pode ser utilizado para analisar os dados entregues pelo Pig.

### HBase

![Fonte: AWS,2023.](https://i.imgur.com/OXe4Avv.png)
*Fonte: AWS,2023.*

O HBase é um banco de dados NoSQL, open source e distribuído que assim como as demais ferramentas apresentadas, opera sobre o Hadoop. Utilizando sua arquitetura distribuída, o HBase escala linearmente para lidar com cojuntos de dados envolvendo bilhões de linhas e milhões de colunas.

### Spark
![Fonte: DataScienceAcademy, 2020.](https://i.imgur.com/dCtIiYO.png)
*Fonte: DataScienceAcademy, 2020.*

O Spark é uma ferramenta de processamento de dados, criada através de um projeto de pesquisa da Universidade da Califórnia, que foi criado com o objetivo de acelerar a execução de tarefas no Hadoop. Isso foi alcançado principalmente através da mudança de local de armazenamento dos dados a serem processados: Enquanto o MapReduce utilizava o disco, o Spark passou a utilizar a memória, que é um componente muito mais otimizado para o acesso rápido de informações pelo processador.

Além disso, o Spark trouxe uma maior flexibilidade de uso como ferramenta, tanto em termos de cenários, onde pode ser utilizado para processamentos em Lote (vários dados processados de uma vez) ou em Streaming (dados processados quase em tempo real), além de possuir interface para várias linguagens de programação. Soma-se a isso submódulos extras, que permitem interações com os dados via uma interface SQL, desenvolvimento de modelos de Machine Learning e processamento de Grafos. 

![Fonte: Medium, 2021.](https://i.imgur.com/p242ITL.png)
*Fonte: Medium, 2021.*

Diferentemente das outras ferramentas apresentadas, o Spark se encaixa no Hadoop realmente substituindo o MapReduce como ferramenta de processamento. E principalmente devido aos exorbitantes resultados de velocidade obtidos, chegando a ser 100 vezes mais rápido do que o MapReduce, o Spark veio, em anos recentes, tomando o espaço do MapReduce como escolha em diversas arquiteturas de dados de grande volume, tornando-se uma ferramenta extremamente popular hoje em dia e o motor principal de processamento de dados em muitos Data Lakes por aí. O que nos leva a perguntar…

## Onde está o Elefante?
Além da já citada supremacia do Apache Spark sobre o MapReduce, o Hadoop como ferramenta também perdeu outra liderança: a de armazenamento. Com a flexibilidade trazida pelas novas ferramentas do ecossistema, vieram também a compatibilidade com sistemas de armazenamento diferentes do HDFS, trazendo vantagens como custos mais baixos, maior segurança e alta disponibilidade dos dados. Além disso, com o aumento da disponibilidade e velocidade da internet hoje em dia, surgiu a tendência de separar o armazenamento e o processamento dos dados em sistemas diferentes, ao contrário do que prega o HDFS de juntar essas duas dimensões no mesmo dispositivo. Parece contraintuitivo, mas isso trouxe importantes facilidades, principalmente para a escalabilidade do sistema.

Tudo isso fez com que o HDFS caisse em desuso, sendo substituído por outros sistemas em decisões de arquitetura, como os Object Storages, que dominam as estruturas de Data Lakes hoje em dia.

E com isso, o Hadoop foi destronado nos dois principais pilares em que foi criado: Processamento e Armazenamento.


## Então, ele morreu?
![Fonte: LinkedIn, 2019.](https://i.imgur.com/jjbS8uL.png)
*Fonte: LinkedIn, 2019.*

Alguns dizem que o Hadoop morreu. O elefante já era. Bem, eu acho que depende.

Como a ferramenta de processamento de dados criada lá trás para armazenar e processar dados em larga escala, sim talvez ele tenha morrido mesmo. Mas como conceito, acho que ele não morreu, só se transformou em outra coisa. Se transformou em uma plataforma onde alguns de seus princípios, como o uso de licenças open source, adaptação para hardware simples e sua natureza modular permitiu a criação de inúmeras ferramentas importantes, das quais algumas dominam o mercado de dados e são escolha para muitas arquiteturas de dados por aí.

Então de certa forma, de uma maneira indireta, o Hadoop ainda está meio vivo. O elefante está por aí, só um pouco escondido nos diagramas de arquitetura.

## Referências
[Hadoop | History or Evolution por GeeksbyGeeks](https://www.geeksforgeeks.org/hadoop-history-or-evolution/)

[O que é Hadoop? por Databricks](https://www.databricks.com/br/glossary/hadoop)

[Apache Hadoop YARN por TechTarget](https://www.techtarget.com/searchdatamanagement/definition/Apache-Hadoop-YARN-Yet-Another-Resource-Negotiator#:~:text=One%20of%20Apache%20Hadoop's%20core,executed%20on%20different%20cluster%20nodes) 

[Hadoop Distributed File System (HDFS) por Databricks](https://www.databricks.com/glossary/hadoop-distributed-file-system-hdfs) 

[Hadoop - Architecture por GeeksbyGeeks](https://www.geeksforgeeks.org/hadoop-architecture/)

[HDFS Architecture Guide por Hadoop](https://hadoop.apache.org/docs/r1.2.1/hdfs_design.html)

[What is Apache Hive? por Databricks](https://www.databricks.com/glossary/apache-hive)

[GCP: Complete Google Data Engineer and Cloud Architect Guide por Udemy](https://www.udemy.com/course/gcp-data-engineer-and-cloud-architect)

[Apache HBase: O que é, Conceitos e Definições por Cetax](https://cetax.com.br/o-que-e-o-apache-hbase/)

[Hadoop is Dead. Long live Hadoop. por Arun C Murthy](https://medium.com/@acmurthy/hadoop-is-dead-long-live-hadoop-f22069b264ac)

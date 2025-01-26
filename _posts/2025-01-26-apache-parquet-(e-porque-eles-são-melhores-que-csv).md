---
date: 2025-01-26 14:33:46
layout: post
title: "Apache Parquet (E porque eles são melhores que CSV)"
subtitle:
description:
image: https://i.imgur.com/6OumKAG.jpeg
optimized_image:
category:
tags: parquet csv columnar
author: andre-ls
paginate: false
---
Por muito tempo, os dados dentro das empresas eram trafegados, tratados e consumidos em planilhas do Excel. Até certo ponto, na verdade, pode-se dizer que isso ainda continua. O seu conceito de planilhas e suas inúmeras possibilidades o tornam uma ferramenta flexível que faz parte do cenário de trabalho de muitas funções por aí e colocam nas mãos dos usuários finais, com pouco treinamento, grandes poderes de processar dados, calcular novas colunas e métricas, gerar gráficos e relatórios, entre outros.

E com essa popularidade, veio a natural utilização de formatos de arquivos como o .xlsx e o .csv para armazenar e compartilhar planilhas e relatórios. E até certo ponto, em cenários sem muito rigor, estes arquivos, bem…funcionam. Mas a partir do momento em que outras variáveis entram em jogo, como consistência das informações, durabilidade e principalmente **volume**, manter dados nestes tipos de arquivos começa a se tornar um problema.

Óbvio que no meio do caminho existem os Bancos de Dados, soluções bastante robustas que sustentam uma enorme parte das aplicações hoje em dia. Mas quando se fala de Análise de Dados, as necessidades finais dos usuários seguiram um caminho diferente, e habitam um mundo no qual os bancos de dados não são a arma mais eficiente. 

O mundo analítico precisa de um novo herói, que vai além das capacidades do Excel. E sim, ele existe. Ou melhor, existem alguns heróis por aí. Mas a minha pouca experiência só permite falar de um: o Apache Parquet.

## O Herói (ou pelo menos um candidato a herói)

![https://www.jumpingrivers.com/blog/parquet-file-format-big-data-r/parquet-logo.png](https://www.jumpingrivers.com/blog/parquet-file-format-big-data-r/parquet-logo.png)

O Apache Parquet é antes de tudo (e qualquer buzz word) um formato de arquivo. Assim como o .csv e o .xlsx, ele é um arquivo, capaz de ser armazenado na memória do seu computador, guardando dentro de si dados.

O que muda é a forma como ele organiza os dados dentro de si. E aqui existem algumas diferenças significativas.

### Armazenamento em Colunas

A principal diferença se concentra na posição dos dados no sistema de armazenamento. É uma ideia simples, porém em um cenário um pouco complexo. Então vamos usar um pouco de imaginação (e alguns desenhos) para explicar isto.

Imagine o sistema de armazenamento de um computador como um armário muito longo, cheio de compartimentos posicionados uns ao lado dos outros em uma longa reta. Cada compartimento é capaz de armazenar algum tipo de dado.

![Um grande armário contendo alguns dados.](https://i.imgur.com/CO31itj.png)
*Um grande armário contendo alguns dados.*

Aqui, vamos estabelecer como exemplo de dados uma tabela (extremamente simplificada) contendo informações de usuários de um sistema.

![Tabela de Usuários de exemplo.](https://i.imgur.com/lUh4KCc.png)
*Tabela de Usuários de exemplo.*

Nesse caso, cada compartimento do armário deve armazenar um valor da tabela (ou célula, como os planilheiros chamariam). A questão é: qual a melhor forma de organizar e guardar os dados no armário? 

Bem, depende de quem vai precisar consultar os dados depois e a sua necessidade. Mas uma verdade que não muda para ninguém é que todos querem encontrar as informações que precisam da maneira mais rápida e fácil possível. E se, de alguma forma, todas os dados que alguém precisa estiverem localizados próximos uns aos outros, talvez até em armários vizinhos, o caminho que cada um precisaria percorrer seria bem menor.

O Excel e o csv armazenam informações colocando dados da mesma linha da tabela próximos uns aos outros, como demonstrado abaixo.

![Armazenamento por linhas.](https://i.imgur.com/9ZBUOWd.png)
*Armazenamento por linhas.*

Essa organização facilita a busca de dados quando se deseja obter informações de um registro (ou nesse caso, de um usuário) específico: Basta encontrar um armário com a identificação do usuário, e todos os demais dados estarão em armários vizinhos.

O problema é que quando se pensa em análise de dados, informações específicas de um único usuário são úteis em poucos cenários. Na maioria das situações se desejam obter estatísticas ou métricas de um determinado atributo (uma coluna de uma tabela) para uma grande quantidade de registros, como para todos os usuários do sistema, ou talvez para um período de tempo, como um ano inteiro ou alguns meses. Exemplos podem incluir a média de idade dos usuários ou a sua distribuição de idades ou de gênero. 

Todos esses casos envolvem recolher uma grande parte ou todos os dados de uma determinada coluna para realizar os devidos cálculos. E bem, na configuração de armazenamento anterior, isso é um pouco complicado, visto que as informações de cada coluna estão espalhadas e distantes umas das outras, e coletar todos esses dados envolve pular vários armários sem conteúdo necessário e consequentemente percorrer uma grande distância.

![Leitura de idades em um arquivo de armazenamento por linhas para o cálculo de média.](https://i.imgur.com/y7XFQIW.png)
*Leitura de idades em um arquivo de armazenamento por linhas para o cálculo de média.*

Faria mais sentido se todos os dados de uma mesma coluna estivessem armazenados juntos em armários vizinhos. 

![Armazenamento por colunas.](https://i.imgur.com/CyLVOKu.png)
*Armazenamento por colunas.*

Assim, percorrendo apenas uma determinada região de armários, é possível obter os dados necessários para se calcular métricas sobre colunas.

![Leitura de idades em um arquivo de armazenamento por colunas para o cálculo de média.](https://i.imgur.com/542Adpx.png)
*Leitura de idades em um arquivo de armazenamento por colunas para o cálculo de média.*

Esse é o formato que o Parquet utiliza para armazenar seus dados, e uma de suas principais diferenças como formato de arquivo, tornando-o muito atrativo para armazenar dados que serão utilizados em soluções analíticas. Além de permitir a leitura de dados mais rápida, a necessidade de varrer menos espaços de memória para obter os dados necessários gera uma economia de custos, não só por economizar o consumo de recursos computacionais, mas também pelo fato de várias ferramentas de dados em ambientes de nuvem cobrarem sua utilização a partir da quantidade de dados lidos.

### Compressão

Os arquivos Parquet também geram economias a partir da redução do espaço necessário para armazenamento dos dados, se comparados a outros formatos de arquivos. Isso se deve à utilização de técnicas mais eficientes de compressão, que também se beneficiam da organização colunar dos dados para uma aplicação mais efetiva. Com dados do mesmo tipo próximos uns aos outros, pode-se aplicar compressões de uma maneira mais eficaz, utilizando técnicas que funcionam melhor para o tipo de dado de cada coluna, seja data, inteiro, decimal ou outros. 

### Open Source

Bem, por último, o Parquet é um formato Open Source, o que o torna mais aberto a conexões e integrações com outras ferramentas e plataformas. Diferentemente dos arquivos .xlsx, que só funcionam com o Excel ou ferramentas similares, o Parquet e outras soluções semelhantes vem ganhando a cada dia integrações com diversas plataformas de dados relevantes do mercado. Databricks, Google BigQuery, Amazon Athena e Snowflake são exemplos de ferramentas que suportam nativamente a utilização de arquivos Parquet.

## Isso é tudo, pessoal?

Como deu para perceber, os arquivo Parquet são muito bons no que propõem em termos de performance: Eficiência de leitura, espaço de armazenamento, compatibilidade com outras ferramentas. Mas existem outras questões além do mundo puramente performático que devem ser levadas em conta, especialmente quando se considera o usuário e como ele utiliza os dados. Resistência a falhas, gestão de operações simultâneas, registro de logs para auditorias e recuperação de informações são alguns destes pontos. E como pretendo explorar em um próximo artigo, existem ferramentas que subiram nos ombros do Parquet para atender a estas necessidades.

## Referências

[Parquet File Format: The Complete Guide por Coralogix](https://coralogix.com/blog/parquet-file-format/)

[What is the Parquet File Format? Use Cases & Benefits por Upsolver](https://www.upsolver.com/blog/apache-parquet-why-use#:~:text=Parquet%20files%20are%20composed%20of,the%20amount%20of%20data%20scanned)

---
date: 2025-04-06 19:04:12
layout: post
title: "Delta (e porque eles são ainda melhores que Parquet)"
subtitle:
description:
image: https://i.imgur.com/LZUQJqy.jpeg
optimized_image:
category:
tags: delta acid logs
author: andre-ls
paginate: false
---
Os arquivos Parquet, assim como explorei em um artigo passado, são boas soluções para armazenar dados e acessá-los de maneira eficiente, atendendo assim diversas necessidades do mundo de soluções analíticas. Mas ainda existe algo, que estes arquivos não oferecem, mas que são encontrados aos montes em bancos de dados tradicionais:  Vários mecanismos e garantias de consistência e durabilidade que dão aos seus usuários o conforto de que os seus dados dificilmente serão perdidos ou corrompidos, e de que serão acessados e alterados de maneira consistente. 

E na tentativa de trazer estas funcionalidades (e mais algumas outras) para o armazenamento através de arquivos, surgiram algumas ferramentas que subiram na garupa dos Parquet e outros formatos de arquivo e adicionaram mais capacidades ao mesmo, tornando-os ainda mais robustos. Uma dessas ferramentas, talvez a pioneira nesse aspecto, e o personagem principal deste artigo, é o Delta Lake.

## Delta Lake = Parquet + ???

O Delta Lake é um framework open-source para armazenamento de dados em arquivos que traz uma grande quantidade de vantagens e novas funcionalidades que são ausentes em arquivos puramente Parquet, e ainda mais em arquivos csv os xlsx. A sua documentação oficial cita coisas como transações ACID, Time Travel, gerenciamento de schema e algumas outras usando vários nomes e conceitos um pouco técnicos demais. Vamos dar um passo atrás, começar simples e focar no essencial.

O Delta Lake, na sua essência mais básica possível, consiste na junção de dois tipos de arquivos:

- Arquivos Parquet, responsáveis pelo armazenamento de dados, com todas os seus potenciais para isso.
- Arquivos JSON, onde são armazenados diversos logs sobre as operações realizadas sobre os dados, além de metadados.

![image.png](https://i.imgur.com/CIcmtlp.png)
*Arquivos Parquet e JSON.*

Cada operação realizada em um conjunto de dados gera uma nova versão de cada um destes arquivos. Tanto uma nova versão dos dados é criada, quanto um novo arquivo de logs, contendo informações sobre a última operação realizada. 

![image.png](https://i.imgur.com/ssjnQyd.png)
*Versionamento de Arquivos.*

Os arquivos de logs podem conter várias informações, mas essencialmente, as suas principais envolvem:

- Operação realizada no conjunto de dados.
- Organização das colunas do conjunto de dados (popularmente conhecida como schema).
- Quais arquivos, dentre as várias versões armazenadas, representam a versão atual dos dados.

E os arquivos Parquet, bem…contem os dados, em suas mais diversas versões. É interessante perceber que mesmo uma operação de deleção de registros não apaga arquivos de dados, mas na verdade, acaba criando uma nova versão. 

Mas então, se são dois tipos de arquivos (e não um só) e várias versões, como se dá o processo de leitura e escrita de dados destes arquivos?

## Leitura e Escrita

Basicamente toda leitura inicia consultando os logs contidos no arquivo JSON visando obter duas informações:

- Onde estão os arquivos que representam a versão mais recente dos dados.
- E quais são as colunas e formatos dessa versão.

A partir destas informações, o processo de leitura se direciona ao arquivo especificado e realiza a leitura, como qualquer outro arquivo Parquet. 

![image.png](https://i.imgur.com/TBArvwr.png)
*Processo de Leitura.*

Já a escrita, acontece seguindo o caminho reverso. Primeiro, uma nova versão dos dados é gerada, e se ela for escrita com sucesso, uma nova versão dos logs é construída, fornecendo as informações da nova versão dos dados. 

![image.png](https://i.imgur.com/l1Vg1ff.png)
*Processo de Escrita.*

A princípio, a gestão destes dois tipos de arquivos torna as coisas um pouco mais complexas. Mas  ao mesmo tempo, é a simples junção destes dois arquivos e as informações que eles armazenam que formam a base de pelo menos algumas das funcionalidades que o Delta Lake promete. E nesses cenários, os ganhos superam os custos.

## Transações ACID

Talvez a mais importante característica trazida pelo Delta Lake seja a noção de transações e todas as suas garantias, trazidas na sigla ACID, que significa:

- Atomicidade: Esse termo se refere ao fato de que cada operação ou conjunto de operações  a ser realizada no conjunto de dados é indivisível. De uma maneira menos técnica, a ideia aqui é que ou a operação é concluída totalmente com sucesso ou ela é inteiramente cancelada. Não existe meio termo.
- Consistência: Garante que as operações nos dados sejam feitas de maneira consistente, evitando erros e corrupções que possam comprometer os dados.
- Isolamento: Garante que cada transação seja tratada de forma isolada umas das outras, mesmo em situações onde dois usuários possam estar atuando ao mesmo tempo no mesmo conjunto de dados.
- Durabilidade: Bem, garante que após uma transação ser finalizada, os seus dados sejam gravados no sistema, mesmo em caso de falha do sistema. Basicamente isso.

Novamente, um monte de termos complexos. Vamos tentar mostrar como cada ponto desse é atendido a partir de mais desenhos.

Primeiro Atomicidade. Vimos na seção anterior que qualquer leitura aos dados se inicia com uma consulta aos logs, para então ser direcionada aos devidos arquivos. Considerando isso, podemos concluir que se um determinado arquivo não existe nos logs, ele nunca poderá ser lido por alguém. E é esse o raciocínio utilizado pelo Delta para garantir a Atomicidade: Se ocorrer uma falha durante um processo de alteração dos dados que gere uma nova versão, basta não registrar o novo arquivo gerados nos logs, tornando-o inacessível. 

![image.png](https://i.imgur.com/7aBtqNT.png)
*Atomicidade funcionando, do ponto de vista dos logs.*

Do ponto de vista do usuário, entende-se que todas as operações de um determinado conjunto falharam, e não foram aplicadas aos dados, que é justamente a ideia da atomicidade. Com isso, Atomicidade ✅.

Próximo, Consistência. Esse termo pode se referir a muitas coisas, mas do ponto de vista de dados, o principal é garantir a consistência do Schema. Schema é um termo técnico utilizado para se referenciar basicamente à organização de uma tabela, o que envolve a definição de quais colunas ela contém e quais os tipos dessas colunas (texto, número inteiro, número decimal, data, etc.). As informações sobre o Schema se encontram nos logs do Delta Lake, e garantir a consistência disso se resume a simplesmente garantir que novos dados que sejam adicionados sigam esse padrão de colunas. 

![image.png](https://i.imgur.com/JVRvEnQ.png)
*Consistência de Dados*

E óbvio, se o usuário deseja mudar o Schema de uma tabela, é possível. Basta que ele declare isso nas operações, e o Delta gerencia todo o resto, inclusive atualizando as informações nos logs e garantido assim a consistência das próximas operações com o novo formato criado. Assim, Consistência ✅.

Isolamento. Bem, talvez esse seja o mais complexo de explicar, mas o Delta Lake o resolve de uma maneira até que elegante. O Isolamento garante que dois ou mais usuários podem operar sobre os mesmos dados sem influenciar ou atrapalhar uns aos outros. Cada uma de suas operações é tratada de maneira isolada. E os logs e as várias versões de arquivos existentes ajudam nisso. 

Vamos exemplificar com o simples cenário onde temos dois usuários operando ao mesmo tempo sob o mesmo conjunto de dados, onde um está tentando ler a versão mais atual dos dados, enquanto outro está inserindo novos registros, e consequentemente gerando uma nova versão.

O usuário que está inserindo novos registros inicia o seu processo, criando uma nova versão de arquivos a partir da última versão disponível. Mas como o processo ainda não foi finalizado, a nova versão gerada ainda não foi registrada nos logs. Enquanto isso, o usuário que deseja ler os dados inicia seu processo pela consulta dos logs, procurando saber quais arquivos refletem a versão atual dos dados. E aqui se encontra o principal detalhe: Para quais arquivos, os logs vão direcionar a leitura do usuário? A última versão salva do arquivo ou a nova versão que está sendo escrita pelo outro usuário no mesmo momento?

Seguindo todo o raciocínio explicado até agora, não é muito difícil concluir que os logs apontarão para a última versão salva do arquivo, porque a nova versão que está sendo gerada ainda não foi finalizada e registrada nos logs para leitura. Somente após isso acontecer, novas operações de leitura apontarão para a nova versão gerada.

![image.png](https://i.imgur.com/pQzHtMj.png)
*Isolamento de Operações.*

Dessa forma, como pode ser visto na imagem acima, cada usuário opera em arquivos totalmente diferentes, e com isso, as operações são totalmente isoladas umas das outras. Isolamento ✅.

Por fim, Durabilidade. Este último tópico, na prática, depende muito mais da estrutura onde os dados são armazenados do que do próprio funcionamento interno do Delta Lake. E isso, por sua vez, depende de como o usuário utiliza o Delta Lake, e em qual arquitetura ele se encaixa. Mas, considerando o cenário mais comum encontrado hoje nas corporações, dados são armazenados comumente em sistemas de armazenamento na nuvem, que não só possuem altos níveis de disponibilidade, mas que apresentam vários mecanismos de segurança nos raros casos de falha, garantindo que os dados não sejam corrompidos ou perdidos. E assim garante-se a Durabilidade ✅.

Dessa forma, o Delta Lake garante todas as quatro letras do ACID, e pode-se perceber que os logs e o versionamento de dados atuam em boa parte delas. Mas não é só isso. Essas ferramentas ainda entregam uma outra importante funcionalidade.

## Viagem no Tempo e Evolução

Vimos que o Delta Lake gera várias versões, tanto para os dados como para os logs. E tudo bem, estas versões são importantes para o funcionamento principalmente do Isolamento e da Atomicidade. Mas seria de certa forma um desperdício se os próprios usuários também não pudessem utilizá-las. 

Dessa forma, o Delta permite aos seus usuários “viajar no tempo” e tanto consultar versões antigas dos dados, como também restaurar os dados a versões anteriores quando necessário. 

![image.png](https://i.imgur.com/yUGDEjA.png)
*Viagem no Tempo e consulta à versôes antigas.*

Além disso, todo os arquivos de logs formam um histórico de todas as operações realizadas sob um determinado conjunto de dados, servindo como um prato cheio para diversas aplicações de auditorias.

## E as vantagens continuam…

Nesse artigo, quis focar nas vantagens principais do Delta Lake e em como ele utiliza os seus arquivos e logs para alcançá-las. E só com isso, o texto já ficou um pouco extenso. Mas os benefícios que o Delta Lake traz ainda continuam por uma longa lista: otimização de consultas e organização de arquivos, integração com processos de streaming e validações de qualidade dos dados são alguns, dentre outros, que podem ser encontrados na sua documentação e em outros artigos por aí. 

Também vale a pena mencionar que além do Delta Lake, existem outras ferramentas no mercado que ocupam a mesma prateleira, como o Apache Hudi e o Apache Iceberg, trazendo diversas facilidades e garantias para o armazenamento de dados analíticos em arquivos.

Espero que este artigo não tenha ficado muito longo e difícil de ler, e que possa ajuda alguém 🙂

## Referências

[Delta Lake 101 Part 2: Transaction Log por seeQuality](https://pl.seequality.net/delta-lake-101-part-2-transaction-log/)

[What are ACID guarantees on Databricks? por Databricks](https://docs.databricks.com/aws/en/lakehouse/acid)

[Um guia para propriedades ACID em sistemas de gerenciamento de banco de dados por MongoDB](https://www.mongodb.com/pt-br/resources/basics/databases/acid-transactions#:~:text=transactions%20are%20required.-,ACID%20transactions,the%20event%20of%20unexpected%20errors)

[Databricks Certified Data Engineer Associate - Preparation por Derar Alhussein](https://www.udemy.com/course/databricks-certified-data-engineer-associate/)

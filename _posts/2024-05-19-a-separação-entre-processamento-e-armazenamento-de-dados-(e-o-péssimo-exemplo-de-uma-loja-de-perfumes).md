---
date: 2024-05-19 13:39:55
layout: post
title: "A Separação entre Processamento e Armazenamento de Dados (E o péssimo exemplo de uma Loja de Perfumes)"
subtitle:
description:
image: https://i.imgur.com/UwkglZc.jpg
optimized_image:
category:
tags: bigdata objectstorage cloud
author: andre-ls
paginate: false
---
No último artigo que escrevi, falei brevemente sobre alguns motivos pelos quais os elementos básicos do Hadoop (MapReduce e HDFS) perderam espaço no mercado para outras ferramentas. E lá eu citei brevemente que um dos motivos pelo qual o HDFS, o sistema de armazenamento utilizado pelo Hadoop, perdeu a sua liderança no mercado foi devido às atuais tendências de separação entre computação e armazenamento. Bem, devido à falta de um bom exemplo para explicar isso enquanto escrevia o último artigo, bem como visando não deixá-lo muito longo, neste artigo trago este tópico (que é bem interessante) de uma maneira mais detalhada. 

## Primeiro, o Básico

Quando analisamos uma ferramenta, especialmente uma que reinou em épocas passadas, é sempre interessante observá-la considerando o contexto em que ela foi criada. Isso muitas vezes leva a decisões de arquitetura ou coisas do tipo que hoje, já não fazem mais tanto sentido assim.

Primeiro, uma realidade meio óbvia, mas tudo bem: Para processar dados, precisamos tirá-los de onde eles estão armazenados, e levá-los ao processador de alguma máquina, que irá, bem, processá-los. 

![Movimentação Dos Dados](https://i.imgur.com/fspAfTg.png)

Para realizar essa movimentação, os dados precisam passar por algum caminho. E essa caminho obviamente depende de onde os dados se encontram inicialmente. Se os dados estão armazenados no HD ou SSD do seu computador, eles só precisam passar pelos barramentos que vão até o processador. Se os dados estão em um pen drive (alguém aí ainda sabe o que são pen drives?) eles precisam passar pela porta de USB do seu computador até chegar no processador. E se os dados estão armazenados em alguma nuvem por aí, eles precisam passar por vários locais da internet até chegar no seu computador para aí sim serem processados.  Perceba que são distâncias diferentes, mas não é só isso. É também uma questão de velocidade. Mover gigabytes de dados que já estão no seu computador é bem mais rápido do que baixá-los da internet. E como estamos falando de Hadoop, estamos falando também de uma quantidade meio enorme de dados: Terabytes, Petabytes talvez. Para processar esses caras, a velocidade vira um fator bem crítico.

## Era Hadoop

Bem, aqui entra o contexto histórico. Quando o Hadoop foi concebido, dois recursos amplamente disponíveis hoje não eram lá tão acessíveis na época:

- Primeiro, armazenamento. Dispositivos de armazenamento como HDs e SSDs não eram tão acessíveis, nem possuíam a capacidade que tem hoje.
- Segundo, internet em alta velocidade disponível para qualquer um, e nem tão pouco o fantástico mundo das plataformas de nuvem.

Como o Hadoop superou isso? Bem, para o primeiro ponto, ele propôs um armazenamento distribuído, onde grandes quantidades de dados eram divididos entre várias máquinas que formavam um cluster. E para o segundo ponto, ele propôs que os dados fossem armazenados exatamente na mesma máquina em que eles seriam processados, evitando assim que eles passassem pela Internet, o que seria algo demorado na época.

Mas as coisas mudam, ainda mais quando se fala em tecnologia…

## A Separação

Bem, cortamos para alguns anos à frente. Hardware é algo mais barato. Internet, bem mais rápida, com serviços de streaming em todos os lugares e transferências bancárias em segundos. E com as plataformas de nuvem por aí, qualquer um pode criar um servidor em alguns minutos e armazenar grandes quantidades de dados por alguns poucos dólares por mês.

É nesse cenário que surgiu uma tendência de ir na contramão do que o Hadoop pregou, e separar Computação e Armazenamento em dois sistemas diferentes. 

![Fonte: LinkedIn, 2020.](https://i.imgur.com/GBXhdgE.png)
*Fonte: LinkedIn, 2020.*

Mas então, qual são as vantagens dessa mudança? 

A maior vantagem acima de tudo, é a  facilidade de escalabilidade do sistema. Mas primeiro, precisamos entender o que é escalabilidade. 

### Escalabilidade

Boa parte das aplicações hoje em dia são executadas em sistemas distribuídos, que consistem basicamente em um conjunto de computadores que dividem a execução de uma ou mais tarefas. Além da óbvia vantagem em velocidade, uma grande vantagem destes sistemas é a escalabilidade, que é inclusive altamente disponível nos ambientes de nuvem hoje em dia.

Escalabilidade é nada mais do que a capacidade de aumentar ou diminuir o poder computacional de um sistema conforme a sua demanda. Dessa forma, o sistema ganha mais recursos em períodos de alto uso, e reduz seus recursos em períodos mais ociosos. Ao mesmo tempo, isso garante a disponibilidade do sistema para os seus usuários em qualquer momento do dia, e reduz custos para quem mantém o sistema já que ela não precisa manter uma grande quantidade de recursos ligados 24 horas por dia e 7 dias por semana. E como um sistema distribuído é composto por vários computadores, a maneira mais fácil de escalá-los é obviamente colocando mais ou menos computadores no sistema,.

Certo, entendido isso, o que separar processamento e armazenamento tem a ver com escalabilidade? Essa é a parte um pouco mais difícil de explicar, e para isso, eu resolvi trazer a analogia mais simples que consegui pensar (Espero que faça sentido).

### A Loja de Perfumes

Bem, eu não se isso ainda é comum, mas a alguns anos atrás algumas fabricantes de perfumes e cosméticos promoviam um sistema de revendedores, onde elas entregavam uma quantidade de produtos para alguns vendedores, e estes saiam vendendo estes produtos de porta em porta. Então, acho que as coisas não funcionavam bem assim, mas vamos criar uma situação hipotética em cima desse contexto.

Imagine que você criou a sua própria linha de perfumes e passou a vendê-los na vizinhança. Rapidamente, o seu produto ganhou uma popularidade, passando a interessar pessoas de outros bairros. Estas pessoas queriam comprar o seu produto, mas muitas vezes, devido à distância, não queriam se mover até onde você mora para comprar os seus produtos. Percebendo o problema, você contratou alguns revendedores para vender o seu produto em outros bairros. Assim, toda segunda-feira, você passou a reunir os revendedores em sua casa para distribuir entre eles o estoque de produtos a serem vendidos ao longo da semana. Cada produto tem agora um “dono”, um vendedor associado, que o levará na sua bolsa onde quer que esteja e deverá vendê-lo para alguém.

![Revendedores da Loja de Perfumes](https://i.imgur.com/YTwWaKY.png)

A estratégia deu muito certo. As vendas aumentaram bastante. A popularidade do produto também cresceu muito. E com isso, novas demandas pelo produto surgiram em mais bairros, e você precisou contratar mais revendedores. Entretanto, aqui surgiu um problema.

Como o estoque era totalmente distribuído entre os vendedores para que não faltasse produto para ninguém, toda vez que um novo vendedor chegava e precisava receber os seus produtos, todos os revendedores precisavam parar com as suas vendas, se reunir novamente para redistribuir o estoque novamente e entregar alguns de seus produtos para o novo vendedor. Isso, além de custar mais deslocamento para os vendedores, também custava tempo, já que eles paravam de vender para fazer esse processo. 

![Redistribuição de Estoque](https://i.imgur.com/rLejevU.png)

Como resolver esse problema? A solução encontrada foi a de mudar o sistema de vendas. Vamos sair de um sistema de revendedores para um sistema de lojas físicas. Além das inúmeras vantagens que esse sistema pode trazer (que bem, não cabe a mim falar sobre), ele resolve o nosso problema da distribuição de produtos por vendedores, mudando totalmente a disposição dos produtos.

Agora, os vendedores não carregam mais os produtos, mas simplesmente os buscam nas prateleiras das lojas. E o mais importante, cada vendedor não detém mais os produtos, mas sim apenas a responsabilidade por uma parte deles no estoque da loja. Por exemplo, o vendedor 1 pode ser responsabilizado pelos perfumes femininos, o vendedor 2 pelos perfumes masculinos, o vendedor 3 pelos infantis, e assim por diante.

![Loja de Perfumes](https://i.imgur.com/mzedKoa.png)

Assim, com os vendedores detendo apenas responsabilidades, fica mais fácil de gerenciar a adição de um novo vendedor, onde apenas as responsabilidades precisam ser mudadas e não o local dos produtos. E convenhamos, mudar responsabilidades é bem mais fácil.

![Novo Vendedor na Loja de Perfumes](https://i.imgur.com/m1np6zT.png)

### Vantagens para um Sistema Distribuído

Vamos voltar agora para sistemas de computadores distribuídos. Eu sei que o exemplo não foi lá tão realista, mas eu espero que tenha sido útil para entender a ideia, que por sinal é bem similar no mundo dos computadores. 

Antes de separar o processamento e o armazenamento dos dados, cada alteração na quantidade de máquinas de um cluster, seja para aumentar ou diminuir, necessitava de uma redistribuição dos dados, que além de ser um processo custoso em recursos computacionais, também requisitava um grande fluxo de dados através da internet, que como falamos, não era um recurso tão disponível na época.

Com a mudança trazida por esse novo paradigma, os dados passaram a ser armazenados em um sistema central, de onde os computadores de um cluster os extraem para o processamento. E assim como os perfumes nas prateleiras, os dados não estão mais juntos aos nós, mas sim em um sistema de armazenamento externo, e o nó apenas sabe onde os seus dados estão dentro desse sistema. 

![Escalabilidade em um Sistema Distribuído](https://i.imgur.com/WDUkfyH.png)

Se um novo nó for adicionado ou removido do sistema, apenas a atribuição de quem vai processar quais dados precisa ser reorganizada, e os dados não precisam ser movidos entre os nós. Todos eles se encontram em um mesmo lugar que cada nó consulta para retirar a sua parte responsável.

> Os nós não são mais donos dos dados, apenas responsáveis por eles. Dessa forma, fica bem mais fácil adicionar ou remover nós do cluster. Apenas responsabilidades mudam.

Além disso, trabalhar apenas com responsabilidades tem outra vantagem: Caso um nó falhe no sistema, os dados não são perdidos. Eles continuam armazenados no sistema de armazenamento, e o acesso aos dados responsabilizados pelo nó perdido podem ser rapidamente supridos por outro nó do sistema.

E por último, ainda há a vantagem de que, utilizando-se um sistema de armazenamento de dados externo, os custos podem ser menores através de duas formas. Primeiro, e mais óbvio, utilizando uma solução de armazenamento mais barata, já que com a separação do armazenamento abre-se uma gama de novas opções de ferramentas que podem ser utilizadas, e dentre elas diferentes custos podem ser encontrados.E segundo, já que os nós não são mais responsáveis por armazenar os dados, podemos simplesmente desligá-los quando não estiverem sendo usados para processamento, economizando o seu uso.

## Conclusão

Mesmo com a progressão de velocidades da internet, é importante perceber que esse paradigma de separação dificilmente será mais performático do que manter os dados e o processamento juntos, assim como proposto pelo Hadoop. No entanto, as diversas vantagens de custo, escalabilidade, e outras mais não citadas aqui, parecem ter superado esse pequeno desvio de rota, e centralizar os dados parece ser algo que veio para ficar.

Mas, se mesmo o Hadoop que foi uma tecnologia disruptiva mudou tanto em tão pouco tempo, quem sabe onde estaremos armazenando dados daqui a alguns anos, não é mesmo?

---
date: 2024-07-07 19:49:37
layout: post
title: "Como eu explicaria Machine Learning para uma criança de 7 anos e meio"
subtitle:
description:
image: https://i.imgur.com/05xB47g.png
optimized_image:
category:
tags:
author: andre-ls
paginate: false
---
Este artigo é, de certa forma, uma prática. Talvez ele possa servir para alguém, mas no fundo é só uma prática de uma habilidade necessária: Em meio a tanta coisa complexa disponível, às vezes precisamos pensar simples. 

Seguindo a ideia de falar um pouco sobre Inteligência Artificial, o objetivo deste artigo é explicar como Machine Learning funciona para uma criança com especificamente 7 anos e meio de idade (não me pergunte por que 7 anos e meio, eu também não sei). Apesar dos exemplos infantis, espero que possa ajudar mais alguém além de crianças. Afinal, eu não conheço nenhuma criança que lê os meus artigos.

## Criando um Contexto
Bem, uma grande verdade é que o Machine Learning é uma bela simulação do aprendizado humano aplicado na resolução de problemas. Logo, faz bastante sentido colocar esses domínios lado a lado e comparar como ambos agem para resolver um problema. E considerando o nosso público (fictício) de crianças, vamos utilizar como ambiente para criar um exemplo o lugar onde hoje elas aplicam bastante suas capacidades de aprenderem algo: ~~A escola~~ Fortnite.

![Fortnite](https://i.imgur.com/VwEvZHm.jpeg)
*Fonte: Fortnite*

Fortnite é um jogo de popularmente jogado em uma modalidade conhecida como battle royale, onde vários jogadores se enfrentam em um cenário gigante até que reste apenas um único time ou jogador sobrevivente. No caso do Fortnite, cada partida incluem 100 jogadores, jogando sozinhos ou formando times. 

Os jogadores iniciam a partida dentro de uma aeronave, que sobrevoa o mapa segundo um trajeto, ao longo do qual, a qualquer momento, os jogadores podem pular de paraquedas para o cenário. Ao escolher um determinado instante para pular, os jogadores podem esperar um momento mais adequado para alcançar uma parte específica do mapa em um tempo menor. 

O cenário é composto por diversas construções, dentro das quais, aleatoriamente, os jogadores podem encontrar armas e munições que utilizarão para eliminar os oponentes e sobreviver. 

Além disso, os jogadores podem coletar materiais, como madeira e pedras que podem ser utilizados para a construção de estruturas, como paredes, pisos, rampas e telhados, que podem ser utilizados criativamente pelos jogadores durante a partida. 

E o objetivo disso tudo, como já citado, é eliminar os demais jogadores e ser o último sobrevivente. Para incentivar o combate, e levar ao fim da partida, as áreas que os jogadores podem transitar no cenário vão diminuindo ao longo do tempo a partir do surgimento de uma nuvem roxa que elimina jogadores que permanecerem nela por muito tempo. Assim os jogadores vão sendo jogados uns aos outros, até sobrar uma área muito pequena, onde o combate é inevitável.

![Area Shrink](https://i.imgur.com/jpEdPJl.png)
*Fonte: Fortnite Wiki*

Tudo bem, já chega de regras. Vamos tentar aprender alguma coisa com isso.

## Por trás do Aprendizado
Vamos tentar entrar na mente de um jogador completamente novo a este jogo. No máximo ele deve ter visto alguém jogando por aí, mas é sua primeira vez de fato jogando uma partida. 

De uma maneira simplificada (porque nosso cérebro é bem mais complexo do que isso), vamos supor que a cada nova partida, o jogador possui um modelo, ou melhor, uma estratégia a seguir. O nosso jogador inexperiente inicia com uma ideia muito simples.

![Primeira Estratégia do Jogador](https://i.imgur.com/4E6xFDb.png)

Essa é a sua simples (e ingênua) estratégia para ganhar uma partida. Apesar de simples, o nosso jogador está confiante, afinal se tanta criança joga esse jogo, ele não deve ser tão difícil assim.

Bem, acontece que 10 segundos depois de pousar no meio de uma rua, o nosso jogador não consegue encontrar nenhuma arma, e dá de cara com um oponente bem armado, que o elimina em um piscar de olhos. Fim da primeira partida.

Claramente a estratégia não funcionou. Algo dela deu errado. O jogador para um segundo para refletir e percebe que o problema principal é que ele pousou em um lugar improvável de encontrar armas de maneira rápida. Além disso, ele foi para um local em que muitos jogadores também pousaram, aumentando a chance de entrar em um combate despreparado com algum oponente mais experiente. Logo, ele faz algumas alterações e monta uma nova estratégia com base no seu último resultado.

![Nova Estratégia do Jogador](https://i.imgur.com/3mrD35V.png)

Ok. Segunda Partida. O nosso jogador segue a estratégia e consegue sobreviver além dos 10 segundos. Ele consegue encontrar uma pistola e uma espingarda. Não há nenhum oponente próximo, mas há uma cidade um pouco mais ao norte, de onde escuta-se alguns disparos. Certamente deve haver oponentes por lá. Ao longo do caminho até a cidade, o jogador avista, de longe, um oponente em cima de um prédio, virado de costas, mirando em algum lugar. E daquele lugar mesmo, ainda distante, o nosso jogador saca uma pistola e começa a atirar no oponente. O oponente, entretanto, percebendo alguns tiros vindo pelas suas costas, se vira para procurar o autor dos disparos, e revela estar portando uma bela sniper, perfeita para abates em longo alcance. E com dois disparos dessa potente arma, o nosso jogador foi eliminado, mais uma vez. Fim da segunda partida. 

Bem, hora de repensar o plano novamente. A primeira alteração feita parece ter sido positiva, afinal, o jogador sobreviveu por mais tempo. Mas adiante disso, tem algo errado. Ao pesquisar um pouco e assistir outros jogadores, ele descobre que cada tipo de arma possui um cenário de uso mais adequado com base em algumas de suas características. Espingardas, por exemplo, possuem uma precisão muito baixa, mas causam uma grande quantidade de dano em pequenas distâncias, o que as faz ser uma ótima escolha para enfrentar inimigos muito próximos. Snipers possuem uma alta precisão e uma grande quantidade de dano, mesmo em grandes distâncias, mas elas demoram muito para recarregar e são péssimas para um combate próximo, onde agilidade é algo importante. E por aí vai.

![Um belo tiro de Sniper.](https://i.imgur.com/ekxdBe7.gif)
*Um belo tiro de Sniper.*

Percebendo isso, o nosso jogador percebeu que utilizou a pistola em uma situação bem desfavorável. Provavelmente ele deveria ter utilizado outra arma mais adequada, ou talvez, se aproximado mais do inimigo antes de tentar algo. Com base nisso, mais um refinamento aconteceu em sua estratégia.

![Mais uma versão da estratégia do jogador](https://i.imgur.com/cV2Lku7.png)

E assim o jogador segue, em um ciclo de partidas e refinamentos da estratégia, buscando sempre identificar padrões que, quando usados, podem aumentar a sua chance de vitória. Estratégias de movimentação, construção de bases, melhorias na mira. A cada partida, novos refinamentos vão sendo feitos, até se criar uma estratégia muito eficaz.

![Estratégia Final](https://i.imgur.com/iK6siqA.png)

E com uma estratégia eficaz, enfim as vitórias acontecem.

![Enfim uma vitória](https://i.imgur.com/U4XFjLs.gif)
*Enfim uma vitória.*

## Traduzindo para Máquinas

Ok, finalizado o exemplo meio patético, como podemos trazer esse processo de aprendizado para as máquinas? 

Vamos criar um outro exemplo agora. Só que dessa vez, o nosso jogador é um computador. 

Assim, como o nosso jogador humano, o computador não sabe muita coisa sobre o jogo no início, e ele também precisa criar uma estratégia eficaz para vencer o jogo. Ele poderia passar pelo mesmo processo de perder várias partidas e usar seu poder criativo para ajustar sua estratégia até vencer. O problema é que computadores não são lá tão criativos, mas eles são bons em uma outra coisa: Processar uma grande quantidade de informações ao mesmo tempo.

Então considerando isso, podemos seguir um atalho. Ao invés de fazer o computador passar por todo o longo processo de criar uma estratégia, que tal seguir o caminho alternativo apresentado a seguir?

- Coletamos várias informações de partidas dos jogadores mais experientes do Fortnite, como por exemplo onde ele pousou, que armas usou, que trajeto ele percorreu, que materiais ele coletou, de que distância ele abateu inimigos e muitas outras coisas.
- Fornecemos esse conjunto de informações para o computador, indicando quais partidas  foram vencidas e quais foram perdidas pelo jogador analisado.
- O computador processa estas informações, buscando identificar os padrões mais frequentes no comportamento dos jogadores em partidas vencidas.
- A partir da combinação destes padrões, o computador cria a sua própria estratégia.

![Estratégia do Computador](https://i.imgur.com/YVRb6dI.png)

Bem, é isso: Esse processo é o Machine Learning. 

Sua ideia, [assim como visto no artigo passado](https://andre-ls.github.io/nebula/intelig%C3%AAncia-em-m%C3%A1quinas/), nada mais é do que a de tentar criar uma solução para um problema muito complicado utilizando como atalho uma grande quantidade de dados já existentes sobre esse problema. Com os dados, o computador consegue identificar padrões que levam ao resultado desejado, e os utiliza para compor sua solução final, que depois de construída pode ser utilizada em novas situações do problema resolvido. 

Apesar desse pequeno atalho, como dito no começo desse artigo, o processo de aprendizado da máquina a partir dos dados é bem parecido com a forma como o nosso primeiro jogador aprendeu sobre o jogo.

Para construir uma lógica efetiva, o computador passa por um processo chamado de Treinamento, onde ele varre o conjunto de dados de dados várias vezes, assim como o jogador jogou várias partidas. A cada passagem pelos dados, o computador aplica sua estratégia em um conjunto de dados conhecidos, e compara os resultados que ele obteve com os resultados esperados, calculando assim sua performance. É como se o computador jogasse várias vezes partidas passadas, que já aconteceram. E assim como o jogador humano, a cada fim de partida, o computador checa a sua performance, comparando com o resultado esperado, e faz alterações na sua estratégia, baseadas nos padrões presentes nos dados, buscando reduzir o seu erro e chegar de maneira mais precisa no resultado desejado. 

![Processo de Treinamento](https://i.imgur.com/LHv8xsl.png)

Até que após várias passagens, o computador enfim cria uma estratégia eficiente que pode ser aplicada a qualquer partida futura. 

## Conclusão (por agora)
No fim, o aprendizado, seja por um humano, ou pela máquina, segue um processo parecido de tentativas, erros e otimizações até chegar num bom resultado. A diferença está na forma como cada um faz isso. Enquanto o humano usa a sua criatividade, o computador usa uma grande quantidade de dados e vários cálculos matemáticos que estão por trás do funcionamento real de uma solução de Machine Learning (e que estão além da ideia desse artigo). 

No papel, propor uma solução de Machine Learning parece fácil, mas construir uma solução efetiva é algo bastante desafiador. E esse desafio já começa, como talvez tenha sido possível perceber no exemplo, na obtenção de uma grande quantidade de dados relevantes para a construção de uma lógica. A Engenharia de Dados existe, em parte, para resolver isso, e no próximo artigo, pretendo explorar como fornecer os dados que alimentam essas tecnologias.

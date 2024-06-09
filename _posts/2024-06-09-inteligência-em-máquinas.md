---
date: 2024-06-09 20:21:49
layout: post
title: "Inteligência.Em Máquinas."
subtitle:
description:
image: https://i.imgur.com/yRAALVi.png
optimized_image:
category:
tags: ia machinelearning
author: andre-ls
paginate: false
---
Inteligência Artificial e Machine Learning são conceitos que viraram moda nos últimos anos e um novo normal nos dias de hoje. Apesar da sua popularidade, existe uma certa confusão sobre eles, e muitas vezes, são tidos como a mesma coisa.

Bem eu poderia simplesmente explicar a diferença entre os dois em alguns poucos parágrafos e dar tchau, mas prefiro seguir um caminho mais longo, e diferente. Até porque já existem muitos artigos sobre esse tema por aí, e seguir o mesmo caminho que eles seria um pouco redundante.

## Domínio da Lógica
Se pararmos para pensar, de uma maneira bem elementar, toda solução criada através de um programa de computador pode ser resumida a um conjunto de entradas, uma ou mais saídas, e um conjunto de lógicas, que transformam entradas em saídas. Um corretor ortográfico recebe como entrada um texto, e gera como saída sugestões de correção. Um aplicação de GPS recebe como entrada a origem e o destino e gera uma rota como saída. Um videogame recebe um comando do teclado ou do controle, e move o personagem conforme o botão apertado.

![Untitled](https://i.imgur.com/nnmDqA9.png)

Por muito tempo, a única maneira de se criar a lógica que define um programa foi utilizando o cérebro. O programador, entendendo as entradas disponíveis e as saídas desejadas, utilizava o seu raciocínio para criar um conjunto de regras rígidas que definem o comportamento do programa, e a receita para obter os resultados desejados para diversas possibilidades de entrada. 

![Untitled](https://i.imgur.com/tCDIJHz.png)

Hora de um exemplo bem básico. Imagine um sistema responsável por fazer a transferência bancária entre duas contas de um banco. Se o pensarmos de uma maneira bem simples (bem simples mesmo), ele teria como entradas as contas bancárias de origem e destino e o valor a ser transferido, e como saída apenas dois status, indicando se a operação foi um sucesso ou uma falha. E no meio de tudo isso, está a lógica que o programador precisa construir. 

![Untitled](https://i.imgur.com/uEuaDD8.png)

Com base na entrada, definir se uma operação será um sucesso ou não, depende de algumas regras. No nosso mundo simplificado, para uma operação ser um sucesso, as contas de origem e destino precisam existir, e a conta de origem precisa possui o valor a ser transferido. Então, a partir disso o programador cria um código que reflete essa lógica.

![Untitled](https://i.imgur.com/Vu66cmH.png)

Essa forma de desenvolvimento permitiu muitas coisas. Permitiu que computadores resolvessem equações matemáticas, das mais simples às mais complexas. Permitiu que um computador vencesse o campeão mundial de xadrez. Permitiu criar videogames e simulações cada vez mais realistas. Permitiu ao homem pisar na lua. 

E de nenhuma maneira ela é uma forma antiga de se programar. Hoje, diversas soluções são construídas utilizando esta metodologia. Sistemas bancários, aplicativos móveis, redes sociais. Todos são baseados em lógica derivada da criatividade e raciocínio humanos.

## Deixem as Máquinas Fazerem o Trabalho
Entretanto, percebeu-se com o tempo que existiam alguns problemas de muito valor, que apesar de serem facilmente resolvidos pelos nossos cérebros, eram muito complexos de serem traduzidos para uma lógica dentro de um programa de computador, por um motivo muito simples: São problemas para os quais existem uma variação muito grande de casos para serem modelados de uma maneira viável por regras rígidas. 

Por exemplo, imagine que você trabalhe em uma startup que deseja criar um sistema próprio de piloto automático para carros, e você precisa implementar um módulo responsável por reconhecer placas de trânsito a partir de visão computacional. Ou seja, voltando para o esquema de entradas, lógicas e saídas, as entradas desse sistema são imagens de placas, e a saída é a identificação da placa, se é que a imagem representa uma placa de trânsito. 

![Untitled](https://i.imgur.com/ve1sVMp.png)

Construir a lógica desse problema entretanto, é um desafio. Até que algumas regras podem ser derivadas, como por exemplo:

- Placas de Pare possuem a cor vermelha.
- Placas de Pare possuem formato hexagonal.
- Placas de Pedestre possuem uma cor de fundo amarela.
- Placas de Pedestre possuem um formato de losango.

Mas existem muitas variações a serem consideradas. E se a imagem estiver em um ângulo diferente? E se a imagem for obtida de noite e não de dia? E se a placa estiver suja, e parte da palavra “PARE” não estiver visível? E se a placa estiver quebrada, com um pedaço faltando?

Existem muitos padrões para se considerar, ao ponto de torna-se inviável criar uma regra para resolver cada caso. Isso acontece por um motivo muito característico da nossa realidade: Diferente de um sistema de transações bancárias, onde cada conta bancária é bem definida por um conjunto de informações,o nosso mundo é muito bagunçado. A mesma informação pode ser apresentada de muitas formas, contextos e situações diferentes. Uma placa de Pare de frente ou de cabeça para baixo, bem iluminada ou no escuro, limpa ou suja ainda é uma placa de Pare. Como criar uma lógica que funcione para todos esses casos?

Bem, ao invés de definirmos toda a lógica e passarmos para o código simplesmente reproduzi-la em um computador, que tal deixarmos as próprias máquinas definirem a lógica? Para ajudá-las, vamos passar diversos dados sobre as entradas e saídas esperadas, envolvendo as mais diversas variações de cenários, e deixá-las elas mesmos chegarem à conclusão de qual lógica utilizar. Em outras palavras, vamos deixar as máquinas **aprenderem** os diversos padrões que ligam as entradas às saidas.

![Untitled](https://i.imgur.com/8j7FJEC.png)

Bem, essa é a ideia por trás do tal conceito de Machine Learning.

## Inteligência ou Aprendizado?
Mas se isso é Machine Learning, o que é então a Inteligência Artificial? Acho que existe uma certa mistura com relação ao uso desses dois termos, e em algumas situações eles são usados com o mesmo significado. Mas no papel, são duas coisas diferentes.

- A Inteligência Artificial é um guarda-chuva que envolve qualquer tecnologia relacionada a computadores imitando a inteligência humana. Pode não parecer, mas soluções desde um corretor gramatical ou um aplicativo de GPS até um programa para reconhecer placas de trânsito estão incluídas nesse grupo. Todos eles simulam um comportamento humano, seja corrigir um texto, pensar em uma forma de chegar em um lugar, ou reconhecer placas.
- Machine Learning é um subconjunto de tecnologias de Inteligência Artificial que onde as máquinas simulam a inteligência humana utilizando um processo semelhante ao apresentado na seção anterior, onde a lógica é aprendida pela própria máquina.

Conectando tudo, a Inteligência Artificial pode incluir em sua definição tanto soluções em que a lógica é desenvolvida externamente por um programador, quanto soluções onde a própria máquina aprende sobre o problema e cria a lógica. O conceito de Machine Learning, entretanto, envolve apenas este último grupo, onde as máquinas realmente aprendem com base nos dados e seus padrões.

É uma maneira diferente (dentre as várias possíveis, afinal nosso mundo é bagunçado) de entender um pouco sobre esses conceitos, e exatamente onde eles se encaixam na criação de uma solução. 

## Referências
[Machine Learning in the Cloud por Google](https://www.youtube.com/watch?v=cYsQ0vVjdSQ)

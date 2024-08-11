---
date: 2024-08-11 19:29:01
layout: post
title: "O que o ChatGPT come no café da manhã?"
subtitle:
description:
image: https://i.imgur.com/cDfTWCt.png
optimized_image:
category:
tags: llm chatgpt data
author: andre-ls
paginate: false
---
## Introdução
Bem, retomando os estudos sobre Machine Learning do ponto de vista de recursos de dados necessários para o seu funcionamento, é bastante natural buscar entender a família de modelos mais em alta no momento em que escrevo este artigo: Os Large Language Models (LLMs), trazidos em grande relevância pelo desenvolvimento de várias soluções, mas principalmente pela ascensão do ChatGPT. 

Pela facilidade de uso, e possibilidade de aplicação nas mais diversas atividades buscando aumentar a produtividade dos seus usuários (e o seu grande hype), é natural ver diversas empresas e organizações buscando criar suas próprias soluções a partir destas tecnologias. 

O problema é que construir essas soluções do zero é um processo muito custoso, e o objetivo deste artigo é entender o porquê. 

## Um Escritor de Probabilidades
Antes de começar, é importante lembrar a ideia geral do aprendizado de modelos de Machine Learning, assim como apresentado nos últimos artigos. Os modelos aprendem criando relações e associações entre um grande conjunto de dados de entrada e as suas saídas esperadas. Considerando esse padrão, quais são as entradas e as saídas utilizadas por um modelo como o ChatGPT?

Bem, a ideia principal destes modelos é simplesmente completar frases. Ou seja, a entrada destes modelos é uma sentença incompleta e a saída é a próxima palavra mais provável da sentença. 

![Completing Words](https://i.imgur.com/Av8gCsW.png)

De certa forma, esses modelos funcionam como o corretor de texto presentes nos celulares, buscando sugerir palavras com base no contexto em que se encontram. A diferença aqui é que os modelos de linguagem consideram um contexto muito maior do que os simples corretores de texto, levando a uma escolha mais assertiva de palavras. 

Como exemplo, podemos considerar a frase presente na imagem acima: “Ele chutou a bola no ___”. Se considerarmos o contexto presente apenas nessa frase, existem várias palavras possíveis de serem utilizadas como próximo elemento. “Gol”, “ar”, “chão”, “campo” e “ângulo” são algumas palavras que consigo pensar agora. Mas e se expandirmos o contexto, considerando frases anteriores a essa? Agora teríamos:

> “O jogo estava difícil. O time adversário vencia por 1 gol, e dominava a posse de bola. Mas depois que ele entrou, o clima do jogo mudou. Com uma jogada inteligente, e algumas trocas de passes, facilmente o time alcançou a área do adversário. Ele chutou a bola no ___”.
> 

Se considerarmos esse contexto, as probabilidades ficam muito mais assertivas, e muito provavelmente a palavra “gol” parece ser a mais adequada para preencher o campo desejado. 

E é assim que esses modelos alcançam uma melhor performance. E de cara isso já traz duas importantes consequências que afetam diretamente o custo destas soluções.

- Para construir uma solução destas capaz de criar textos para vários assuntos e temas diferentes, uma grande quantidade de dados, da ordem de terabytes de textos, precisam ser utilizados para o treinamento do modelo. O ChatGPT, por exemplo, foi treinado em torno de 570 GB de dados. Se parecer pouco, a Wikipedia inteira consiste em algo em torno de 32 GB.
- O fato de uma grande contexto de palavras precisar ser utilizado para a geração da próxima palavra, um poder computacional razoável pode ser necessário para a execução destes modelos. Utilizando o ChatGPT como exemplo novamente, precisou-se de um super computador com 10000 placas de vídeo para treinar o modelo, além de que se estima que uma consulta ao ChatGPT possui um custo de energia elétrica 15% maior do que uma consulta ao Google.

Bem, só considerando isso, o custo de criar uma solução destas já parece algo bastante inalcançável. Mas não é só isso. Apesar de parecer fazer bastante sentido no papel, estes modelos inteiramente baseados em probabilidades não possuem uma noção muito clara do sentido da frase que estão construindo, e muitas vezes, apesar de criarem sentenças semanticamente corretas, elas não necessariamente acabam sendo satisfatórias para os seus usuários. 

Então, aqui entra outro fator: Além de considerar apenas probabilidades, as soluções precisam considerar a relevância das respostas geradas.

## Obtendo Respostas Mais Interessantes
![Interesting Answers](https://i.imgur.com/5oiIxc6.png)
*Fonte: Freepik.*

Para conseguir gerar respostas mais interessantes e relevantes para as consultas feitas pelos usuários,  o modelo precisa ser capaz de avaliar as diferentes respostas possíveis de serem geradas, e escolher dentre elas, a que ele acredita ter maior relevância. 

Mas como trazer essa noção de relevância das respostas para o modelo? Bem, só há um jeito aparente: Trazer a opinião pessoal de usuários para dentro do modelo. Nesse ponto, o esquema interno do funcionamento de modelos como o ChatGPT torna-se bastante técnico, e portanto, vou evitar me aprofundar aqui. Já tem bastante material por aí, de pessoas bem mais capacitadas do que eu, explicando esse processo.

Mas o importante aqui é entender que, em algum momento do processo de construção da solução, as respostas geradas precisam passar por uma certa intervenção humana. Dentro do processo de treinamento do ChatGPT, isso aconteceu de duas formas:

- Para algumas consultas pre-determinadas, humanos foram acionados para gerar uma resposta que eles consideram satisfatória, a partir das quais a solução final pode aprender padrões que indicavam respostas mais interessantes para o usuário.
- Em um outro momento, humanos receberam diferentes respostas para determinadas consultas e foram responsáveis por atribuir uma pontuação de relevância para cada um dos resultados gerados. Essa pontuação permite ao modelo aprender a selecionar, dentre as possíveis respostas que ele gera, aquela que apresenta a melhor pontuação de significância.

E aqui mais custos. E o mais complexo desses custos é que atividades manuais, realizadas por humanos, possuem uma escalabilidade muito menor do que atividades totalmente automatizadas realizadas por computadores. Logo, fazer com várias pessoas gerem milhares de respostas desejadas e avaliem vários resultados de modelos não só gera muito trabalho, mas também é muito custoso financeiramente e torna a viabilidade de construção de um modelo ainda mais inacessível para diversas organizações.

## O que tem nesse Café?
Então, resumindo, o que é necessário para criar um modelo de linguagem como o grande sucesso da OpenAI?

- Primeiro, um grande volume de textos para treinar o modelo. Podem incluir textos de uma grande variedade de assuntos, caso se deseje criar um modelo genérico, ou textos de um domínio específico no caso de criação de um modelo especializado em um determinado tema.
- Depois disso, uma grande quantidade de recursos computacionais, com uma quantidade enorme de processadores, placas de vídeo e conexões à internet com altíssima velocidade.
- Uma grande quantidade de energia elétrica para alimentar os computadores.
- Vários avaliadores para realizar em uma intervenção humana na construção de respostas do modelo.
- E, intrínseco a tudo isso, uma grande expertise de Engenheiros e Cientista de Dados para viabilizar a construção e treinamento da solução efetivamente.

É bastante coisa. E realmente parece envolver o esforço do tamanho de uma empresa inteira. Mas não é o fim do mundo, porque existe uma estratégia bem mais simples de trazer soluções generativas para dentro de uma empresa sem precisar criá-las do zero. Basta utilizar os modelos já existentes por aí, e apenas treiná-los para os dados específicos da sua organização. Pretendo explorar isso em um artigo futuro.

## Referências
[How ChatGPT actually works? by AssemblyAI](https://www.assemblyai.com/blog/how-chatgpt-actually-works/)
[The Making of ChatGPT: From Data to Dialogue by SITN](https://sitn.hms.harvard.edu/flash/2023/the-making-of-chatgpt-from-data-to-dialogue/#:~:text=The%20initial%20training%20data%20consisted,Reinforcement%20Learning%20with%20Human%20Feedback)
[AI and its carbon footprint: How much water does ChatGPT consume? por Mint Lounge](https://lifestyle.livemint.com/news/big-story/ai-carbon-footprint-openai-chatgpt-water-google-microsoft-111697802189371.html#:~:text=%E2%80%9COverall%2C%20this%20can%20lead%20to,of%20over%201%2C000%20U.S.%20households.%E2%80%9D)
[Entendendo Como ChatGPT Funciona - Rodando sua Própria IA por Fabio Akita](https://www.youtube.com/watch?v=O68y0yRZL1Y&t=2847s)

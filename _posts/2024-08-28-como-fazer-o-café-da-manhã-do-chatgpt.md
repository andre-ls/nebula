---
date: 2024-08-28 02:33:16
layout: post
title: "Como fazer o café da manhã do ChatGPT"
subtitle:
description:
image: https://i.imgur.com/LxToOUJ.png
optimized_image:
category:
tags: llm rag genAI
author: andre-ls
paginate: false
---
No último artigo que escrevi, explorei um pouco o funcionamento interno de soluções de LLMs (Large Language Models) como o ChatGPT buscando entender quais recursos são necessários para construir uma solução dessas do zero. E bem, sendo excessivamente breve, é um processo caro, em vários sentidos. Mas ao mesmo tempo, é possível ver grandes organizações do mundo da IA vendendo suas soluções generativas, e outras grandes empresas comprando estas soluções e aplicando dentro de seus próprios negócios, criando modelos customizados para uso interno ou para atendimento ao seus clientes. 

Então, o que exatamente está acontecendo? Como todo os custos exorbitantes de construir um modelo de linguagem estão sendo, digamos assim, driblados?

## Antes de tudo, o Objetivo
Entender e avaliar soluções começa bem ao entender o objetivo de tudo, ou o problema que se deseja resolver. E trazer soluções de LLMs para dentro das organizações gira em torno de um problema essencial: Como fazer modelos disponíveis no mercado, que foram treinados apenas com conteúdos públicos disponíveis na internet, absorverem e aprenderem sobre conhecimentos, conceitos e conteúdos que só existem dentro do contexto privado do dia a dia de uma empresa? 

Sem isso, consultar um LLM se assemelha a perguntar a uma pessoa qualquer na rua sobre algum assunto da sua empresa. Ela até pode te dar uma resposta que tenha uma certa relação com o que você perguntou, mas que só vai ser baseada nos seus conhecimentos de mundo e não nos detalhes que o seu chefe fala nas reuniões. 

Então, como fazer isso? Ou enfim, a pergunta: O ChatGPT já está por aí, mas como fazer o seu café da manhã para alcançar soluções mais específicas?

## Solução 1: Fazer o Modelo estudar um pouco mais
A primeira solução, e talvez a mais óbvia, seria fazer o modelo estudar sobre os assuntos específicos necessários para criar uma solução customizada. Dito de outra forma, poderíamos treinar um modelo de mercado pronto apenas sobre os dados específicos de uma empresa para que ele aprenda as especificidades do negócio até que seja capaz de gerar respostas satisfatórias sobre assuntos específicos desejados. 

No mundo técnico, esse processo geralmente é chamado de Fine Tuning, ou às vezes de Transfer Learning. Aqui, estamos injetando o conhecimento que precisamos que o modelo absorva diretamente no seu cérebro. Teoricamente, essa talvez seja a forma mais sólida de fazer isso.

O problema dessa abordagem entretanto, é que apesar do conjunto de dados a ser utilizado para treinamento ser muito menor do que o necessário para construir um modelo do zero, todo o custo e complexidade desse processo, que é o que queríamos evitar, volta totalmente à tona. Custos computacionais de processamento, o esforço de obtenção e refinamento de dados, a expertise para entender toda a complexidade de treinar e monitorar um modelo, tudo isso volta à tona.

## Solução 2: Colocar o contexto no Café do Modelo
Bem, se injetar conhecimento diretamente no cérebro do modelo é muito caro, seria interessante talvez buscar uma outra forma de fazer isso. E sim, existe uma forma mais simples (e mais barata) de resolver esse problema: Podemos passar o conhecimento necessário como um contexto junto às consultas feitas a um modelo. 

### Um Exemplo extremamente simples (E um pouco idiota)
Hora de um exemplo. E nada mais justo que utilizar o próprio ChatGPT para isso.

Imagine que ocupamos uma posição de negócios em uma grande agência de Marketing, e precisamos obter a média de faturamento da empresa no último ano para incluir em uma apresentação. 

Se perguntarmos isso diretamente para o ChatGPT, essa é a resposta que ele nos dá:

![image.png](https://i.imgur.com/6Cs5MgO.png)

Como esperado, é algo bem genérico. Mas e se além da pergunta fornecermos, através de um prompt apropriado, alguns dados sobre o faturamento da empresa?

![image.png](https://i.imgur.com/pTQBLMA.png)

O ChatGPT nos dá uma resposta extensa contendo um detalhamento do cálculo, mas no fim nos dá a resposta que esperávamos:

![image.png](https://i.imgur.com/yEf7IYZ.png)

É um exemplo meio simples, visto que geralmente se espera questionamentos mais complexos e específicos por parte dos usuários. Mas temos que admitir que a ideia funciona. Bem, quase…

### Como automatizar isso?
Essa solução resolve o problema, só que ela é um pouco inconveniente. Toda vez que uma consulta é realizada, o usuário teoricamente precisaria organizar e anexar todas as informações relevantes que permitam criar uma resposta razoável a sua pergunta. Isso não é muito prático, nem faz muito sentido, visto que se os usuários tivessem as informações contextuais em mãos, talvez nem precisasse realizar uma consulta em primeiro lugar. Então, como automatizar esse processo? Entra aqui uma solução que parece estar em alta nos dias atuais: o RAG.

Os RAGs representam uma solução de nome complexo (Retrieval Augmented Generation), que realmente podem possuir alguns elementos abstratos, mas sua ideia essencial é razoavelmente simples: Vamos criar um repositório contendo várias informações relevantes sobre um contexto do qual queremos obter informações (neste caso uma empresa) e para cada requisição feita a um LLM, buscamos automaticamente conteúdos dentro do repositório que tenham alguma relação com o conteúdo da pergunta feita, e a anexamos à requisição enviada para o modelo utilizando um prompt, mais ou menos como fizemos no exemplo.

Desenhando, teríamos algo mais ou menos assim:

![image.png](https://i.imgur.com/g3qOyUN.png)

Dessa forma, o usuário pode fazer consultas diretas normalmente ao modelo, e ao mesmo tempo, sem perceber, as suas requisições estão sendo enriquecidas com informações relevantes que ajudam o modelo a criar uma resposta precisa ao que é pedido. 

A vantagem imediata dessa técnica é todo o custo evitado ao desviar de processos de treinamento e construção/aprimoramento de modelos de linguagem. Aqui, modelos já disponíveis no mercado podem ser utilizados reduzindo o preço e o tempo necessário para desenvolver uma solução customizada. 

Outra importante vantagem é que com o repositório de conhecimentos localizado em uma posição externa ao modelo, ele se torna mais acessível para ser atualizado ou testado quando necessário, o que pode ser feito, de novo, sem a necessidade de retreinar ou reconstruir modelos. Assim novos conhecimentos podem ser adicionados, outros podem ser remodelados para melhorar as respostas do modelo de maneira simples e direta: Basta acessar o repositório.

## Conclusão
RAGs são uma solução oriundas de uma ideia aparentemente simples, mas muito interessantes. Elas vem permitindo a criação de soluções customizadas de IAs generativas de uma maneira mais acessível para diversas organizações.

No entanto, apesar do desenho simples construído nesse artigo, as RAGs possuem uma natureza mais técnica do que isso (talvez dê para inferir pelo sue nome complexo), e existem alguns elementos centrais para o seu funcionamento: No que realmente consiste o “repositório de conhecimento”? E como se busca conhecimentos “relacionados” à requisição do usuário? 

A resposta está na representação de dados em vetores. Pretendo explorar esse tema em um outro dia.

## Referências
[Integration of Large Language Models into Business por Umair Ali Khan](https://medium.com/@umairali.khan/integration-of-large-language-models-into-business-38718ccdfb0f)

[RAG vs Fine Tuning: How to Choose the Right Method por Monte Carlo](https://www.montecarlodata.com/blog-rag-vs-fine-tuning/)

[A beginner's guide to building a Retrieval Augmented Generation (RAG) application from scratch por Learn By Building AI](https://learnbybuilding.ai/tutorials/rag-from-scratch)

[Grounding LLMs por Eleanor Berger](https://techcommunity.microsoft.com/t5/fasttrack-for-azure/grounding-llms/ba-p/3843857)

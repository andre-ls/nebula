---
date: 2024-07-15 12:08:56
layout: post
title: "A dieta do Machine Learning"
subtitle:
description:
image: https://i.imgur.com/GNK6lbi.png
optimized_image:
category:
tags: machinelearning quality quantity
author: andre-ls
paginate: false
---
Nos último artigos que escrevi, falei um pouco, de uma maneira  superficial, o que as soluções de Machine Learning fazem para resolver problemas muito complexos, e como a sua ideia de uso se baseia em uma substituição: Ao invés da lógica de um determinado programa ser criada a partir de um programador, agora os próprios programas chegam a uma conclusão de qual lógica utilizar, a partir do consumo de dados sobre o problema.

A questão que fica, e a que pretendo explorar aqui é: Quais dados são necessários para criar uma solução dessas? Ou de uma maneira um pouco mais cômica, o que essas soluções comem?

É uma pergunta simples, mas algo que muitos não se perguntam ou não sabem responder antes de trazer o tema de Inteligência Artificial para a mesa.

## Primeiro, o Alvo
![Fonte: Fit to Play](https://i.imgur.com/1fhtt2k.jpeg)
*Fonte: Fit to Play*

Não são todas as soluções de Machine Learning que precisam disso, mas as mais comumente utilizadas por aí (os chamados Modelos Supervisionados) precisam de dados históricos sobre a variável alvo, ou seja o que se espera que seja a saída da solução proposta, o alvo a ser alcançado. 

- Para uma solução de detecção de fraudes bancárias, a variável-alvo é a indicação se uma transação é uma fraude ou não.
- Para uma solução de previsão de vendas por mês, a variável-alvo é o total vendido em cada mês.
- Para uma solução de detecção de produtos defeituosos em uma linha de produção por imagem, a variável-alvo é a indicação se uma determinada imagem representa ou não um produto defeituoso. E por aí vai.

E como disse, não é necessário apenas defini-las, mas é preciso ter um histórico de dados sobre estas variáveis. 

- Detectar transações fraudulentas requer um conjunto de milhares de transações passadas com o indicativo se foram fraudulentas ou não.
- Prever vendas mensais requer os valores de vendas totais de vários meses passados.
- Detectar produtos defeituosos por imagem requer um grande conjunto de imagens de produtos defeituosos e não defeituosos, com a devida identificação.

Sem um histórico destas variáveis, ou a possibilidade de obtê-las, construir uma solução de Machine Learning torna-se inviável, para não dizer impossível.

Então, obter esse tipo de informação torna-se o primeiro passo. E a depender do contexto da solução, isso pode ser algo simples ou um pouco mais complexo. Obter o histórico mensal de vendas de meses anteriores pode talvez ser obtido através de uma simples operação em um banco de dados, mas obter um conjunto de imagens de produtos na linha de produção com a devida identificação de defeito ou não pode requerer a implantação de todo um novo processo para registro dos produtos. E após a implementação do processo, ainda seja necessário aguardar um determinado período de tempo, até que uma quantidade razoável de dados seja coletada a partir da qual uma solução pode ser construída.

## E então, os Dados
![Fonte: LinkedIn](https://i.imgur.com/vnXl5ah.png)
*Fonte: LinkedIn*

Além da variável-alvo, precisamos também de outras variáveis características do recurso analisado, seja uma transação, produto, ou mês de vendas, que sejam relevantes para o problema a ser resolvido e que possam auxiliar na correta identificação da variável-alvo. 

Vamos extender um pouco aqui o exemplo de detecção de transações financeiras fraudulentas. Imagine que queiramos construir uma solução de Machine Learning que a partir dos dados referentes à uma transação e dos seus usuários envolvidos consiga distinguir transações regulares de fraudes. Aqui, já possuímos de maneira definida qual a variável-alvo do problema e uma ideia de quais fontes de dados podemos utilizar para extrair as variáveis sobre cada transação. Mas quais dados poderiam ser relvantes para esse problema? Que tal:

- Horário da Transação, pois talvez transações suspeitas ocorram mais comumente na madrugada.
- Valor da Transação e Valor Médio de Transações do Usuário, visto que transações com valores muito maiores do que a média do usuário podem ser fraudulentas.
- Quantidade de Transações do Usuário na última hora, visto que fraudadores, quando possuem acesso ilegal a uma conta bancária, tendem a fazer várias transações seguidas.
- Quantidade de Transferências e Valor Total transferido para o Usuário Destino, visto que provavelmente os fraudadores irão realizar transações de grande valor para usuários muito provavelmente desconhecidos da conta de origem.

Bem, esses são só alguns exemplos de variáveis da minha cabeça. Com um maior entendimento dos dados disponíveis para o problema em questão, e com um pouco mais de estudo aprofundado sobre o tema, mais variáveis poderiam ser criadas. 

Mas independente disso, é importante perceber que as variáveis propostas se baseiam em alguma hipótese que as relacione  com a variável-alvo, as quais podem ser utilizadas pela máquina para a construção da sua lógica final.

Mas não é só isso…

### Qualidade
![Fonte: Qii.ai](https://i.imgur.com/llJUQO6.png)
*Fonte: Qii.ai*

Além da significância dos dados, é necessário garantir a qualidade dos dados que serão utilizados para a construção da solução. Valores computados errados, fora de padrões, ou mesmo valores ausentes são bastante prejudiciais às soluções de Machine Learning. Afinal, é a partir dos dados que elas aprendem, logo se os dados estão errados, algo de errado elas irão aprender. E com uma lógica errada, vem saídas erradas, que geram uma imprecisão da solução. 

E com uma solução imprecisa, dentro de um contexto organizacional, prejuízos acontecem. E dependendo do contexto, podem ser custos pequenos ou significativos, diretos ou indiretos.

- Uma previsão errada das vendas totais do próximo mês podem levar a decisões erradas tomadas pelos gestores de uma empresa.
- A não identificação de uma transação fraudulenta pode levar a grandes prejuízos para o dono original de uma conta bancária, bem como a identificação errada de uma transação comum como fraudulenta pode levar à insatisfação do cliente de ter uma transação sua bloqueada por engano.
- A não identificação de um produto com defeitos de fabricação pode levar à sua venda a um cliente final, que ficará insatisfeito com a compra e poderá processar a fabricante.
- Adicionando um caso mais extremo aos exemplos já usados até agora, imagine uma solução para detecção de câncer em pessoas. Uma predição errada aqui custa muito. Uma indicação errada de que um indivíduo não possui câncer pode custar uma vida, enquanto o contrário pode gerar o prejuízo de milhares de reais investidos em um tratamento sem necessidade.

Além dos custos diretos causados por resultados errados, ainda há um custo indireto relacionado à qualidade dos dados, que é o relacionado ao tempo necessário para organizá-los antes de serem utilizados para a construção de uma solução. Quanto pior a qualidade dos dados, mais tempo profissionais como Engenheiros e Cientistas de Dados precisam investir em tarefas de limpeza, processamento e organização dos dados, o que acaba por diminuir a sua produtividade na entrega de soluções efetivamente. E isso, no fim do dia, também gera custos.

### Quantidade
![Fonte: DiceEnvy](https://i.imgur.com/TbocQCF.png)
*Fonte: DiceEnvy*

Por fim, a eficiência de uma solução de Machine Learning pode depender bastante da quantidade de dados utilizada para sua construção. O problema é que não existe uma regra sólida, seja fórmula ou algo do tipo, para definir a quantidade de dados suficiente para construir uma solução. Mas existe uma consideração importante a se fazer sobre isso.

As soluções de Machine Learning são criadas para absorver padrões dentro do conjunto de dados de um problema, para que depois ela seja capaz de detectar estes mesmos padrões em casos futuros. Vamos extender aqui o exemplo de detecção de defeitos usando imagens de produtos em uma linha de produção. 

Imagine que trabalhamos para uma fábrica de guitarras, e a partir de algumas imagens do produto finalizado, desejamos construir um modelo de Machine Learning capaz de detectar falhas e defeitos para realizar o controle de qualidade dos produtos. Para treinar o modelo, fornecemos algumas imagens de situações que representam alguns dos problemas mais comuns em produtos finais.

- Cordas partidas
- Rachaduras na madeira
- Peças Soltas
- Falhas na pintura

A solução criada a partir destes dados funciona muito bem para a detecção destes problemas. Mas qualquer outro problema que não foi exposto ao programa, como por exemplo, fios desconectados na parte elétrica, nunca serão detectados por ele, já que o modelo não aprendeu padrões que indiquem esse tipo de problema.

Uma solução só é capaz de detectar padrões que foram apresentados através dos dados. Ela não reconhece o que vai além disso, e nem possui criatividade para pensar em problemas novos sozinha. Por isso, talvez não exista uma resposta para definir uma quantidade precisa de dados necessários, mas é importante que a quantidade utilizada seja suficiente para representar ao menos boa parte dos cenários que se espera encontrar. É justamente quando isso não é satisfeito que as soluções apresentam comportamentos enviesados, ou seja, funcionam bem para alguns casos, enquanto para outros (aos quais a solução não foi exposta) não.

Portanto, quando se trata de quantidades, é importante considerar isso. Quanto mais casos os dados cobrirem, com mais precisão o modelo conseguirá detectar casos futuros. Afinal…

## Uma solução só é tão boa quanto os seus Dados
![Fonte:Timo Elliott](https://i.imgur.com/9PqzDtD.png)
*Fonte:Timo Elliott*

No fim, essa é a conclusão desse artigo. Ou de uma forma um pouco menos polida, lixo que entra, lixo que sai. Essa é uma máxima que se aplica bem aos modelos de Machine Learning. Por isso, garantir que os dados utilizados sejam significativos para o problema, representem bem os casos a serem detectados, e que possuam uma boa qualidade é o primeiro passo para se construir uma base através da qual soluções de Machine Learning efetivas possam ser construídas.

Infelizmente, muita gente fala em Inteligência Artificial e outras coisas mágicas sem primeiro considerar isso ☹️. Mas a ascensão da Engenharia de Dados nas organizações veio para resolver esse problema e mais alguns outros. 

## Referências
[Data Quality and Machine Learning: What’s the Connection? por Talend](https://www.talend.com/resources/machine-learning-data-quality/)
[How Much Data Is Required for Machine Learning? por Post Industria](https://postindustria.com/how-much-data-is-required-for-machine-learning/)
[Data Quality and Quantity for Machine Learning por Monolith](https://www.monolithai.com/blog/data-quality-and-quantity-for-machine-learning)

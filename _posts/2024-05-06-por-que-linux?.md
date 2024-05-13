---
date: 2024-05-06 12:29:38
layout: post
title: "Por que Linux?"
subtitle:
description:
image: https://i.imgur.com/LAQCkVt.png
optimized_image:
category:
tags: linux software cloud
author: andre-ls
paginate: false
---
Linux é um sistema operacional estranho. Muitas pessoas que o utilizam falam de inúmeras vantagens. Outros, que não o utilizam, praticamente o demonizam. E no fim é um sistema que não possui uma grande popularidade. Ou será que tem?

Nesse breve artigo, trago como objetivo entender brevemente sobre a origem do Linux, onde ele pode ser encontrado e algumas de suas vantagens e desvantagens.

## Unix
Tudo começa com um sistema chamado Multics, um projeto ambicioso, elaborado através da parceria entre o M.I.T, a General Eletric, e o Bell Labs, o lendário laboratório de pesquisas criado pela AT&T, e hoje pertencente à Nokia. O Multics foi o primeiro sistema operacional de tempo compartilhado, ou seja, um sistema que permite ser utilizado ao mesmo tempo por vários usuários, que compartilham os seus recursos. 

Em 1969, entretanto, a Bell Labs desistiu do projeto, mas dois de seus pesquisadores, Ken Thompson e Dennis Ritchie (criador da linguagem C) continuaram seu trabalho, gerando um conjunto de funcionalidades que formou o Unix. E o mais interessante é que esse conjunto de funcionalidades gerou os fundamentos para vários sistemas operacionais futuros, sendo encontrados até hoje.

Uma dessas funcionalidades é a interação através de comandos no terminal, comumente conhecido como CLI (Command Line Interface). Apesar de não ser a realidade para muitos usuários de computadores hoje em dia, mesmo os sistemas operacionais mais populares fornecem uma interface de interação muito semelhante ao que foi proposto pelo Unix, onde os usuários inserem comandos, em formatos de texto que por sua vez invocam operações a serem executadas pelo sistema, como a criação de um arquivo, remoção de um diretório, listagem de arquivos, entre outros. Cada comando pode receber, se necessário, uma quantidade de parâmetros, obrigatórios ou opcionais.

![Fonte: Wikipedia, 2023.](https://i.imgur.com/WKchM7h.png)
*Fonte: Wikipedia, 2023*

Além da utilização de um comando por vez, o Unix já permitia a combinação de múltiplos comandos através do operador "\|" (pipe) onde a saída de um comando é utilizada como a entrada de outro, permitindo a criação de fluxos mais complexos.

Outra funcionalidade de extrema importância trazida pelo Unix é o sistema de arquivos, que promove uma estrutura hierárquica para organização dos arquivos, em um formato semelhante a uma árvore invertida, com a raiz no topo, a partir da qual diversas ramificações são derivadas através de pastas.

![Fonte: TechTarget, 2024.](https://i.imgur.com/JiMxBfN.png)
*Fonte: TechTarget, 2024*

## E então, surge o Linux
Em 1990, Linus Torvalds, um estudante de ciência da computação na Universidade de Helsinki, na Finlândia, iniciou um projeto pessoal, baseado em Unix, apenas para acessar os servidores da universidade utilizando seu computador pessoal. 

Entretanto, o projeto evoluiu até possuir as dimensões de um sistema operacional. Desejando criar um sistema gratuito como alternativa aos sistemas proprietários da época, geralmente de alto custo, Torvalds publicou o seu projeto, batizado de Linux, através de uma licença open-source, o que permite que o sistema seja utilizado, modificado e redistribuído por qualquer pessoa.

Isso permitiu a criação de uma comunidade ao redor do Linux, através das quais desenvolvedores ao redor do mundo puderam contribuir para construí-lo como é conhecido hoje: robusto, estável e seguro.

## Distribuições
Para entender como o Linux é utilizado hoje em dia, é importante entender o que são distribuições. O produto criado por Linus Torvalds consiste em apenas uma parte do que é necessário para se construir um sistema operacional, que é denominada de kernel. O kernel age como o cérebro do sistema, controlando o processador, memória e periféricos de forma a garantir a correta execução de processos e aplicações. 

Mas sozinho, o kernel não serve para muita coisa. São necessários ao seu redor múltiplos softwares que tornam o sistema realmente útil, como por exemplo:

- Uma interface para interagir com o sistema, seja através de um terminal ou uma interface gráfica.
- Drivers, responsáveis por realizar a comunicação entre o kernel e dispositivos externos, desde um teclado até uma placa de vídeo.
- Gerenciadores de Pacote, responsáveis pela instalação de diversos sistemas a serem utilizados no computador.
- E as aplicações em si, através das quais o usuário pode realizar diversas atividades, o que pode incluir desde navegadores web, editores de texto, e até mesmo games.

A partir dessa ideia, as distribuições nada mais são do que pacotes, que juntam todas estas peças em um sistema operacional funcional. O grande detalhe, entretanto, é que como existem diferentes tipos dessas peças disponíveis na internet, existem várias combinações possíveis para as mesmas, o que resulta na existência de uma grande variedade de distribuições, que podem ser adaptadas para diferentes cenários e aplicações:

- Distribuições para Desktops e Notebooks, que podem ser configuradas com diferentes ambientes gráficos e aplicações iniciais.
- Distribuições para Servidores e Super Computadores.
- Distribuições para Dispositivos Móveis. O Android, apesar de muito distinto, é um sistema baseado em Linux, por exemplo.
- Distribuições para Sistemas Embarcados. Os sistemas encontrados nas Smart TVs da Samsung e LG, por exemplo, também são baseados em Linux.

![Algumas Distribuições Linux](https://i.imgur.com/jkzqLil.png)
*Fonte: Teclinux, 2022*

De uma maneira menos técnica, pode-se dizer que a consequência prática disso é que, diferentemente do Windows e Mac, Linux não tem uma única face, mas pode assumir várias, o que permite escolher a melhor delas considerando as necessidade do usuário e o ambiente de aplicação.

## Market Share
Considerando todas essas possibilidades, em quais setores o Linux é mais popular? Há diversas pesquisas, e os resultados divergem um pouco. Mas estatísticas recentes mostram que:

- Em ambientes desktop, o Linux ocupa um market share de apenas 2,09%, atrás do dominante Windows, e do Mac.
- No mundo de servidores e super computadores, entretanto, o Linux é dominante, presente em 96,3**%** dos top 1 milhão servidores do mundo e 91,5% dos top 500 super computadores do mundo.  Além disso, aproximadamente 90% da infraestrutura em nuvem opera com Linux.
- No mercado de smartphones, o Android é o sistema operacional mais utilizado, ocupando 85% do mercado mundial, que é um sistema baseado em Linux.
- Em dispositivos IoT, sistemas baseados em Linux ocupam 58% do mercado.

Em resumo, Linux está em todos os lugares, menos nos nossos computadores. Meio irônico. Especialmente considerando a sua popularidade em servidores, é muito provável que algum serviço, site ou rede social que você consuma esteja hospedado em um sistema baseado em Linux. Talvez até mesmo esta página web esteja hospedada em algum servidor Linux por aí.

## Mas então, por que Linux?
Apesar de tudo isso, a pergunta ainda permanece. Vamos analisar algumas possíveis razões para isso.

- Customização: Como já discutido antes, o Linux é altamente customizável, não só em termos de suas distribuições mas também do ponto de vista da disponibilidade de softwares e pacotes que podem adicionar novas funcionalidades a um sistema existente e transformá-lo em algo mais otimizado para determinado uso.
- Segurança e Confiabilidade: Além da disponibilidade direta de ferramentas de segurança como um controle refinado das capacidades de cada usuário e a compatibilidade com vários métodos de autenticação, a maior vantagem do Linux nesse aspecto é ter o seu código público, o que possibilita qualquer usuário a identificar e corrigir bugs e falhas de segurança. Isso cria um ambiente de testagem muito robusto, onde correções são realizadas rapidamente e versões estáveis de distribuições são criadas com versões de softwares amplamente confiáveis.
- Desempenho e Estabilidade: O Linux possui uma boa performance que escala muito bem em aplicações de larga escala e alto volume, ao mesmo tempo que mantém uma boa estabilidade com poucos travamentos e reinicializações. Isso é muito importante para aplicações organizacionais críticas, onde um desligamento, mesmo que por pouco tempo, pode causar muitos prejuízos.
- Custos: Sendo um software livre, Linux em sua grande maioria, é gratuito. Do ponto de vista empresarial, isso pode levar a uma grande redução de custos e a uma flexibilidade maior, já que não há necessidade de se comprometer em longos contratos com outras empresas.

Essas vantagens podem explicar o sucesso do Linux em ambientes de servidores, mas não condizem com a sua baixa popularidade em sistemas desktop. Então, faz sentido fazer a pergunta contrária: Por que não Linux?

- Compatibilidade com Hardware: O Linux não possui uma compatibilidade muito amigável com dispositivos proprietários ou de certos fabricantes, muitas vezes requerendo configurações avançadas além da instalação do sistema para um correto funcionamento.
- Ausência de softwares: Apesar da variedade de softwares já disponíveis para ambientes Linux, ainda existem muitas ferramentas populares que não possuem compatibilidade com ambiente Linux, o que pode afastar muitos usuários.
- Suporte: Com exceção de algumas distribuições mantidas por corporações, a maioria da distribuições Linux são mantidas pela comunidade, o que significa que em caso de falhas, erros e bugs, o suporte é limitado a fóruns, documentações e guias.
- Windows e Mac simplesmente ‘funcionam’: Os grandes concorrentes do Linux em ambientes desktop basicamente entregam um produto que funciona ‘out of the box’, entregando um conjunto de funcionalidades satisfatórias para a grande maioria dos usuários sem a necessidade de configurações adicionais ou escolher entre diversas opções de distribuições ou ferramentas. No fim do dia, isso é o que realmente importa para o usuário padrão de computadores.

## Conclusão
O Linux é um sistema que se encontra mais presente no dia a dia do que imaginamos, mesmo que indiretamente. Pode não ser o sistema de escolha de muitos usuários finais, mas é interessante reconhecer a influência que o seu design teve em outros sistemas operacionais, bem como a sua importância para o funcionamento de muita coisa existente na internet.

## Referências
[A Comprehensive History of Linux, por Uzair](https://medium.com/@umutasim999/a-comprehensive-history-of-linux-a965338f874f)

[A Brief History of the Linux Operating System, por freecodecamp](https://forum.freecodecamp.org/t/a-brief-history-of-the-linux-operating-system/19524)

[Linux History, por geeksforgeeks](https://www.geeksforgeeks.org/linux-history/)

[History of Multics, por MIT](https://web.mit.edu/multics-history/)

[Unix Definition, por TechTarget](https://www.techtarget.com/searchdatacenter/definition/Unix)

[Unix - A Origem dos Sistemas, por Linuxuniverse](https://linuxuniverse.com.br/historia/unix)

[9 reasons Linux is a popular choice for servers, por LogicMonitor](https://www.logicmonitor.com/blog/9-reasons-linux-is-a-popular-choice-for-servers)

[Linux Distribution Definition, por Suse](https://www.suse.com/suse-defines/definition/linux-distribution/)

[Linux Statistics, por Enterprise Apps Today](https://www.enterpriseappstoday.com/stats/linux-statistics.html)



![CI Status](https://img.shields.io/github/actions/workflow/status/ToriCrux/appmonitor-pipeline/ci.yml?branch=main&label=CI%20Status)

# 1. AppMonitor Pipeline - Objetivo

Este repositório foi criado como parte do Assessment Final da disciplina de Pipelines de CI/CD e DevOps, com o objetivo de simular a monitoração de aplicações web por meio de scripts e automações utilizando GitHub Actions. Embora não haja uma aplicação web real, todo o pipeline de entrega e monitoração foi estruturado de forma realista para refletir boas práticas de integração contínua (CI) e entrega contínua (CD).

---
<br>

## 2. Git - Entrega Contínua

O Git é uma ferramenta essencial no ciclo de vida de desenvolvimento moderno. Ele permite o versionamento do código-fonte, facilita o trabalho em equipe e garante histórico detalhado das alterações. Em um pipeline de CI/CD, o Git atua como ponto central de automação, onde:

- Cada commit pode disparar uma nova execução do pipeline.
- Branches organizam os fluxos de desenvolvimento e publicação, promovendo uma colaboração de código segura para todo o time.
- Tags sinalizam versões estáveis para publicação e monitoramento, gerando assim um histórico de consulta para mudanças.
- Releases tornam as versões rastreáveis com changelogs e empacotamento.

---
<br>

## 3. Branches e Tags - Importância

- *Branches:* permitem separar diferentes etapas do desenvolvimento, como main, develop e ci/setup, facilitando a organização, testes e validações antes de publicar o projeto no ambiente produtivo.

- *Tags:* são marcadores usados para identificar versões específicas do projeto (ex: v0.1.0), permitindo que se volte a pontos estáveis no tempo, essenciais para controle de releases.

---
<br>

## 4. Variáveis, Contextos e Secrets

O projeto utiliza três tipos de configuração no GitHub Actions para gerenciar informações:

- **`env` (variáveis de ambiente):** usadas dentro dos jobs para configurar o ambiente de execução. Exemplo: `APP_ENV`.

- **`vars` (contexto de variáveis):** usadas como valores reutilizáveis definidos nas configurações do repositório. São acessadas por `${{ vars.NOME }}`. Exemplo: `SUPPORT_EMAIL`.

- **`secrets` (segredos):** armazenam informações sensíveis como senhas e chaves de API. Não são visíveis nos logs e são acessadas por `${{ secrets.NOME }}`. Exemplo: `API_KEY`.

Esses recursos ajudam a manter o pipeline seguro, flexível e desacoplado de valores fixos no código.

---
<br>

## 5. Logs e Resumos no GitHub Actions

Durante a execução do pipeline, o GitHub Actions registra logs detalhados de cada etapa, permitindo identificar com precisão falhas e comportamentos inesperados. Além disso, também é possível ativar logs de depuração com a variável `ACTIONS_STEP_DEBUG=true`, que fornece ainda mais detalhes internos.

E, os summaries (resumos) personalizados podem ser adicionados ao final do job, apresentando informações como sistema operacional, branch analisada, status da execução e links úteis — como o do artefato gerado. Esses recursos aumentam a visibilidade e facilitam o diagnóstico em pipelines mais complexos.

---
<br>

## 6. Deploy com Aprovação Manual

Para garantir segurança no processo de entrega configurar um ambiente de produção, que exige **aprovação manual obrigatória** antes da execução do deploy, é uma forma de controle que promove segunrança e governança para o projeto.

---
<br>

## 7. Diagnóstico de Falhas Automatizado

Foi criado o workflow `diagnostic.yml` para verificar se variáveis essenciais, como `APP_ENV` e `API_KEY`, estão corretamente configuradas.

O pipeline emite mensagens de erro (`::error::`) caso alguma delas esteja ausente, além de gerar um resumo automático no job (summary) com instruções para correção. Esse comportamento simula uma rotina de **validação resiliente**, permitindo diagnósticos rápidos e acionáveis.

Esse tipo de verificação fortalece a observabilidade e evita falhas silenciosas durante a execução dos workflows.


---
<br>
<br>

# Etapas do desenvolvimento do Assessmente

## Etapa 1

Nesta primeira etapa, dei início à estruturação do projeto AppMonitor, focado na simulação de pipelines de monitoração para aplicações web. A proposta não envolve o desenvolvimento da aplicação em si, mas sim o preparo de todo o ecossistema de versionamento e automação que daria suporte a um projeto real.

Realizei então as etapas de:
1.	Criar um repositório local com o Git.
2.	Criar o repositório e vincular ele remotamente, e assim vincular a Branch ci /setup.
3.	Nessa Branch adicionei o script status-check.sh e criei o README.md com explicações breves sobre o projeto e a importância do Git, bem como um resumo dos conceitos de branches e tags para o controle de versões e organização do fluxo de trabalho.
4.	Finalizado os commits com os arquivos gerados, criei a tag v0.1.0. Onde marquei como a primeira versão estável da estrutura do projeto. E baseada nessa tag, publiquei também uma release.

![image](https://github.com/user-attachments/assets/8b9ee2f4-77d1-4444-b555-a676d7b95528)

![image](https://github.com/user-attachments/assets/97a7da19-5833-4f48-9e0e-d090601ffced)

![image](https://github.com/user-attachments/assets/d7556714-31d1-4b61-ac83-f485ba810c4b)

![image](https://github.com/user-attachments/assets/2d94e09d-daa2-40db-b053-98f019f85a55)

![image](https://github.com/user-attachments/assets/97162582-2a0b-4f46-be29-fd4a961f6dae)

<br>

## Etapa 2

Nessa segunda etapa, estruturei o pipeline de integração contínua para o repositório AppMonitor utilizando o GitHub Actions. 

E o pipeline foi configurado para ser acionado em 2 cenários: push na main e pull requests direcionados na main também. Com isso, qualquer alteração relevante no repositório será verificada antes de ser incorporada na versão principal.

E dentro do ci.yml, há 3 jobs deifinidos:

1.	Validate – responsável pela validação de sintaxe, onde verifica se o script status-check.sh está escrito corretamente.
2.	Test – simula testes para representar a execução de testes automatizados.
3.	Package – que seria o empacotamento e publicação, onde um artefato é criado contendo o script e um relatório fictício de teste.

Importante ressaltar que o primeiro job foi muito bem aplicado. Como inicialmente o script status-check.sh havia sido criado diretamente pelo PowerShell sua codificação default era em UTF-16LE que é incompatível com o interpretador bah como o do GitHub Actions.
Portanto, depois de algumas tentativas de correção, optei por deletar a versão inicial do script e recriá-la diretamente pelo GitHub onde já codifica por padrão os arquivos em UTF-8.
Por fim, obtive êxito no CI com o Actions aplicando essa alteração.

![image](https://github.com/user-attachments/assets/a78ad1b2-2ca8-40a4-a097-bdacac0d707e)


<br>

## Etapa 3

Nessa etapa do projeto, realizei a criação de variáveis, segredos e contexto no GitHub Actions, que se trata de uma prática essencial para pipelines seguros, reutilizáveis e organizados.

E com a criação dessas variáveis e segredos, criei também um workflow intitulado run-monitor.yml, que contém 3 jobs distintos, sendo eles:

1.	Usar-env – que utiliza a variável APP_ENV como variável de ambiente.
2.	Usar-vars – que faz uso de variáveis definidas no github permitindo a centralização de valores reutilizáveis no repositório, sendo nesse caso a variável SUPPORT_EMAIL.
3.	Usar-secretes – que simula o uso da chave de API de maneira fictícia.

![image](https://github.com/user-attachments/assets/3d803e5e-ae67-426f-a613-9cc3356c579f)

![image](https://github.com/user-attachments/assets/e55614a1-8cdc-4282-88d7-6507c3a3d602)


<br>

## Etapa 4

Na quarta etapa, foi realizado o aperfeiçoamento da capacidade de diagnóstico do pipeline e da sua visibilidade, por meio da inclusão de logs detalhados, mensagens personalizadas e resumos automatizados no GitHub Actions.

Portanto, atualizei o ci.yml para incluir:

1.	Logs de depuração ativados.
2.	Mensagens personalizadas de aviso e erro.
3.	Resumo automático do pipeline (o job summary).

Esses dados são exibidos diretamente na interface do GitHub após a conclusão
do workflow, proporcionando uma visão clara e rápida dos resultados da execução.

![image](https://github.com/user-attachments/assets/7e46932f-1354-47b8-95e3-e9552dfe9301)


<br>

## Etapa 5

Nessa etapa do projeto foi implementado essa ação através de um ambiente chamado `production`, além da construçaõ do workflow `deploy.yml` que é executado apenas após a liberação manual. A variável `PROD_DOMAIN=appmonitor.com` foi definida nesse ambiente, sendo utilizada para simular o deploy real.

Esse processo simula um cenário corporativo em que alterações em produção só ocorrem com validação humana, aumentando a confiabilidade do sistema.

![image](https://github.com/user-attachments/assets/049259d7-78a8-4944-94d8-26eb8d5be6fe)

![image](https://github.com/user-attachments/assets/65ba8bc1-b711-4382-b1d5-55c06afe6ab8)

![image](https://github.com/user-attachments/assets/c73e9379-7092-4e0a-8ef5-d3b7c7d9b5ce)

![image](https://github.com/user-attachments/assets/90ac3f6f-79f0-4194-a874-2a66e25a33d8)

<br>

## Etapa 6

Na última etapa, implementei um worflow focado em pormeio de validações automáticas que detectam falhas de configuração, demonstrar resiliência no pipeline.

No workflow diagnotic.yml, é feita a verificação se variáveis essenciais para o repositório estão corretamente definidas. E caso alguma esteja ausente, o workflow emite uma mensagem de erro, registra um diagnóstico e encerra a execução.

![image](https://github.com/user-attachments/assets/27727755-8afc-46d9-a50c-c4d56b7350b2)

![image](https://github.com/user-attachments/assets/6325b325-d5bb-47bb-84d6-38b93a9443b7)


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


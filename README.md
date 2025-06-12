# 1. AppMonitor Pipeline - Objetivo

Este repositório foi criado como parte do Assessment Final da disciplina de Pipelines de CI/CD e DevOps, com o objetivo de simular a monitoração de aplicações web por meio de scripts e automações utilizando GitHub Actions. Embora não haja uma aplicação web real, todo o pipeline de entrega e monitoração foi estruturado de forma realista para refletir boas práticas de integração contínua (CI) e entrega contínua (CD).

---

## 2. Git - Entrega Contínua

O Git é uma ferramenta essencial no ciclo de vida de desenvolvimento moderno. Ele permite o versionamento do código-fonte, facilita o trabalho em equipe e garante histórico detalhado das alterações. Em um pipeline de CI/CD, o Git atua como ponto central de automação, onde:

- Cada commit pode disparar uma nova execução do pipeline.
- Branches organizam os fluxos de desenvolvimento e publicação, promovendo uma colaboração de código segura para todo o time.
- Tags sinalizam versões estáveis para publicação e monitoramento, gerando assim um histórico de consulta para mudanças.
- Releases tornam as versões rastreáveis com changelogs e empacotamento.

---

## 3. Branches e Tags - Importância

- *Branches:* permitem separar diferentes etapas do desenvolvimento, como main, develop e ci/setup, facilitando a organização, testes e validações antes de publicar o projeto no ambiente produtivo.

- *Tags:* são marcadores usados para identificar versões específicas do projeto (ex: v0.1.0), permitindo que se volte a pontos estáveis no tempo, essenciais para controle de releases.

---

## 4. Estrutura Inicial

- status-check.sh: Script de exemplo que simula a verificação de status de uma aplicação web.
- README.md: Documento com diretrizes sobre o uso de Git e a estrutura desse repositório.

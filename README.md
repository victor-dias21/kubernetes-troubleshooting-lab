# kubernetes-troubleshooting-lab

Cenários práticos para troubleshooting de Kubernetes com foco em DevOps e SRE.

## Objetivo

Criar um laboratório com falhas intencionais em workloads Kubernetes para praticar investigação, diagnóstico e correção de problemas comuns em clusters.

O foco é treinar leitura de eventos, logs, probes, recursos, imagens, configurações e comportamento de aplicações em execução.

## O que este laboratório cobre

- Pods em `CrashLoopBackOff`.
- Imagens com `ImagePullBackOff`.
- Probes de readiness e liveness falhando.
- Problemas de recursos, como OOMKilled.
- ConfigMaps e Secrets ausentes ou incorretos.
- Comandos úteis de troubleshooting com `kubectl`.

## Roadmap

- [ ] Criar namespace e manifests base do laboratório.
- [ ] Adicionar cenário de `CrashLoopBackOff`.
- [ ] Adicionar cenário de `ImagePullBackOff`.
- [ ] Adicionar cenário de probes falhando.
- [ ] Documentar passos de investigação para cada falha.
- [ ] Criar guia de resolução e checklist de comandos.

## Como usar

Este laboratório ainda está em planejamento.

Quando os cenários forem adicionados, esta seção terá instruções para aplicar os manifests em um cluster local, como `kind` ou `minikube`, e praticar cada diagnóstico.

## Status

Em planejamento.

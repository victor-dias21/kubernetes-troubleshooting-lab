# kubernetes-troubleshooting-lab

![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=flat-square&logo=kubernetes&logoColor=white)
![kind](https://img.shields.io/badge/kind-lab-0f766e?style=flat-square)
![SRE](https://img.shields.io/badge/SRE-troubleshooting-2563eb?style=flat-square)

Cenários práticos para troubleshooting de Kubernetes com foco em DevOps e SRE.

## Objetivo

Criar um laboratório com falhas intencionais em workloads Kubernetes para praticar investigação, diagnóstico e correção de problemas comuns em clusters.

O foco é treinar leitura de eventos, logs, probes, recursos, imagens, configurações e comportamento de aplicações em execução.

> Os manifests deste repositório criam falhas de propósito. Use somente em clusters locais ou ambientes descartáveis.

## O que este laboratório cobre

- Pods em `CrashLoopBackOff`.
- Imagens com `ImagePullBackOff`.
- Probes de readiness e liveness falhando.
- Problemas de recursos, como OOMKilled.
- ConfigMaps e Secrets ausentes ou incorretos.
- Comandos úteis de troubleshooting com `kubectl`.
- Scripts para aplicar e limpar os cenários.
- Guia de investigação em `docs/guia-troubleshooting.md`.

## Roadmap

- [x] Criar namespace e manifests base do laboratório.
- [x] Adicionar cenário de `CrashLoopBackOff`.
- [x] Adicionar cenário de `ImagePullBackOff`.
- [x] Adicionar cenário de probes falhando.
- [x] Adicionar cenário de `OOMKilled`.
- [x] Documentar passos de investigação para cada falha.
- [x] Criar guia de resolução e checklist de comandos.
- [ ] Adicionar cenários com ConfigMap e Secret inválidos.
- [ ] Adicionar exemplos de correção lado a lado.

## Como usar

Pré-requisitos:

- Docker.
- `kind`.
- `kubectl`.

Criar cluster local:

```bash
kind create cluster --name sre-lab
```

Aplicar cenários:

```bash
./scripts/apply-lab.sh
```

No PowerShell:

```powershell
.\scripts\apply-lab.ps1
```

Investigar:

```bash
kubectl get pods -n k8s-troubleshooting-lab
kubectl get events -n k8s-troubleshooting-lab --sort-by=.lastTimestamp
```

Leia o guia completo em [docs/guia-troubleshooting.md](docs/guia-troubleshooting.md).

## Status

Laboratório inicial implementado para prática local.

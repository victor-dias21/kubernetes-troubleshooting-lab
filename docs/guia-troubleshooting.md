# Guia de Troubleshooting

Use este guia para praticar investigação em Kubernetes. Os cenários são intencionalmente quebrados.

## Preparar ambiente

```bash
kind create cluster --name sre-lab
kubectl apply -f manifests/namespace.yaml
kubectl apply -f manifests/scenarios/
```

Namespace usado:

```bash
kubectl config set-context --current --namespace=k8s-troubleshooting-lab
```

## Checklist inicial

```bash
kubectl get pods
kubectl get events --sort-by=.lastTimestamp
kubectl describe pod <pod>
kubectl logs <pod>
kubectl logs <pod> --previous
```

## Cenário: CrashLoopBackOff

Sintoma esperado:

- Pod reinicia continuamente.
- `kubectl logs --previous` mostra a execução anterior.

Investigação:

```bash
kubectl get pods -l scenario=crashloopbackoff
kubectl describe pod -l scenario=crashloopbackoff
kubectl logs -l scenario=crashloopbackoff --previous
```

Correção esperada:

- Ajustar o comando do container para manter o processo principal saudável.
- Validar se a aplicação realmente deve encerrar ou ficar em execução.

## Cenário: ImagePullBackOff

Sintoma esperado:

- Pod não baixa a imagem.
- Eventos mostram erro de pull ou imagem inexistente.

Investigação:

```bash
kubectl get pods -l scenario=imagepullbackoff
kubectl describe pod -l scenario=imagepullbackoff
kubectl get events --field-selector involvedObject.kind=Pod
```

Correção esperada:

- Corrigir nome, tag ou registry da imagem.
- Verificar credenciais quando o registry for privado.

## Cenário: probes falhando

Sintoma esperado:

- Readiness falha porque `/ready` não existe.
- Liveness falha porque `/healthz` não existe.

Investigação:

```bash
kubectl get pods -l scenario=probe-failure
kubectl describe pod -l scenario=probe-failure
kubectl port-forward deploy/probe-failure-demo 8080:8080
```

Correção esperada:

- Ajustar paths das probes para endpoints reais.
- Ajustar `initialDelaySeconds` quando a aplicação demora para iniciar.

## Cenário: OOMKilled

Sintoma esperado:

- Container consome mais memória que o limite.
- Estado anterior mostra motivo `OOMKilled`.

Investigação:

```bash
kubectl get pods -l scenario=oomkilled
kubectl describe pod -l scenario=oomkilled
kubectl top pod
```

Correção esperada:

- Ajustar limites e requests com base no consumo real.
- Corrigir vazamento ou pico de memória da aplicação.

## Limpeza

```bash
kubectl delete namespace k8s-troubleshooting-lab
kind delete cluster --name sre-lab
```

#!/usr/bin/env bash
set -euo pipefail

kubectl apply -f manifests/namespace.yaml
kubectl apply -f manifests/scenarios/

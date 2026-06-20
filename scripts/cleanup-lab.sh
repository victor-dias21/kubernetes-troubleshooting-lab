#!/usr/bin/env bash
set -euo pipefail

kubectl delete namespace k8s-troubleshooting-lab --ignore-not-found=true

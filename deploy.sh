#!/bin/bash
set -euo pipefail

# Variables
RELEASE_NAME=tetris-app
NAMESPACE=tetris-app
CHART_PATH=./helm-charts
VALUES_FILE=./values.yaml   # optional

# Ensure namespace exists
kubectl get namespace $NAMESPACE >/dev/null 2>&1 || \
  kubectl create namespace $NAMESPACE

# Deploy/upgrade with Helm
helm upgrade --install $RELEASE_NAME $CHART_PATH \
  --namespace $NAMESPACE \
  -f $VALUES_FILE \
  --wait --timeout 5m

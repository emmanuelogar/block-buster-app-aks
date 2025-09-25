#!/bin/bash
set -euo pipefail

# Variables
RELEASE_NAME=block-buster-app
NAMESPACE=block-buster-app
CHART_PATH=./helm-chart

helm upgrade --install $RELEASE_NAME $CHART_PATH \
  --namespace $NAMESPACE \
  --create-namespace \
  --wait --timeout 5m

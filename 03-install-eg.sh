#!/usr/bin/env bash
source 00-common.sh

kubectl apply -f https://github.com/envoyproxy/gateway/releases/download/v${ENVOY_GW_VERSION}/install.yaml

watch -n1 kubectl get pods --namespace envoy-gateway-system

#!/usr/bin/env bash
source 00-common.sh

kubectl apply -f https://github.com/envoyproxy/gateway/releases/download/v${ENVOY_GW_VERSION}/install.yaml

while ! kubectl wait --for=condition=available --timeout=600s deployment/envoy-gateway -n envoy-gateway-system; do sleep 1; done

echo

watch -n1 kubectl get pods --namespace envoy-gateway-system

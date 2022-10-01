#!/usr/bin/env bash
source 00-common.sh

# Gateway (port 8080)
#kubectl apply -f https://raw.githubusercontent.com/envoyproxy/gateway/v${ENVOY_GW_VERSION}/examples/kubernetes/gateway.yaml
kubectl apply -f 06/gateway.yaml

kubectl -n default get gateway -o wide
{ echo "^^ never says 'ready'"; } 2> /dev/null

#!/usr/bin/env bash
source 00-common.sh

# Gateway (port 8080)
#kubectl apply -f https://raw.githubusercontent.com/envoyproxy/gateway/v${ENVOY_GW_VERSION}/examples/kubernetes/gateway.yaml
kubectl apply -f 06/gateway.yaml

kubectl -n default get gateway -o wide
{ echo "^^ doesn't say 'ready' unless you let the service's LB be created, eg with minikube tunnel. Still works though."; } 2> /dev/null

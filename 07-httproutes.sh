#!/usr/bin/env bash
source 00-common.sh

# HTTPRoute
#kubectl apply -f https://raw.githubusercontent.com/envoyproxy/gateway/v${ENVOY_GW_VERSION}/examples/kubernetes/httproute.yaml
kubectl apply -f 07/httpbin.yaml

kubectl apply -f 07/http-log.yaml

watch -n1 kubectl -n envoy-gateway-system get pods

kubectl get httproute -o wide

set +x
echo Port forward and...
echo open http://$GATEWAY_URL/http-log
echo open http://$GATEWAY_URL/httpbin

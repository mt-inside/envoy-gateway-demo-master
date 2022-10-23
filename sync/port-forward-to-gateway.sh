source 00-common.sh

kubectl -n envoy-gateway-system port-forward $(kubectl get service -l gateway.envoyproxy.io/owning-gateway-name=insecure -n envoy-gateway-system -o name) 8080:$GATEWAY_PORT

source 00-common.sh

kubectl -n envoy-gateway-system port-forward service/envoy-eg 8080:$GATEWAY_PORT

source 00-common.sh

kubectl -n istio-system port-forward $(kubectl -n istio-system get pod -l app=istio-ingressgateway -o jsonpath='{.items[0].metadata.name}') 8443:$GATEWAY_PORT_SECURE

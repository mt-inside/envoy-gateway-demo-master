source 00-common.sh

# NB: Must (v 0.2.0) be applied in order, due to #301

# GatewayClass
# - The physical gateway Pod is named after this (ie envoy-foo), but doesn't appear until gwclass, gw, and httproute have been deployed
# - Must be called "eg" - tries to use an eponymous SA, but if it's not called eg, that sa (ie envoy-eg) simply isn't made
#kubectl apply -f https://raw.githubusercontent.com/envoyproxy/gateway/v${ENVOY_GW_VERSION}/examples/kubernetes/gatewayclass.yaml
kubectl apply -f 06/gatewayclass.yaml

sleep 10

# Gateway (port 8080)
#kubectl apply -f https://raw.githubusercontent.com/envoyproxy/gateway/v${ENVOY_GW_VERSION}/examples/kubernetes/gateway.yaml
kubectl apply -f 06/gateway.yaml

sleep 10

# HTTPRoute
#kubectl apply -f https://raw.githubusercontent.com/envoyproxy/gateway/v${ENVOY_GW_VERSION}/examples/kubernetes/httproute.yaml
kubectl apply -f 06/httpbin.yaml

kubectl apply -f 06/http-log.yaml

watch -n1 kubectl -n envoy-gateway-system get pods

set +x
echo Port forward and...
echo open http://$GATEWAY_URL/http-log
echo open http://$GATEWAY_URL/httpbin

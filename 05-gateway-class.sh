source 00-common.sh

# NB: Must (v 0.2.0) be applied in order, due to #301

# GatewayClass
# - The physical gateway Pod is named after this (ie envoy-foo), but doesn't appear until gwclass, gw, and httproute have been deployed
# - Must be called "eg" - tries to use an eponymous SA, but if it's not called eg, that sa (ie envoy-eg) simply isn't made
#kubectl apply -f https://raw.githubusercontent.com/envoyproxy/gateway/v${ENVOY_GW_VERSION}/examples/kubernetes/gatewayclass.yaml
kubectl apply -f 05/gatewayclass.yaml

kubectl get gatewayclass -o wide

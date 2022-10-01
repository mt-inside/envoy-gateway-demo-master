#!/usr/bin/env bash
source 00-common.sh


# NOTE: installs Pods (admission hook), not just CRDs
#kubectl apply -f https://github.com/envoyproxy/gateway/releases/download/v${ENVOY_GW_VERSION}/gatewayapi-crds.yaml
# Last time I checked (29/9/22), ^^ was a vendor of upstream 0.5.0 experimental-install
kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v${GW_API_VERSION}/experimental-install.yaml

watch -n1 kubectl get pods --namespace gateway-system

kubectl get crd
echo
echo
kubectl api-resources | grep gateway

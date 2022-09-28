source 00-common.sh

# NOTE: installs Pods (admission hook), not just CRDs
kubectl apply -f https://github.com/envoyproxy/gateway/releases/download/v0.2.0-rc1/gatewayapi-crds.yaml
#kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v${GW_API_VERSION}/experimental-install.yaml

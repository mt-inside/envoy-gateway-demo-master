source 00-common.sh

# == http-log ==

kubectl kustomize --load-restrictor=LoadRestrictionsNone 05/ | kubectl apply -f -


# == httpbin ==

# kubectl apply -f https://raw.githubusercontent.com/envoyproxy/gateway/v${ENVOY_GW_VERSION}/examples/kubernetes/httpbin.yaml


watch -n1 kubectl get pods

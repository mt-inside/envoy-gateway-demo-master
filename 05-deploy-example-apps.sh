source 00-common.sh

# == http-log ==

kubectl kustomize --load-restrictor=LoadRestrictionsNone 05/ | kubectl apply -f -


# == httpbin ==

kubectl apply -f https://raw.githubusercontent.com/envoyproxy/gateway/v${ENVOY_GW_VERSION}/examples/kubernetes/httpbin.yaml
# kubectl apply -f 05a/httpbin-shim.yaml # Use this if httpbin isn't loading because the image is too big for shit wifi


watch -n1 kubectl get pods

source 00-common.sh

# == http-log ==

kubectl kustomize --load-restrictor=LoadRestrictionsNone 04/ | kubectl apply -f -


# == httpbin ==

kubectl apply -f https://raw.githubusercontent.com/istio/istio/master/samples/httpbin/httpbin.yaml
# kubectl apply -f 04a/httpbin-shim.yaml # Use this if httpbin isn't loading because the image is too big for shit wifi


watch -n1 kubectl get pods

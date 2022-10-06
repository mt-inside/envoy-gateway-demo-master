wget https://github.com/prometheus-operator/kube-prometheus/archive/refs/tags/v0.11.0.tar.gz
tar xzf v0.11.0.tar.gz
kubectl apply --server-side -f manifests/setu
kubectl wait --for condition=Established --all CustomResourceDefinition --namespace=monitoring
kubectl apply -f manifests

# There must be a better way to do this? Can't find anything in the docs
kubectl apply 20/extra-rbac.yaml

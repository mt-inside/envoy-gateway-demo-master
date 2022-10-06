# Matches the eg operator pod, on the port that the rbac-proxy container listens on.
# - This exposes only controller_runtime's built-in stats
# - The main container doesn't seem to have a stats port, just service ports
kubectl apply -f 21/eg-operator-scrape.yaml

# Matches Envoy instances
# - Prom-format stats available on the admin port, which is bounc to localhost, so un-scrapable
# - These expose only their built-in stats afaik
kubectl apply -f 21/eg-instances-scrape.yaml

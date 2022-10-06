source 00-common.sh

# TODO: calibrate mem requirements
# Don't set --network, because the docker default network is nerfed (no DNS), so let it make one
# Note: for docker driver, has --ports, if that helps (or run a client on the docker network it makes)
minikube start --kubernetes-version=${KUBERNETES_VERSION} --cpus=4 --memory=8g --driver=docker --cni=auto --embed-certs=false --feature-gates="EphemeralContainers=true" --addons="dashboard"

watch -n1 kubectl get pods -A

echo 'FYI: Minikube cluster on docker network `minikube` (type bridge)'

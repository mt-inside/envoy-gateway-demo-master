source 00-common.sh

kubectl port-forward -n kubernetes-dashboard svc/kubernetes-dashboard 8081:80

source 00-common.sh

kubectl exec -ti $(kubectl get pod -l app=sleep -o jsonpath='{.items..metadata.name}') -- /bin/sh -c "while true; do curl -I http://productpage:9080/productpage; sleep 1; done"

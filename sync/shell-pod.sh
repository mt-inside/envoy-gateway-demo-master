source 00-common.sh

kubectl exec -ti $(kubectl get pod -l app=sleep -o jsonpath='{.items..metadata.name}') /bin/sh

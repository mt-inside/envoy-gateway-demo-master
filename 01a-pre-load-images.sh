source 00-common.sh

# With 8, 9th gen, i9 cores: takes 2m15s

for i in img/${ISTIO_VERSION}/*
do
    minikube image load "$i"
done

source 00-common.sh

dir="img/${ENVOY_GW_VERSION}"
mkdir -p $dir

minikube image ls | while read i
do
    minikube image save "$i" "$dir/$(basename $i)"
done

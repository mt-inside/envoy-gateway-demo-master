set -o errexit
set -o errtrace
set -o pipefail
set -o nounset
set -o pipefail
set -o nounset
shopt -s nullglob

source 00-versions.sh

# NB: despite the Gateways saying ports 80 and 443, we have to forward to 8080 and 8443, for reasons I don't understand...
declare -r GATEWAY_PORT=8080
declare -r GATEWAY_URL=localhost:$GATEWAY_PORT
declare -r GATEWAY_PORT_SECURE=8443
declare -r GATEWAY_URL_SECURE=https://localhost:$GATEWAY_PORT_SECURE

declare -r CURL=curlie

function highlight () {
    cat - | grep --color -E "$1|$"
}

function add_yaml_key () {
    # There are at least two yq's
    # We don't currently try to support both, or indeed either; just fork the file
    # * https://github.com/kislyuk/yq (python, thin jq wrapper)
    #   * ... | yq '.spec + { shareProcessNamespace: true}'
    #   * arch
    #   * gentoo
    #   * macos (brew: python-yq)
    # * https://github.com/mikefarah/yq (go)
    #   * ... | yq w - 'spec.shareProcessNamespace' true
    #   * macos (brew: yq)
    echo
}

function minikube_ssh_notty () {
    ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i ~/.minikube/machines/minikube/id_rsa -T docker@$(minikube ip) -- $@
}

set -x

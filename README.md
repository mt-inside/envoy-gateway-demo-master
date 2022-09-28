### Prerequisites

* A GCP account and project with the `Compute` and `GKE` APIs enabled, and local configured `gcloud` client
  * Note: we will be creating a cluster of three fairly large nodes; this will not be within the free tier. There's a teardown script at the end so this doesn't stay up too long.
* Locally installed kubectl

### Sections

00 install
10 observe
20 l7 routing - ingress, traffic routing, protocol translation
30 resiliency - fault injectin, delay injection; timeouts, rate-limits, retires, cct breakers
40 security - mtls, authn & authz, security middlewear, egress
50 debugging - traffic mirroring, zero-trust networking

### Instructions

Run the scripts in order, starting at `01-*.sh`
Where the instructions say "open http://...", the actual command `open http://...` can be used on OS X and will use your default browser.

After you've finished these exercises, you can carry on with [the rest of the examples in the Istio docs](https://istio.io/docs/examples/bookinfo/#what-s-next).

# TODO
* wasm - use the normal http-log (drop the filtered one), avoid needing the mount with the filter by feching it from http (have a new script that deploys an nginx container to serve it by mounting CM into that)
* wasm - the filter should http-post what it's currently logging, so it's easier to show without diving into logs. Post it to http-log? (could be confusing) or to netcat on the host?
* try tetrate's getistio
* egress
  * on other machine
  * first, have istio initiate outbound TLS (VS & DR?)
  * initial mTLS using client cert and accepting self-signed CA (tf for certs, coreos + ignition for appliance as part of training infra)
  * then route through egress-gw (?? resources), apply auth there
  * to training
* mirroring, capture, replay
* explame of Istio Extensions API (1.7)
* WASM plugins - note to show the solo.io hub of them
* mt go through all Istio CRDs and make sure you know what they all do, to EN
* move from RBAC to v1beta1 authorization (https://istio.io/docs/tasks/security/authorization/authz-http/, https://istio.io/blog/2019/v1beta1-authorization-policy/)
* show istioctl verify-install, validate
* show istioctl analyze
* record using asciinema, check in json file?
* move scripts to oen of the bash presentation frameworks
Everything in README/sections that doesn't have a demp yet
Make me work in kind, for off-line
Shell script demo tool (from bartek at improbable): bwplotka/demo-nav
Is the internet egress policy open - need to be able to apt-get install
mTLS - how to show?
rate limits - TODO
Delays - fix up the 11s, make own file that just delays product page?
Configure retries, with exponential backoff - TODO
traffic shifting
Egress control - have something make an external call, block it to show resilience against escalating a breach eg downloading botnet / data exfiltrartion
mirroring

## Cross-cluster
* fix certs - generate root cert, sign intermediate per zone, use those in 03
  * or do the SPIFFE trust-bundle stuff, just because
* They're not using the latest version of the coredns plugin? doesn't have my no-address patch
* route via egress gw (https://istio.io/docs/examples/multicluster/gateways/)
* version-aware routing (https://istio.io/docs/examples/multicluster/gateways/)
* update cw to emit just 1.1 SEs
* use rust+bash greeter
* ressurect split bookinfo

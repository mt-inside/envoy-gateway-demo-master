source 00-common.sh

curlie -v http://$GATEWAY_URL/http-log/public
curlie -v http://$GATEWAY_URL/http-log/
curlie -v http://$GATEWAY_URL/http-log/admin

kubectl logs -l app=http-log --tail=50

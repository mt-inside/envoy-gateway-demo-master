source 00-common.sh

token="$(cat 41/pki/two.jwt | tr -d '\n')"
curlie -v http://$GATEWAY_URL/http-log/public "Authorization: Bearer $token"
curlie -v http://$GATEWAY_URL/http-log/ "Authorization: Bearer $token"
curlie -v http://$GATEWAY_URL/http-log/admin "Authorization: Bearer $token"

kubectl logs -l app=http-log --tail=50

algo=${1:?need signature algorithm}
dir=41/pki/

pushd $dir

# TODO: why can't use pem-to-jwk or pem-jwk for both? It's super-simple; write own in Go
case $algo in
    rsa)
        openssl genrsa -out private.pem 2048
        openssl rsa -in private.pem -pubout -out public.pem
        cat public.pem | docker run -i --rm docker.io/mtinside/pem2jwks | jq . > keystore.jwks
        ALG=RS256
        ;;

    ecdsa)
        echo ECDSA keys cause the YAML to apply but an envoy parse error, a log line like
        echo "2022-05-03T18:45:17.061708Z     warning envoy config    gRPC config for type.googleapis.com/envoy.config.listener.v3.Listener rejected: Error adding/updating listener(s) virtualInbound: Provider 'origins-0' in jwt_authn config has invalid local jwks: Jwks EC [x] and [y] fields have a parse error."
        echo "And that service ALLOWS ALL TRAFFIC, even if there's a blanket deny-all rule and everything else is rejecting"
        exit
        openssl ecparam -name prime256v1 -genkey -noout -out private.pem
        openssl ec -in private.pem -pubout -out public.pem
        cat public.pem | docker run -i --rm docker.io/mtinside/pem2jwks | jq . > keystore.jwks
        ALG=ES256
        ;;
esac

go install github.com/golang-jwt/jwt/v4/cmd/jwt@latest
echo '{"sub": "one", "iss": "example.local", "iat": 1234567890, "exp": 2345678901}' | jwt -key private.pem -alg $ALG -sign - > one.jwt
echo '{"sub": "two", "iss": "example.local", "iat": 1234567890, "exp": 2345678901}' | jwt -key private.pem -alg $ALG -sign - > two.jwt

echo Now update 41/jwt-auth.yaml with values from 41/pki/keystore.jwks

popd

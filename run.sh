#!/bin/bash

docker run -d \
--restart=always \
--name registry \
-v /certs:/certs \
-v /auth:/auth \
-v /mnt/registry:/var/lib/registry \
-e REGISTRY_STORAGE_DELETE_ENABLED=true \
-e "REGISTRY_AUTH=htpasswd" \
-e "REGISTRY_AUTH_HTPASSWD_REALM=Registry" \
-e REGISTRY_AUTH_HTPASSWD_PATH=/auth/reg.passwd \
-e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/origin.pem \
-e REGISTRY_HTTP_TLS_KEY=/certs/origin.key \
-e "REGISTRY_HTTP_HEADERS_X-CONTENT-TYPE-OPTIONS=[nosniff]" \
-e "REGISTRY_HTTP_HEADERS_ACCESS-CONTROL-ALLOW-ORIGIN=['https://hub.aguelsatria.web.id']" \
-e "REGISTRY_HTTP_HEADERS_ACCESS-CONTROL-ALLOW-METHODS=['HEAD', 'GET', 'OPTIONS','DELETE']" \
-e "REGISTRY_HTTP_HEADERS_ACCESS-CONTROL-ALLOW-HEADERS=['Authorization']" \
-e "REGISTRY_HTTP_HEADERS_ACCESS-CONTROL-MAX-AGE=[1728000]" \
-e "REGISTRY_HTTP_HEADERS_ACCESS-CONTROL-ALLOW-CREDENTIALS=[true]" \
-e "REGISTRY_HTTP_HEADERS_ACCESS-CONTROL-EXPOSE-HEADERS=['Docker-Content-Digest']" \
-p 5000:5000 \
registry:2
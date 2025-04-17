curl -i -XPUT http://apisix:9180/apisix/admin/routes -H "X-API-KEY: edd1c9f034335f136f87ad84b625c8f1" -d '{
    "id": "echoroute",
    "uri": "/anything/*",
    "plugins": {
        "openid-connect": {
            "client_id": "shipment",
            "client_secret": "pbQj2y1uPCzchMidI3XHLfbsRF02kYFJ",
            "discovery": "http://keycloakweb:18080/realms/delivery/.well-known/openid-configuration",
            "scope": "openid profile",
            "bearer_only": false,
            "realm": "delivery",
            "set_access_token_header":true,
            "access_token_in_authorization_header":true,
            "redirect_uri": "http://apisix:9080/anything/callback"
        }
    },
    "upstream": {
        "type": "roundrobin",
        "nodes": {
            "httpbin:80":1
        }
    }
}'

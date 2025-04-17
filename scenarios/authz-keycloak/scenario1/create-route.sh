curl -i http://127.0.0.1:9180/apisix/admin/routes -H "X-API-KEY: edd1c9f034335f136f87ad84b625c8f1" -X PUT -d '
{
    "id": "keycloak-route",
    "uri": "/articulos/*",
    "plugins": {
        "authz-keycloak": {
            "token_endpoint": "http://keycloakweb:18080/realms/delivery/protocol/openid-connect/token",
            "policy_enforcement_mode": "PERMISSIVE",
            "grant_type": "urn:ietf:params:oauth:grant-type:uma-ticket",
            "client_secret": "pbQj2y1uPCzchMidI3XHLfbsRF02kYFJ",
            "client_id": "shipment"
        }
    },
    "upstream": {
        "type": "roundrobin",
        "nodes": {
            "marketing:80":1
        }
    }
}'
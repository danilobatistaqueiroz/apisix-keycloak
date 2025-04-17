curl -XPUT http://127.0.0.1:9180/apisix/admin/routes -H "X-API-KEY: edd1c9f034335f136f87ad84b625c8f1" -d '{
    "id": "introspection-route",
    "uri": "/todo/*",
    "plugins": {
        "openid-connect": {
            "client_id": "shipment",
            "client_secret": "pbQj2y1uPCzchMidI3XHLfbsRF02kYFJ",
            "discovery": "http://keycloakweb:18080/realms/delivery/.well-known/openid-configuration",
            "introspection_endpoint": "https://keycloakweb:18443/realms/delivery/protocol/openid-connect/token/introspect",
            "scope": "openid profile",
            "bearer_only": true,
            "realm": "delivery",
            "introspection_endpoint_auth_method": "client_secret_basic",
            "logout_path": "/todo/logout"
        }
    },
    "upstream": {
        "type": "roundrobin",
        "nodes": {
            "admin:80":1
        }
    }
}'
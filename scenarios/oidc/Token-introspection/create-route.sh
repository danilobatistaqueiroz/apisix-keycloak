curl http://127.0.0.1:9180/apisix/admin/routes/configuration -H "X-API-KEY: edd1c9f034335f136f87ad84b625c8f1" -X PUT -d '
{
  "uri": "/configuration",
  "plugins":{
    "cors": {},
    "openid-connect":{
      "client_id": "shipment",
      "client_secret": "pbQj2y1uPCzchMidI3XHLfbsRF02kYFJ",
      "discovery": "http://keycloakweb:18080/realms/delivery/.well-known/openid-configuration",
      "introspection_endpoint": "https://keycloakweb:18443/realms/delivery/protocol/openid-connect/token/introspect",
      "bearer_only": false,
      "realm": "delivery",
      "introspection_endpoint_auth_method": "client_secret_basic"
    }
  },
  "upstream":{
    "type": "roundrobin",
    "nodes":{
      "delivery:3001":1
    }
  }
}'
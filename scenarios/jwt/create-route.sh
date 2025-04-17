curl http://127.0.0.1:9180/apisix/admin/routes/faq -i \
-H "X-API-KEY: edd1c9f034335f136f87ad84b625c8f1" -X PUT -d '
{
    "methods": ["GET"],
    "uri": "/faq",
    "plugins": {
        "jwt-auth": {}
    },
    "upstream": {
        "type": "roundrobin",
        "nodes": {
            "delivery:3001": 1
        }
    }
}'
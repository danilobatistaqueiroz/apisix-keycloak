curl http://127.0.0.1:9180/apisix/admin/routes/dashboard -H "X-API-KEY: edd1c9f034335f136f87ad84b625c8f1" -X PUT -d '
{
    "methods": ["GET"],
    "uri": "/dashboard",
    "plugins": {
        "basic-auth": {}
    },
    "upstream": {
        "type": "roundrobin",
        "nodes": {
            "delivery:3001": 1
        }
    }
}'
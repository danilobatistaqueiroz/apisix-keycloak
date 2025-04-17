curl -i http://127.0.0.1:9180/apisix/admin/routes/delivery \
-H "X-API-KEY: edd1c9f034335f136f87ad84b625c8f1" -X PUT -d '
{
    "plugins": {
        "key-auth": {}
    },
    "upstream": {
        "nodes": {
            "delivery:3001": 1
        },
        "type": "roundrobin"
    },
    "uri": "/delivery"
}'
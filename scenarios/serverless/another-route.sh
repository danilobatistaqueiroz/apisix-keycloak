curl "http://127.0.0.1:9180/apisix/admin/routes" -X PUT \
  -H "X-API-KEY: edd1c9f034335f136f87ad84b625c8f1" \
  -d '{
    "id": "forward-auth-route",
    "uri": "/headers",
    "plugins": {
      "forward-auth": {
        "uri": "http://127.0.0.1:9080/auth",
        "request_headers": ["Authorization"],
        "upstream_headers": ["X-User-ID"],
        "client_headers": ["X-Forward-Auth"]
      }
    },
    "upstream": {
      "nodes": {
        "httpbin.org:80": 1
      },
      "type": "roundrobin"
    }
  }'
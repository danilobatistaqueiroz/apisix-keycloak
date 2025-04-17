curl "http://127.0.0.1:9180/apisix/admin/routes" -X PUT \
  -H "X-API-KEY: edd1c9f034335f136f87ad84b625c8f1" \
  -H 'Content-Type: application/json' \
  -d '{
    "id": "auth-mock",
    "uri": "/auth",
    "plugins": {
      "serverless-pre-function": {
        "phase": "rewrite",
        "functions": [
          "return function (conf, ctx)
            local core = require(\"apisix.core\");
            local authorization = core.request.header(ctx, \"Authorization\");
            if authorization == \"123\" then
              core.response.exit(202);
            elseif authorization == \"321\" then
              core.response.set_header(\"X-User-ID\", \"i-am-user\");
              core.response.exit(201);
            else core.response.set_header(\"X-Forward-Auth\", \"Fail\");
              core.response.exit(403);
            end
          end"
        ]
      }
    }
  }' | jq
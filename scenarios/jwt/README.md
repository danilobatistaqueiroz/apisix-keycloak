      - "9180:9180/tcp" #Listen for requests to Admin API.
      - "9080:9080/tcp" #Listen for user requests.

curl http://127.0.0.1:9180/apisix/admin/consumers -H "X-API-KEY: edd1c9f034335f136f87ad84b625c8f1" -X PUT -d '
{
    "username": "dhalsim",
    "plugins": {
        "jwt-auth": {
            "key": "user-key",
            "secret": "my-secret-key"
        }
    }
}'

curl http://127.0.0.1:9180/apisix/admin/routes/1 -H "X-API-KEY: edd1c9f034335f136f87ad84b625c8f1" -X PUT -d '
{
    "methods": ["GET"],
    "uri": "/delivery",
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

jwt.io

HEADER:ALGORITHM & TOKEN TYPE
{
  "alg": "HS256",
  "typ": "JWT"
}

PAYLOAD:DATA
{
  "key": "user-key", 
  "exp": 1727274983
}

VERIFY SIGNATURE
HMACSHA256(
  base64UrlEncode(header) + "." +
  base64UrlEncode(payload),
my-secret-key
)
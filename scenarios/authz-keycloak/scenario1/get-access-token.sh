curl "http://keycloakweb:18080/realms/delivery/protocol/openid-connect/token" \
  -d "client_id=shipment" \
  -d "client_secret=pbQj2y1uPCzchMidI3XHLfbsRF02kYFJ" \
  -d "username=dhalsim" \
  -d "password=abc" \
  -d "grant_type=password" | jq
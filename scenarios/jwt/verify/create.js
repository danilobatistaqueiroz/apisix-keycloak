const jwt = require('jsonwebtoken');

require('crypto').randomBytes(64).toString('hex')

const TOKEN_SECRET="pbQj2y1uPCzchMidI3XHLfbsRF02kYFJ"

function generateAccessToken(payload) {
  return jwt.sign(payload, TOKEN_SECRET, { expiresIn: '1800s' });
}

const token = generateAccessToken({"key": "shipment"});

console.log(token);
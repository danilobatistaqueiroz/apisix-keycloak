const jwt = require('jsonwebtoken');

function authenticateToken(token) {
  const TOKEN_SECRET="my-secret-key"

  jwt.verify(token, TOKEN_SECRET, (err, ok) => {

    if (err) {
      console.log('erro:',err)
      return "403"
    }

    console.log('retorno:',ok)

  })
}

authenticateToken("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJrZXkiOiJ1c2VyLWtleSIsImlhdCI6MTc0MzI4MjkyMSwiZXhwIjoxNzQzMjg0NzIxfQ.OBiqryEWadF5Y3RQXEvtbgObKPJBOacyhq7ZZXfyZb4")
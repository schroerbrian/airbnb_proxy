express = require 'express'

#http://nodejs.org/api/modules.html
app = module.exports = express()

app.listen 4000
console.log 'Listening on port 4000'

app.get '/hello.txt', (req, res) ->
  res.send 'Hello World'

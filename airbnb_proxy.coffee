#http://expressjs.com/
express = require 'express'

#https://github.com/flatiron/nconf
nconf = require 'nconf'

# Standard JS libs
_ = require 'underscore'
require 'sugar' # extends prototypes globally


#http://nodejs.org/api/modules.html
app = module.exports = express()

app.configure ->
  # read in environment or command-line arguments first
  #  - priority is given to the first entry found, i.e. args > env > environment.config > config
  # environment options can be set like this:
  #  set/export proxy:port=12345
  #
  # argument options can be set like this:
  #  node app.js --proxy:port=12345
  nconf.argv().env()
  nconf.add 'default-file', {type: 'file', file: "config.json"}

  console.log nconf.get "airbnb:host"
  console.log nconf.get "proxy:port"

proxy_port = nconf.get "proxy:port"

app.listen proxy_port
console.log 'Listening on port:' + proxy_port

app.get '/hello.txt', (req, res) ->
  res.send 'Hello World'

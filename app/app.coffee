express = require 'express'
logger = require 'morgan'
mongoose = require 'mongoose'
bodyParser = require 'body-parser'

app = express()

# running some basic Express middleware
app.use logger 'dev'
app.use bodyParser.json()
app.use bodyParser.urlencoded extended: false

# middleware
middleware = require './config/middleware'
app.use middleware.beforeAll
app.use middleware.cors

# link to the routes file which links to all the individual routes
require('./config/routes')(app)

# connect to mongo
mongoose.connect process.env.MONGO_URL

# run Express web server
server = app.listen process.env.PORT, ->
  console.log "Serving on port #{server.address().port}"

module.exports = app

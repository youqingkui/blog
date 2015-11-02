config = require('./config')
express = require('express')
morgan = require('morgan')
compress = require('compression')
bodyParser = require('body-parser')
methodOverride = require('method-override')
session = require('express-session')

module.exports = ->
  app = express()
  if process.env.NODE_ENV == 'development'
    app.use morgan('dev')
  else if process.env.NODE_ENV == 'production'
    app.use compress()

  app.use bodyParser.urlencoded(extended: true)
  app.use bodyParser.json()
  app.use methodOverride()
  app.use session(
    saveUninitialized: true
    resave: true
    secret: config.sessionSecret)
  app.set 'views', './app/views'
  app.set 'view engine', 'jade'

  require('../app/routes/index.route') app
  require('../app/routes/sync.route') app
  app.use express.static('./public')
  app

process.env.NODE_ENV = process.env.NODE_ENV or 'development'

Mongoose = require('./config/mongoose')
express = require('./config/express')

db = Mongoose()
app = express()

app.listen 3000
module.exports = app
console.log 'Server running at http://localhost:3000/'
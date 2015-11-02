module.exports = (app) ->
  sync = require('../controllers/sync.server.controller')
  app.route '/sync'
  .get sync.listNotebooks

  app.route '/sync/test'
  .get sync.getNoteContent
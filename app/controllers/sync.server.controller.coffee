Evernote = require('evernote').Evernote
developerToken = process.env.DeveloperToken
htmlToText = require('html-to-text')

client = new Evernote.Client({
  token:developerToken
})
noteStore = client.getNoteStore('https://app.yinxiang.com/shard/s5/notestore')

exports.listNotebooks = (req, res, next) ->
  noteStore.listNotebooks (err, notebooks) ->
    console.log err if err
    return next(err) if err

    for book in notebooks
      console.log book.guid, book.name

    return res.send "ok"


exports.getNoteContent = (req, res, next) ->
  noteStore.getNoteContent '237aa896-07a4-41df-a833-a340011ef300', (err, content) ->
    return next(err) if err

    console.log content
    console.log ""
    text = htmlToText.fromString content
    console.log text
    return res.send "ok get"


exports.getNote = (req, res, next) ->
  noteStore.getNote



Evernote = require('evernote').Evernote
developerToken = process.env.DeveloperToken
htmlToText = require('html-to-text')
cheerio = require('cheerio')
marked = require('marked')

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
    $ = cheerio.load(content)
    text = ''
    $("div").each (i, item) ->
      text += $(item).text() + "\n"

    console.log "txt ==>"
    console.log text
    console.log "txt ==>"

    marked.setOptions
      highlight:(code) ->
        return require('highlight').highlightAuto(code).value


    console.log(marked(text))

    res.send "ko"




exports.getNote = (req, res, next) ->
#  noteStore.getNote




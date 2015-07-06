
restify = require('restify')
mongojs = require('mongojs')
db = mongojs('products_db',['products'])

server = restify.createServer()

server.use restify.acceptParser(server.acceptable)
server.use restify.queryParser()
server.use restify.bodyParser()

server.listen 3000, ->
  console.log "server listen 3000 "

server.get '/products', (req,res,next) ->
  db.products.find (err, products) ->
    res.writeHead 200, 'Content-Type': 'application/json; charset=utf-8'
    res.end JSON.stringify(products)
  next()

server.post '/products', (req,res,next) ->
  product = req.params
  db.products.save product, (err, data) ->
    res.writeHead 200, 'Content-Type': 'application/json; charset=utf-8'
    res.end JSON.stringify data
  next()

server.put '/products/:id', (req,res,next) ->
  db.products.findOne { id: req.params.id }, (err, data) ->
    product = {}
    for i of data
      product[i] = data[i]
    for n of req.params
      product[n] = req.params[n]
    db.products.update {id: req.params.id},product, {multi: false}, (err, data) ->
      res.writeHead 200, 'Content-Type': 'application/json; charset=utf-8'
      res.end JSON.stringify data
  next()

server.del '/products/:id', (req,res,next) ->
  db.products.remove {id: req.params.id}, (err,data) ->
    res.writeHead 200, 'Content-Type': 'application/json; charset=utf-8'
    res.end JSON.stringify true
  next()

server.get '/products/:id', (req,res,next) ->
  db.products.findOne {id: req.params.id}, (err,data) ->
    res.writeHead 200, 'Content-Type': 'application/json; charset=utf-8'
    res.end JSON.stringify data
  next()

module.exports = server


restify = require('restify')
server = require('./server')

client = restify.createJsonClient
  url: 'http://localhost:3000'

testProduct =
  id: '1'
  name: 'iPhone 6s'
  os: 'ios 8.4'
  chipset: 'iPhone 6s'
  cpu: '1.3 GHz'
  gpu: 'Gb6430'
  sensors: 'apple,iphone'
  clolors: 'Gold'

client.post '/products', testProduct, (err,req,res,product) ->
  if err
    console.log "An error ocured >>>>>>>>>>>>"
    console.log err
  else
    console.log "product saved"
    console.log product

client.get '/products', (err, req,res, products) ->
  if err
    console.log "An error ocured >>>>>>>>>>>>"
    console.log err
  else
    console.log "Product length is:" + products.length
    console.log "List all products: "
    console.log products

testProduct.price = "1000 usd"
client.put '/products/' + testProduct.id, testProduct, (err,req,res, status) ->
  if err
    console.log "An error ocured >>>>>>>>>>>>"
    console.log err
  else
    console.log "Product updated >>>>>>>>>>"
    console.log status

client.del '/products/' + testProduct.id, (err,req,res, status) ->
  if err
    console.log "An error ocured >>>>>>>>>>>>"
    console.log err
  else
    console.log "Product deleted >>>>>>>>>>"
    console.log status

client.get '/products/' + testProduct.id, (err,req,res, product) ->
  if err
    console.log "An error ocured >>>>>>>>>>>>"
    console.log err
  else
    console.log "Product show with:" + product.id
    console.log product


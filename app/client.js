// Generated by CoffeeScript 1.9.3
(function() {
  var client, restify, server, testProduct;

  restify = require('restify');

  server = require('./server');

  client = restify.createJsonClient({
    url: 'http://localhost:3000'
  });

  testProduct = {
    id: '1',
    name: 'iPhone 6s',
    os: 'ios 8.4',
    chipset: 'iPhone 6s',
    cpu: '1.3 GHz',
    gpu: 'Gb6430',
    sensors: 'apple,iphone',
    clolors: 'Gold'
  };

  client.post('/products', testProduct, function(err, req, res, product) {
    if (err) {
      console.log("An error ocured >>>>>>>>>>>>");
      return console.log(err);
    } else {
      console.log("product saved");
      return console.log(product);
    }
  });

  client.get('/products', function(err, req, res, products) {
    if (err) {
      console.log("An error ocured >>>>>>>>>>>>");
      return console.log(err);
    } else {
      console.log("Product length is:" + products.length);
      console.log("List all products: ");
      return console.log(products);
    }
  });

  testProduct.price = "1000 usd";

  client.put('/products/' + testProduct.id, testProduct, function(err, req, res, status) {
    if (err) {
      console.log("An error ocured >>>>>>>>>>>>");
      return console.log(err);
    } else {
      console.log("Product updated >>>>>>>>>>");
      return console.log(status);
    }
  });

  client.del('/products/' + testProduct.id, function(err, req, res, status) {
    if (err) {
      console.log("An error ocured >>>>>>>>>>>>");
      return console.log(err);
    } else {
      console.log("Product deleted >>>>>>>>>>");
      return console.log(status);
    }
  });

  client.get('/products/' + testProduct.id, function(err, req, res, product) {
    if (err) {
      console.log("An error ocured >>>>>>>>>>>>");
      return console.log(err);
    } else {
      console.log("Product show with:" + product.id);
      return console.log(product);
    }
  });

}).call(this);

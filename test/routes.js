(function() {
  var app, assert, cookieParser, express, request, should;

  should = require('should');

  assert = require('assert');

  request = require('supertest');

  express = require('express');

  cookieParser = require("cookie-parser");

  app = express();

  app.use(cookieParser());

  describe('Routing', function() {
    request = request('http://localhost:4000');
    return describe('Index', function() {
      return it('respond with datas', function() {
        return request.get('/').expect(200, function(err) {
          return console.log(err);
        });
      });
    });
  });

}).call(this);

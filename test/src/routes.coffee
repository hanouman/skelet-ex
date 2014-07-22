should = require('should')
assert = require('assert')
request = require('supertest')
express = require('express')
cookieParser = require("cookie-parser")


app = express();
app.use(cookieParser())

describe 'Routing', ->
  request = request('http://localhost:4000')

  describe 'Index', ->

    it 'respond with datas', ->
      request.get('/').expect 200, (err) ->
        console.log(err)

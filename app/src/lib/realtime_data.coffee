async = require("async")
socketio = require('socket.io')
moment = require('moment')

exports.listen = (server) ->
  io = socketio.listen(server)

  io.set "log level", 1

  io.sockets.on "connection", (socket) ->
    setInterval ->
      async.parallel [
        (callback) ->
           exampleQueryEs(callback)
      ], (results) ->
        io.sockets.emit "data",
          nb_shop: results
    , 1000

exampleQueryEs = (callback) ->
  qryObj =
    query:
      bool:
        must:[
          {
            "match":
              "controller" : "users"
          },
          {
          "match":
            "method" : "POST"
          }
        ]
    filter:
      range:
        time:
          from: moment().format("YYYY-MM-DD")
          to: moment().subtract('days', 6).format("YYYY-MM-DD")

  callback(qryObj)

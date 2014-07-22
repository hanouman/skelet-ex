define [
  "backbone"
  "marionette"
  "socketio"
  "namespace/config/app"
], (Backbone, Marionette, io) ->

  "use strict"

  App = new Marionette.Application()

  App.addRegions
    mainRegion: "#page-content"

  App.on "initialize:after", (options) ->
    if Backbone.history
      require ["namespace/apps/dashboard/dashboard_app"], ->
        Backbone.history.start()
        App.trigger("dashboard:show") if App.getCurrentRoute() is ""

  initialize_event_socket_io = ->
    socket = io.connect()

    socket.on "connect", ->
      App.vent.trigger "socket:connected"

    socket.on "data", (data) ->
      App.vent.trigger "data", data

    socket.on "disconnect", ->
      App.vent.trigger "socket:disconnected"

    socket.on "error", (err) ->
      console.log "ERROR: ", err

  App.addInitializer initialize_event_socket_io

  App

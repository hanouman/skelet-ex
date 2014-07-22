define [
  "underscore"
  "backbone"
  "marionette"
], (_, Backbone,marionette) ->
  "use strict"

  _.extend Backbone.Marionette.Application::,

    navigate: (route, options = {}) ->
      route = "#" + route if route.charAt(0) is "/"
      Backbone.history.navigate route, options

    getCurrentRoute: ->
      Backbone.history.fragment

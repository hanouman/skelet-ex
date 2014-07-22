require [
  "namespace/app"
  "backbone"
  "marionette"
  "underscore"
], (App, Backbone, Marionette, $, _) ->

  "use strict"

  App.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

    class Entities.User extends Backbone.Model

    class Entities.Users extends Backbone.Collection
      model: Entities.User
      url: "/users"

    API =

      getUserEntities: (cb) ->
        users = new Entities.Users
        users.fetch
  	      success: ->
            cb users
          error: (e) ->
            console.log e

    App.reqres.setHandler "user:entities", (cb) ->
      API.getUserEntities cb

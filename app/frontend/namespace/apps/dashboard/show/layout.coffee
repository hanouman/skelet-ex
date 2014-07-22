require [
  "namespace/app"
  "backbone"
  "marionette"
  "jquery"
  "underscore"
  "namespace/apps/precompiled.handlebars"
], (App, Backbone, Marionette, $, _, JST) ->

  "use strict"

  App.module "DashboardApp.Show", (Show, App, Backbone, Marionette, $, _) ->

    class Show.Layout extends Marionette.Layout
      template: JST['app/frontend/namespace/apps/dashboard/show/templates/layout.html']

      regions:
        userStat: "#user-graph"

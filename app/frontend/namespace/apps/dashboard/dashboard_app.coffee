define [
  "namespace/app"
  "namespace/apps/dashboard/show/show_controller"
], (app) ->

  "use strict"

  app.module "DashboardApp", (DashboardApp, app, Backbone, Marionette, $, _) ->

    DashboardApp.startWithParent = false;

    class DashboardApp.Router extends Backbone.Marionette.AppRouter
      appRoutes:
        "dashboard" : "showDashboard"

    API =
      showDashboard: ->
        DashboardApp.Show.Controller.showDashboard()

    DashboardApp.on "dashboard:show", ->
      Backbone.history.navigate("dashboard")
      API.showDashboard()

    app.addInitializer ->
      new DashboardApp.Router
        controller: API

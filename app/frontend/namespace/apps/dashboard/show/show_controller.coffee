require [
  "namespace/app"
  "backbone"
  "marionette"
  "jquery"
  "underscore"
  "namespace/entities/user"
  "namespace/apps/dashboard/show/layout"
  "namespace/apps/dashboard/show/user_graph"
], (App, Backbone, Marionette, $, _) ->

  "use strict"

  App.module "DashboardApp.Show", (Show, App, Backbone, Marionette, $, _) ->

    Show.Controller =

      showDashboard: ->
        @layout = @getDashboardLayout()

        @layout.on "show", =>
          App.request "user:entities", (users) =>
            @showStatUser(users)

        App.mainRegion.show @layout

      showStatUser: (users) ->
        userStatsView = @getUserStatsView users
        @layout.userStat.show userStatsView

      getDashboardLayout: ->
        new Show.Layout

      getUserStatsView: (users) ->
        new Show.UserStat
          collection: users

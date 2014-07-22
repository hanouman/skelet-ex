define [
  "namespace/app"
  "backbone"
  "marionette"
  "Chart"
  "Helpers"
  "jquery"
  "underscore"
  "namespace/apps/precompiled.handlebars"
], (App, Backbone, Marionette, chart, helper ,$, _, JST) ->

  "use strict"

  App.module "DashboardApp.Show", (Show, App, Backbone, Marionette, $, _) ->

    class Show.UserStat extends Marionette.ItemView

      template: JST['app/frontend/namespace/apps/dashboard/show/templates/user_graph.html']

      graph_id: "#graph-users"

      build_graph: ->
        ctx = $(@graph_id).get(0).getContext("2d")

        data =
          labels: ["January", "February", "March", "April", "May", "June", "July"]
          datasets: [
            {
              data: @collection.map (u) -> return u.get('count')
              fillColor : "rgba(220,220,220,0.5)"
              strokeColor : "rgba(220,220,220,1)"
              pointColor : "rgba(220,220,220,1)"
              pointStrokeColor : "#fff"
            }
        ]

        @chart = new Chart(ctx).Line data,
          scaleShowGridLines: false

      onShow: ->
        width = $(@graph_id).parent().width()
        $(@graph_id).attr("width",width)
        @build_graph()

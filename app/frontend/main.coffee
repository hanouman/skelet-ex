requirejs.config
  paths:
    jquery     : "vendor/jquery-1.11.1"
    json2      : "vendor/json2"
    bootstrap  : "vendor/bootstrap.min"
    underscore : "vendor/underscore-min"
    backbone   : "vendor/backbone-min"
    marionette : "vendor/backbone.marionette"
    handlebars : "vendor/handlebars"
    tpl        : "namespace/apps/precompiled.handlebars"
    socketio   : "vendor/socket.io.min"
    Chart      : "vendor/Chart.min"
    Helpers    : "namespace/utils/helpers"

  shim:
    helpers:
      exports: 'Helper'
    socketio:
      exports: 'io'
    tpl:
      exports: "tpl"
    json2:
      exports : "JSON"
    jquery:
      exports: "jQuery"

    underscore:
      exports: "_"

    backbone:
      deps: [
        "jquery"
        "underscore"
      ]
      exports: "Backbone"

    marionette:
      deps: [
        "jquery"
        "underscore"
        "backbone"
      ]
      exports: "Marionette"

require [
  "namespace/app"
  "jquery"
  "socketio"
  "namespace/apps/dashboard/show/show_controller"
  "namespace/config/app"
], (app,$,io) ->

  "use strict"

  app.start()

  $('#sidebar .sidebar-menu li a').on 'click', (e) ->

    $('#sidebar .sidebar-menu li a').removeClass('active')
    $(e.currentTarget).addClass('active')

  $(".sidebar-toggle-box").click (e) ->
    $("#sidebar").toggleClass "hide-left-bar"
    if $(window).width() < 750
      $("#sidebar").toggleClass "show-left-bar"
      $("#main-content").toggleClass "merge-right"
      $("#sidebar").toggleClass "hidden-xs"
    $("#main-content").toggleClass "merge-left"

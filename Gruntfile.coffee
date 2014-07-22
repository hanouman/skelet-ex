module.exports = (grunt) ->
  grunt.initConfig
    sass:
      dist:
        options:
          includePaths: ['./components/bower-bourbon']
        files: [
          expand: true
          cwd: 'app/sass'
          src: ['*.sass']
          dest: 'public/stylesheets/app'
          ext: '.css'
        ]

    coffee:
      test:
        expand: true
        cwd: 'test/src'
        src: ['**/*.coffee']
        dest: 'test/'
        ext: '.js'
      frontend:
        expand: true
        cwd: 'app/frontend'
        src: ['**/*.coffee']
        dest: 'public/js'
        ext: '.js'
      app:
        expand: true
        cwd: 'app/src'
        src: ['**/*.coffee']
        dest: 'app/compiled'
        ext: '.js'

    handlebars:
      compile:
        options:
          amd: true
        src: ["app/frontend/**/*.html"]
        dest: "public/js/namespace/apps/precompiled.handlebars.js"

    sync:
      main:
        files: [
          cwd: "app/frontend"
          src: [
            "**/*.html" # Include everything
            "!**/*.txt" # but exclude txt files
          ]
          dest: "public/js"
        ]
        verbose: true # Display log messages when copying files

    watch:
      app:
        files: ["**/*.coffee", "**/*.sass", "**/*.jade","**/*.html"]
        tasks: ["coffee","sass","handlebars:compile"]
        options:
          livereload: true

  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-sass"
  grunt.loadNpmTasks "grunt-sync"
  grunt.loadNpmTasks "grunt-contrib-handlebars"
  grunt.registerTask 'default', ['coffee', 'sass','sync','handlebars']

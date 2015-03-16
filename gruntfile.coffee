"use strict"
module.exports = (grunt) ->
  # load all grunt tasks
  require("load-grunt-tasks")(grunt)
  require("time-grunt") grunt

  # Project configuration.
  grunt.initConfig
    config:
      src: "src"
      dist: "dist"
      jsSrc   : 'src/assets/js'
      jsDist  : 'dist/assets/js'
      smSrc   : 'src/assets/js/SliceManager'
      cssSrc  : 'src/assets/css'
      cssDist : 'dist/assets/css'
      host    : 'spiech.local.com'


    coffee:
      build:
        options:
          sourceMap: true
        expand: true
        flatten: true
        cwd: '<%=config.jsSrc %>'
        src: ['*.coffee']
        dest: '<%=config.jsDist %>'
        ext: '.js'
      sm:
        options:
          join: true
        files:
          '<%=config.jsDist %>/SliceManager.js': [ '<%=config.smSrc %>/SliceManager.coffee', '<%=config.smSrc %>/Slice.coffee', '<%=config.smSrc %>/Content.coffee', '<%=config.smSrc %>/MenuItem.coffee' ]

    sass:
      build:
        options:
          sourcemap: true
          style: "compact"
          precision: 20
          lineNumbers: true
        files:
          '<%=config.cssDist %>/main.css': '<%=config.cssSrc %>/styles.scss'
          '<%=config.cssDist %>/ie.css': '<%=config.cssSrc %>/ie.scss'

    autoprefixer:
      build:
        browsers: ["last 3 version", "ie 8", "ie 7"]
        src: '<%=config.cssDist %>/main.css'

    watch:
      assemble:
        files: ["<%= config.src %>/{content,data,templates}/{,*/}*.{md,hbs,yml}"]
        tasks: ["assemble"]

      sass:
        files:'<%=config.cssSrc %>/*.scss'
        tasks: [
          'sass:build',
          'autoprefixer:build'
        ]
      coffee:
        files: '<%=config.jsSrc %>/*.coffee'
        tasks: [
          'coffee:build'
        ]
      coffeeSM:
        files: '<%=config.smSrc %>/*.coffee'
        tasks: [
          'coffee:sm'
        ]

      livereload:
        options:
          livereload: "<%= connect.options.livereload %>"

        files: [
          "<%= config.dist %>/{,*/}*.html"
          "<%= config.dist %>/assets/{,*/}*.css"
          "<%= config.dist %>/assets/{,*/}*.js"
          "<%= config.dist %>/assets/{,*/}*.{png,jpg,jpeg,gif,webp,svg}"
        ]

    connect:
      options:
        port: 9000
        livereload: 35729

        # change this to '0.0.0.0' to access the server from outside
        hostname: "<%= config.host%>"

      livereload:
        options:
          open: true
          base: ["<%= config.dist %>"]

    assemble:
      pages:
        options:
          flatten: true
          assets: "<%= config.dist %>/assets"
          partials: [
            "<%= config.src %>/templates/partials/*.hbs", "<%= config.src %>/templates/layouts/*.hbs"
          ]
          layout: false
          data: "<%= config.src %>/data/*.{json,yml}"
          helpers: "<%= config.src %>/helpers/*.coffee"
          plugins: [
            "assemble-contrib-permalinks"
            "assemble-contrib-sitemap"
          ]

        files:
          "<%= config.dist %>/": "<%= config.src %>/templates/pages/*.hbs"


    # Before generating any new files,
    # remove any previously-created files.
    clean: ["<%= config.dist %>/**/*.{html,xml}"]

    'gh-pages':
      options:
        base: 'dist'
      src: ['**']

  grunt.loadNpmTasks "assemble"
  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-gh-pages"
  grunt.registerTask "server", [
    "clean"
    "assemble"
    "sass:build"
    "autoprefixer:build"

    "coffee:build"
    "coffee:sm"
    "watch"
  ]
  grunt.registerTask "build", [
    "clean"
    "assemble"
    "sass:build"
    "autoprefixer:build"

    "coffee:build"
    "coffee:sm"
  ]
  grunt.registerTask "default", ["build"]
  return

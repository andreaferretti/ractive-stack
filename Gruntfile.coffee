mountFolder = (connect, dir)->
  return connect.static(require('path').resolve(dir))

module.exports = (grunt) ->

  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-compass')
  grunt.loadNpmTasks('grunt-contrib-connect')
  grunt.loadNpmTasks('grunt-contrib-copy')
  grunt.loadNpmTasks('grunt-contrib-requirejs')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-open')

  config =
    app: 'app'
    src: 'src/coffee'
    sass: 'src/sass'
    templates: 'src/templates'
    dist: 'dist'

    tmp: '.tmp'
    tmp_dist: '.tmp-dist'

    server_port: 9000
    livereload_port: 35729

  grunt.initConfig
    config: config
      
    watch:
      options:
        interrupt: true

      coffee:
        files: ['<%= config.src %>/{,**/}*.coffee']
        tasks: ['coffee:compile']
        
      compass:
        files: ['<%= config.sass %>/{,**/}*.{scss,sass}']
        tasks: ['compass:compile']
        
      templates:
        files: ['<%= config.templates %>/{,**/}*.html']
        tasks: ['copy:templates']
      
      files:
        files: [
          '<%= config.tmp %>/{,**/}*.{css,js,html}'
          '<%= config.app %>/{,**/}*.html'
          '<%= config.app %>/css/{,**/}*.css'
          '<%= config.app %>/js/{,**/}*.js'
          '<%= config.app %>/images/{,**/}*.{png,jpg,jpeg}'
          '!<%= config.app %>/components/**'
        ]
        tasks: []
        options:
          livereload: config.livereload_port

    connect:
      server:
        options:
          port: config.server_port
          hostname: '0.0.0.0'
          middleware: (connect)->
            return [
              require('connect-livereload')(port: config.livereload_port)
              mountFolder(connect, config.tmp)
              mountFolder(connect, config.app)
            ]

    open:
      server:
        path: 'http://localhost:<%= connect.server.options.port %>'

    clean:
      dist: ['<%= config.dist %>']
      tmp: ['<%= config.tmp %>']
      tmp_dist: ['<%= config.tmp_dist %>']
      components: ['<%= config.dist %>/components']
      templates: ['<%= config.dist %>/templates']

    coffee:
      options:
        bare: true
      compile:
        expand: true
        cwd: '<%= config.src %>'
        src: ['**/*.coffee']
        dest: '<%= config.tmp %>/js'
        ext: '.js'
        
    compass:
      options:
        sassDir: '<%= config.sass %>'
        cssDir: '<%= config.tmp %>/css'
        imagesDir: '<%= config.app %>/images'
        javascriptsDir: '<%= config.app %>/js'
        fontsDir: './css/fonts'
        importPath: ['<%= config.app %>/components']
        relativeAssets: true

      compile: 
        options:
          force: true
          outputStyle: 'compressed'
          environment: 'production'
      server:
        options:
          debugInfo: true

    copy:
      templates:
        files: [
          { expand: true, cwd: '<%= config.templates %>/', src: ['**/*.html'], dest: '<%= config.tmp %>/templates' }
        ]
      dist:
        files: [
          { expand: true, cwd: '<%= config.tmp %>/', src: ['**/*.{js,css,html}'], dest: '<%= config.tmp_dist %>/' }
          { expand: true, cwd: '<%= config.app %>/', src: ['**'], dest: '<%= config.tmp_dist %>/' }
        ]
      require:
        files: [
          {
            expand: false
            src: ['<%= config.app %>/components/requirejs/require.js']
            dest: '<%= config.tmp %>/js/require.js'
          }
        ]

    requirejs:
      compile:
        options:
          baseUrl: 'js/'
          appDir: '<%= config.tmp_dist %>'
          dir: '<%= config.dist %>'
          skipDirOptimize: true
          removeCombined: true
          keepBuildDir: true
          preserveLicenseComments: false
          mainConfigFile: '<%= config.tmp_dist %>/js/main.js'
          optimize: 'uglify'
          name: 'main'

  grunt.registerTask('compile', [
    'copy:require'
    'copy:templates'
    'coffee:compile'
  ])
  
  grunt.registerTask('server', [
    'compile'
    'compass:server'
    'connect:server'
    'open:server'
    'watch'
  ])

  grunt.registerTask('build', [
    'clean:dist'
    'clean:tmp'
    'clean:tmp_dist'
    'compile'
    'copy:dist'
    'requirejs:compile'
    'clean:tmp'
    'clean:tmp_dist'
    'clean:components'
    'clean:templates'
  ])

  grunt.registerTask('default', ['build'])

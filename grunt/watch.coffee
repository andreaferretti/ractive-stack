config =
  livereload_port: 35729

module.exports =
  options:
    interrupt: true

  coffee:
    files: ['<%= src %>/{,**/}*.coffee']
    tasks: ['coffee:compile']

  compass:
    files: ['<%= sass %>/{,**/}*.{scss,sass}']
    tasks: ['compass:compile']

  templates:
    files: ['<%= templates %>/{,**/}*.html']
    tasks: ['copy:templates']

  files:
    files: [
      '<%= tmp %>/{,**/}*.{css,js,html}'
      '<%= app %>/{,**/}*.html'
      '<%= app %>/css/{,**/}*.css'
      '<%= app %>/js/{,**/}*.js'
      '<%= app %>/images/{,**/}*.{png,jpg,jpeg}'
      '!<%= app %>/components/**'
    ]
    tasks: []
    options:
      livereload: config.livereload_port
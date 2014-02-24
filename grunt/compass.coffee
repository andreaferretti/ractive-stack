module.exports =
  options:
    sassDir: '<%= sass %>'
    cssDir: '<%= tmp %>/css'
    imagesDir: '<%= app %>/images'
    javascriptsDir: '<%= app %>/js'
    fontsDir: './css/fonts'
    importPath: ['<%= app %>/components']
    relativeAssets: true

  compile:
    options:
      force: true
      outputStyle: 'compressed'
      environment: 'production'
  server:
    options:
      debugInfo: true
module.exports =
  compile:
    options:
      baseUrl: 'js/'
      appDir: '<%= tmp_dist %>'
      dir: '<%= dist %>'
      skipDirOptimize: true
      removeCombined: true
      keepBuildDir: true
      preserveLicenseComments: false
      mainConfigFile: '<%= tmp_dist %>/js/main.js'
      optimize: 'uglify'
      name: 'main'
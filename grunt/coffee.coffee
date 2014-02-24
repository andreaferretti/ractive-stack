module.exports =
  options:
    bare: true
  compile:
    expand: true
    cwd: '<%= src %>'
    src: ['**/*.coffee']
    dest: '<%= tmp %>/js'
    ext: '.js'
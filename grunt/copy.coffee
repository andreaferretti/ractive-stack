module.exports =
  templates:
    files: [
      { expand: true, cwd: '<%= templates %>/', src: ['**/*.html'], dest: '<%= tmp %>/templates' }
    ]
  dist:
    files: [
      { expand: true, cwd: '<%= tmp %>/', src: ['**/*.{js,css,html}'], dest: '<%= tmp_dist %>/' }
      { expand: true, cwd: '<%= app %>/', src: ['**'], dest: '<%= tmp_dist %>/' }
    ]
  require:
    files: [
      {
        expand: false
        src: ['<%= app %>/components/requirejs/require.js']
        dest: '<%= tmp %>/js/require.js'
      }
    ]
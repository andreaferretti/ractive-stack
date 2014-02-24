mountFolder = (connect, dir)->
  return connect.static(require('path').resolve(dir))

config =
  server_port: 9000
  livereload_port: 35729
  app: 'app'
  tmp: '.tmp'

module.exports =
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
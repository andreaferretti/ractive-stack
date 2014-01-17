define [
  'signals'
  'hasher'
  'crossroads'
  './views/app_view'
], (signals, hasher, crossroads, App)->
  routes = 
    home: () ->
      (new App).initialize()

  crossroads.addRoute('home', routes.home)

  parseHash = (newHash, oldHash) ->
    crossroads.parse(newHash)
   
  if not hasher.getHash() then hasher.setHash('home')
  hasher.initialized.add(parseHash)
  hasher.changed.add(parseHash)
  hasher.init()

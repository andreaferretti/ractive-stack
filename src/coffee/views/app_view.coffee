define [
  'Ractive'
  'rv!templates/search.html'
  '_s'
], (Ractive, template, _s)->
  countries = [
    { name: 'Italy', population: 59859996 },
    { name: 'Mexico', population: 118395054 },
    { name: 'France', population: 65806000 },
    { name: 'Argentina', population: 40117096 },
    { name: 'Japan', population: 127290000 }
  ]

  class App
    initialize: ->
      ractive = new Ractive
        template: template
        el: '#content'
        data:
          entries: countries
          query: ''
          filter: (name, query) ->
            _s.contains(name.toLowerCase(), query)
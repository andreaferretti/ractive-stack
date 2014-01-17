define [], () ->
  prelude = require('prelude-ls')
  
  contains = prelude.Func.curry((s, t) -> s.indexOf(t) != -1)
  
  prelude.Str.contains = contains
  
  prelude.Str

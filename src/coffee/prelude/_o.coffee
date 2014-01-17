define [], () ->
  prelude = require('prelude-ls')
  
  pick = prelude.Func.curry((k, o) -> o[k])
  
  prelude.Obj.pick = pick
  
  prelude.Obj

log = require "log"

ln = (x) ->
  ret = 0
  last = (x - 1) / (x + 1)
  for i = 1, 10000, 2
    ret += (1 / i) * last
    last *= math.pow (x - 1) / (x + 1), 2
  return 2 * ret

return ln

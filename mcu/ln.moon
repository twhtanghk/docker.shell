ln = (x) ->
  ret = 0
  value = (x - 1) / (x + 1)
  last = value
  for i = 1, 10000, 2
    ret += (1 / i) * last
    last *= value * value
  return 2 * ret

return ln

string.split = (str, delim = "\r\n") ->
  result, pat, lastPos = {}, "(.-)#{delim}()", 1
  for part, pos in string.gfind(str, pat) do
    table.insert(result, part)
    lastPos = pos
  table.insert(result, string.sub(str, lastPos))
  return result

string.join = (strs, delim = ", ") ->
  table.concat strs, delim

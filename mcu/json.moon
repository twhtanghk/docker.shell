table.json = (t) ->
  ret = {}
  for k, v in pairs t do
    value = switch type(v)
      when "boolean"
        tostring(v)
      when "number"
        tostring(v)
      when "string"
        "\"#{v}\""
      when "table"
        table.json v
    if value != ""
      table.insert ret, "\"#{k}\": #{value}"
  "{#{table.concat ret, ", "}}"

require "json"
require "str"

class Req
  new: (data) =>
    lines = string.split data
    @method, @url, @version = string.match lines[1], "(.*) (.*) HTTP/(.*)"
    @headers = {}
    for line in *lines[2,] do
      key, value = string.match line, "(.*): (.*)"
      @headers[key] = value

return Req

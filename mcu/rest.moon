Req = require "req"

with net.createServer net.TCP
  \listen 80, (conn) ->
    conn\on "receive", (client, data) ->
      with client
        \send "<h1>started</h1>"
        \close()
        req = Req(data)
        print req:toJson()
        collectgarbage()

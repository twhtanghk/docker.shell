with net.createServer net.TCP
  \listen 80, (conn) ->
    with conn
      \on "receive", (client, req) ->
        with client
          \send "<h1>started</h1>"
          \close()
          print req
          collectgarbage()

GitSpace
========


#### The main class for GitSpace

    class GitSpace
      C: 'GitSpace'
      toString: -> '[object GitSpace]'


#### `constructor()`
- `config <object> {}`       initial configuration
  - `config.x <number> 123`  @todo describe
- `<undefined>`              does not return anything

@todo describe

      constructor: (config={}) ->
        M = '/gitspace/src/GitSpace.litcoffee
          GitSpace()\n  '


Make `v()`, a function for checking that `config` properties are ok. 

        v = oo.vObject M, 'config', config




Public Properties
-----------------


#### `env <string ^auto$|^dev$|^staging$|^live$|^browser$> 'auto'`
Allows `config.env` to select the runtime environment:

- `'auto'` (default)  automatically detect the environment if possible @todo
- `'dev'`             eg when running locally on your development laptop
- `'staging'`         for your staging server @todo how’s it different to live?
- `'live' `           for your production server
- `'browser'`         @todo discuss why GitSpace would be useful in a browser

        @env = v 'env <string ^auto$|^dev$|^staging$|^live$|^browser$>','auto'


#### `ip <string ^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$>`
The IP address to serve clients on. @todo improve regexp

- Typically `'127.0.0.1'` on your development laptop
- Use `process.env.OPENSHIFT_NODEJS_IP` on an OpenShift server

        @ip = v 'ip <string ^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}$>'


#### `port <integer 1-9999>`
The port to serve clients on. @todo improve valid range

- For example `8000` on your development laptop
- Use `process.env.OPENSHIFT_NODEJS_PORT` on an OpenShift server

        @port = v 'port <integer 1-9999>'


#### `dns <string ^[-a-z]{1,128}$>`
The domain name server to serve clients on. @todo improve regexp

- For example `localhost` on your development laptop
- Use `process.env.OPENSHIFT_APP_DNS` on an OpenShift server

        @dns = v 'dns <string ^[-a-z0-9]{1,128}$>'


#### `http <object>`
The Node.js 'http' server module. @todo describe more

        @http = v 'http <object>'


#### `ws <function>`
The 'ws' module, which will provide WebSocket server functionality. @todo describe

        @ws = v 'ws <function>'


#### `page <string> getDefaultPage()`
HTML to display when the HTTP server receives a GET request. @todo describe

        @page = v 'page <string>', getDefaultPage()




Private Properties
------------------

Create `@[oo._]`, a non-enumerable property with an unguessable name. 

        oo.define @, oo._, {}, 'private'


#### `_servers <object>`
@todo describe

        @[oo._]._servers = { http:null, ws:null }


#### `_db <null>`
@todo describe

        @[oo._]._db = new DB.Memory
          initial: [{ k:'hi', v:'there' },{ k:'foo', v:'bar' }]




Prevent properties being accidentally modified or added to the instance. 

        if 'GitSpace' == @C then oo.lock @




Public Methods
--------------


#### `start()`
- `yy <number> 123`  @todo describe
- `<undefined>`      does not return anything

@todo describe

      start: (yy) ->
        M = '/gitspace/src/GitSpace.litcoffee
          GitSpace::start()\n  '

Check that the arguments are valid, or fallback to defaults if undefined. 

        yy = oo.vArg M, yy, 'yy <number>', 123

Create a new HTTP and WebSocket server. @todo destroy them when `stop()` is called

        httpServer = @[oo._]._servers.http = @http.createServer()
        wsServer   = @[oo._]._servers.ws   = (new @ws.Server({ server:httpServer }))

Add event listeners to the WebSocket server. @todo remove them when `stop()` is called

        wsServer.broadcast = (data) =>
          if oo.S != oo.type data then data = JSON.stringify data
          for client in wsServer.clients
            oo data
            try
              client.send data
            catch err
              oo 'broadcast error:', err

        wsServer.on 'connection', (ws) => #@todo sometimes 'connect'?
          # oo ws # outputs a lot of info
          ws.on 'close'  , ()            => oo 'Connection closed!'
          ws.on 'error'  , (err)         => oo err
          ws.on 'message', (data, flags) =>
            if flags.binary then return
            if 'POST ' == data.substr 0, 5
              oo '>P ' + data.substr 5
              err = @[oo._]._db.update data.substr 5
              if err then ws.send "Error: #{err}"
              @[oo._]._servers.ws.broadcast @[oo._]._db.list
            else if 'hi' == data
              ws.send 'hullo yourself'

Add event listeners to the HTTP server. @todo remove them when `stop()` is called

        httpServer.on 'request', (req, res) => @onHttpRequest req, res # note `=>`
        #@todo more events

Xx. 

        oo "#{oo.T} #{oo.V} is listening at IP #{@ip} on port #{@port}"
        httpServer.listen @port, @ip




#### `onHttpRequest()`
- `request <object>`   an instance of http.IncomingMessage
- `response <object>`  an instance of http.ServerResponse
- `<undefined>`   does not return anything

@todo describe

      onHttpRequest: (request, response) ->
        M = '/gitspace/src/GitSpace.litcoffee
          GitSpace::onHttpRequest()\n  '

@todo describe

        if 'POST' == request.method
          body = '';
          request.on 'data', (chunk) -> body += chunk
          request.on 'end',  () => # note `=>`
            err = @[oo._]._db.update body
            if @[oo._]._servers.ws.clients.length
              @[oo._]._servers.ws.broadcast @[oo._]._db.list
            sendPage response, @page, @[oo._]._db, @dns, err
        else if '/favicon.ico' == request.url
          return sendFavicon response # don’t log
        else
          sendPage response, @page, @[oo._]._db, @dns

        oo 'HTTP Request for ' + request.url




Public Static Functions
-----------------------


#### `xx()`
- `yy <number> 123`  @todo describe
- `<undefined>`      does not return anything

@todo describe

    GitSpace.xx = (yy) ->
      M = '/gitspace/src/GitSpace.litcoffee
        GitSpace.xx()\n  '

Check that the arguments are valid, or fallback to defaults if undefined. 

      yy = oo.vArg M, yy, 'yy <number>', 123





Private Variables and Functions
-------------------------------

These have module-wide scope. Any code in the GitSpace module can access them. 


#### `sendFavicon()`
- `response <object>`  an instance of http.ServerResponse
- `<undefined>`  does not return anything

Xx. 

    sendFavicon = (response) ->
      M = '/gitspace/src/GitSpace.litcoffee
        sendFavicon()\n  '

      response.writeHead 200, {'Content-Type': 'image/x-icon'}
      response.end()




#### `sendPage()`
- `response <object>`  an instance of http.ServerResponse
- `page <string>`      xx
- `db <array>`         xx
- `dns <string>`       xx
- `error <object>`     an error message
- `<undefined>`  does not return anything

Xx. 

    sendPage = (response, page, db, dns, error) ->
      M = '/gitspace/src/GitSpace.litcoffee
        sendPage()\n  '

      
      list = for el in db.list
        '    <dt>' + el.k + '</dt>\n    <dd>' + el.v + '</dd>'
      page = page.replace '%db%'   , list.join '\n'
      page = page.replace '%error%', error || ''
      page = page.replace '%dns%'  , dns
      response.writeHead 200, {'Content-Type': 'text/html'}
      response.end page




#### `getDefaultPage()`
- `<string>`  the default page

Xx. 

    getDefaultPage = ->
      M = '/gitspace/src/GitSpace.litcoffee
        getDefaultPage()\n  '

      """
      <!DOCTYPE html>
      <html>
      <head>
        <meta charset="UTF-8">
        <title>Looptopia</title>
        <link rel="icon" type="image/x-icon" href="data:image/x-icon;,">
        <script>
        </script>
      </head>
      <body>
        <h1>Looptopia</h1>
        <pre id="error">%error%</pre>
        <form method="post" action="">
          <input id="k" name="k" placeholder="key">
          <input id="v" name="v" placeholder="value">
          <br>
          <input type="submit" value="Update via POST">
        </form>
        <div id="msg">Loading...</div>
        <dl id="db">
        %db%
        </dl>
        <script>
          var $error = document.getElementById('error')
            , $msg   = document.getElementById('msg')
            , $k     = document.getElementById('k')
            , $v     = document.getElementById('v')
            , $db    = document.getElementById('db')
            , $btn   = null //@todo make `null` after server disconnects itself
            , ws     = new WebSocket('ws://%dns%:8000')
          ;
          $msg.innerHTML = 'WebSocket connecting...';
          ws.onopen = function (event) {
              $msg.innerHTML = '<button id="btn">Update via WebSocket</button>';
              $btn = document.getElementById('btn');
              $btn.addEventListener('click', function () {
                  ws.send(
                      'POST'
                    + ' k=' + $k.value
                    + '&v=' + $v.value
                  );
              });
          }
          ws.onmessage = function (evt) {
              try {
                  var db = JSON.parse(evt.data);
              } catch (er) { return error.innerHTML = er; }
              for (var html=[], i=0, l=db.length; i<l; i++) {
                  if (! db[i]) continue
                  html[i] = '    <dt>' + db[i].k + '</dt>\\n'
                          + '    <dd>' + db[i].v + '</dd>';
              }
              $db.innerHTML = html.join('\\n');
          }
        </script>
      </body>
      </html>
      """


    ;

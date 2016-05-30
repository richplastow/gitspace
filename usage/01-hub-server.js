var
    GitSpace = require('../../gitspace')

    gitspace = new GitSpace({
        env:   'dev'
      , ip:    process.env.OPENSHIFT_NODEJS_IP   || '127.0.0.1'
      , port:  process.env.OPENSHIFT_NODEJS_PORT || 8000
      , dns:   process.env.OPENSHIFT_APP_DNS     || 'localhost'
      , http:  require('http')
      , ws:    require('ws')
    })
;


gitspace.start();

//@todo usage examples
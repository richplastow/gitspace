DB
==


#### Base class for all database implementations

    class DB
      C: 'DB'
      toString: -> '[object DB]'


#### `constructor()`
- `config <object> {}`                     initial configuration
  - `config.initial <array of object> []`  data to insert straight away
- `<undefined>`                            does not return anything

@todo describe

      constructor: (config={}) ->
        M = '/gitspace/src/DB.litcoffee
          DB()\n  '


Make `v()`, a function for checking that `config` properties are ok. 

        v = oo.vObject M, 'config', config




Public Properties
-----------------


#### `x <number> 123`
From `config.x`, @todo describe

        @x = v 'x <number>', 123




Private Properties
------------------

Create `@[oo._]`, a non-enumerable property with an unguessable name. 

        oo.define @, oo._, {}, 'private'




Public Methods
--------------


#### `xx()`
- `yy <number> 123`  @todo describe
- `<undefined>`      does not return anything

@todo describe

      xx: (yy) ->
        M = '/gitspace/src/DB.litcoffee
          DB::xx()\n  '

Check that the arguments are valid, or fallback to defaults if undefined. 

        yy = oo.vArg M, yy, 'yy <number>', 123




Public Static Functions
-----------------------


#### `xx()`
- `yy <number> 123`  @todo describe
- `<undefined>`      does not return anything

@todo describe

    DB.xx = (yy) ->
      M = '/gitspace/src/DB.litcoffee
        DB.xx()\n  '

Check that the arguments are valid, or fallback to defaults if undefined. 

      yy = oo.vArg M, yy, 'yy <number>', 123




    ;

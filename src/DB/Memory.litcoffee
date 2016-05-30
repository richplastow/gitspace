DB.Memory
=========


#### An in-memory database, which only persists as long as the session lasts

    class DB.Memory extends DB
      C: 'DB.Memory'
      toString: -> '[object DB.Memory]'


#### `constructor()`
- `config <object> {}`                     initial configuration
  - `config.initial <array of object> []`  data to insert straight away
- `<undefined>`                            does not return anything

@todo describe

      constructor: (config={}) ->
        M = '/gitspace/src/DB/Memory.litcoffee
          DB.Memory()\n  '

Call `DB::constructor(config)`. This will create the `@[oo._]` object. 

        super config


Make `v()`, a function for checking that `config` properties are ok. 

        v = oo.vObject M, 'config', config




Public Properties
-----------------


#### `list <[object]> []`
From `config.initial`, @todo describe

        @list = v 'initial <array of object>', []


#### `lut <object> {}`
A lookup table, kept in sync with `list`. 

        @lut = {}
        for el,i in @list
          @lut[el.k] = i




Private Properties
------------------

Create `@[oo._]`, a non-enumerable property with an unguessable name. 

        oo.define @, oo._, {}, 'private'




Public Methods
--------------


#### `update()`
- `body <string>`  @todo describe
- `<string>`       a blank string if no error occurred

@todo describe

      update: (body) ->
        M = '/gitspace/src/DB/Memory.litcoffee
          DB.Memory::update()\n  '

Get `k` and `v`, the key and value, from `body`. Also look up the index `i`. 

        match = body.match /^k=([a-z]+)&v=([a-z]*)$/
        if ! match then return "Lowercase a-z keys and values only, for now"
        k = match[1]
        v = match[2]
        i = @lut[k]

Xx.

        if oo.isU i               # true if key not known
          if '' == v then return "Value of new key '#{k}' must not be blank"
          oo 1, i, k, v
          i = @list.length
          @lut[k]  = i
          @list[i] = { k:k, v:v } # create
        else if '' == v
          oo 2, i, k, v
          @list[i] = null
          delete @lut[k]          # delete
        else
          oo 3, i, k, v
          @list[i] = { k:k, v:v } # update
        
        return '' # signifies success




Public Static Functions
-----------------------


#### `xx()`
- `yy <number> 123`  @todo describe
- `<undefined>`      does not return anything

@todo describe

    DB.Memory.xx = (yy) ->
      M = '/gitspace/src/DB/Memory.litcoffee
        DB.Memory.xx()\n  '

Check that the arguments are valid, or fallback to defaults if undefined. 

      yy = oo.vArg M, yy, 'yy <number>', 123




    ;

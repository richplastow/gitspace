01 GitSpace Constructor
=======================

    tudor.add [
      "01 GitSpace Constructor"
      tudor.is




      "The class and instance are expected types"

Prepare a test-instance. 

      -> [new GitSpace]


      "The GitSpace class is a function"
      oo.F
      -> GitSpace


      "`new` returns an object"
      oo.O
      (gitspace) -> gitspace


      tudor.equal


      "`GitSpace::C` is 'GitSpace'"
      'GitSpace'
      (gitspace) -> gitspace.C


      "`GitSpace::toString()` is '[object GitSpace]'"
      '[object GitSpace]'
      (gitspace) -> gitspace+''




      "Instance properties as expected"


      tudor.equal


      "`GitSpace::x` is the number `123`"
      123
      (gitspace) -> gitspace.x


      "`GitSpace::_x` is private, and is null"
      null
      (gitspace) -> gitspace[oo._]._x




    ];



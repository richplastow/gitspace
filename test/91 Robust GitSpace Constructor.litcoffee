91 Robust GitSpace Constructor
==============================

    if oo.ROBUSTABLE
      tudor.add [
        "91 Robust GitSpace Constructor (for modern UAs)"
        tudor.is




        "Class members are immutable in modern UAs"

Prepare a test-instance. 

        -> [new GitSpace]


        "Cannot add a property to the GitSpace class"
        oo.U
        -> GitSpace.nope = 123; GitSpace.nope


        "Cannot add a property to the GitSpace class’s prototype object"
        oo.U
        (gitspace) -> GitSpace::nope = 456; gitspace.nope


        tudor.equal


        "`GitSpace::C` is a constant"
        'GitSpace'
        (gitspace) -> gitspace.C = 'changed!'; gitspace.C



      ];


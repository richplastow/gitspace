Export Module
=============

#### The module’s only entry-point is the `GitSpace` class


Prevent properties being accidentally modified or added to the module. 
@todo automate this

    oo.lock GitSpace
    oo.lock SomeClass
    oo.lock SomeClass.FirstSubClass
    oo.lock SomeClass.SecondSubClass

First, try defining an AMD module, eg for [RequireJS](http://requirejs.org/). 

    if oo.F == typeof define and define.amd
      define -> GitSpace

Next, try exporting for CommonJS, eg for [Node.js](http://goo.gl/Lf84YI):  
`var GitSpace = require('gitspace');`

    else if oo.O == typeof module and module and module.exports
      module.exports = GitSpace

Otherwise, add the `GitSpace` class to global scope.  
Browser usage: `var gitspace = new window.GitSpace();`

    else oo.G.GitSpace = GitSpace


    ;

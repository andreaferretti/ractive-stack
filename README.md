Ractive stack
=============

This is the skeleton of a basic single page application based on

* CoffeeScript
* Require.js to manage modules
* Ractive.js for the views
* SASS and Compass for the stylesheets

I have also added a few modules that are not mandatory, but are useful common dependencies of most apps:

* Crossroads.js and Hasher to handle routing
* Prelude.ls, which is a general purpose collections and utility library
* Pajamas to fire HTTP requests and return Q promises

Finally, there are a few modules that may be useful, but possibly not for each type of application. These are in a separate `optDependencies` field in `bower.json` and are commented in `src/coffee/main.coffee`, and are

* Moment.js to handle dates and times
* Socket.io to support cross-browser websockets
* Amanda for object schema validation
* Catiline for multi-threading support via Web Workers
* Paths.js to generate SVG graphics

All of these libraries handle orthogonal concerns and integrate seamlessly with each other.

There is also a [twin example](https://github.com/andreaferretti/react-stack) with Facebook React.

Structure of the application
----------------------------

The source of the application goes under `src`; specifically `src/coffee` contains your coffeescript code, `src/templates` the Ractive templates (with `.html` extension), and `src/sass` the stylesheets. Client side dependencies are declared in `bower.json` and usually require an AMD shortcut in `src/coffee/main.coffee`.

Prelude.ls is split under different modules in `src/coffee/prelude`, namely `_l` for functions that work with lists, `_o` for objects, `_s` for strings, `_f` for functions and `_n` for numbers. This makes it easier to import the different Prelude.ls submodules directly and to augment them with other common utility functions (see `_o.pick` as an example).

Usage
-----

The skeleton uses Bower to handle client-side dependencies and Grunt to build the actual application. First, install the necessary Grunt plugins with

    npm install

and add the client side dependencies with

    bower install

Then you have the commands

    grunt server

to interactively develop the application, with auto-refresh, and

    grunt

to build a self-contained distribution of the app in the `dist` directory.

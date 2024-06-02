# The GearBird Framework
GearBird can be your fullstack framework for building Web UIs in the Windows Batch scripting language.

The beauty of Batch, is that **you can call other Batch files in a Batch file, creating a file-based component structure**, similar to React's function- or class-based component structure.

> [!CAUTION]
> This is just an experiment project. Please, for the love of God and all Holy, don't use this in production. Batch - the language used in this language - is not capable for large scale applications (or even small scale projects for this matter). If you are interested in a framework for building a web app, check out React and JavaScript. Or check out PHP, the language that this framework transpiles/compiles into for backend.

# How the layout works
All the files in the `src` directory are compiled into HTML, CSS or JavaScript files (based on file settings). These files are called "source files". The compiler loops through this directory running all files inside.

This looping for components would be bad, because even tho they compile into the file that calls them, they create an unnesesary file and steps for the compiler. This is why there is a different and separate `components` directory that stores all the components. The compiler does not run any of the files in this directory. These files are only run if they are called from another file. If they are called, they get compiled with that specific file freeing you from clutter.

The `commands` directory holds all the HTML, CSS, JavaScript and PHP tags that can be called by a source file or component. We do not recommend modifying these files unless you know exactly what you are doing. Modifying any of the files there can break your entire project.

The `runtime` directory holds the compiler script *(`compile-frontend.bat`)* and the Test/Developer server runner *(`run-testserver.bat`)* alongside the server and compiler configuration files.

The `out` directory is created when the project gets compiled. It holds all the generated HTML, CSS, JavaScript and PHP files.
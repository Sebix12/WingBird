# The WingBird Framework
WingBird can be your fullstack framework for building Web UIs in the Windows Batch scripting language.

The beauty of Batch, is that **you can call other Batch files in a Batch file, creating a file-based component structure**, similar to React's function- or class-based component structure.

> [!CAUTION]
> This is just an experiment project. Please, for the love of God and all Holy, don't use this in production. Batch - the language used in this language - is not capable for large scale applications (or even small scale projects for this matter). If you are interested in a framework for building a web app, check out React and JavaScript. Or check out PHP, the language that this framework transpiles/compiles into for backend.

# How the layout works
All the files in the `src` directory are compiled into HTML, CSS or JavaScript files (based on file settings). These files are called "source files". The compiler loops through this directory running all files inside.

This looping for components would be bad, because even tho they compile into the file that calls them, they create an unnesesary file and steps for the compiler. This is why there is a different and separate `components` directory that stores all the components. The compiler does not run any of the files in this directory. These files are only run if they are called from another file. If they are called, they get compiled with that specific file freeing you from clutter.

The `commands` directory holds all the HTML, CSS, JavaScript and PHP tags that can be called by a source file or component. We do not recommend modifying these files unless you know exactly what you are doing. Modifying any of the files there can break your entire project.

The `runtime` directory holds the compiler script *(`compile-frontend.bat`)* and the Test/Developer server runner *(`run-testserver.bat`)* alongside the server and compiler configuration files.

The `out` directory is created when the project gets compiled. It holds all the generated HTML, CSS, JavaScript and PHP files.

# Using the command line
There is a file named `wb.bat` in the root directory of your project. You can use this file to compile or run your project. To change compiler or server settings/configurations, edit the configuration files in the `runtime` directory.

## Available commands
### Displaying the current version of the command line
To display the current version of the WingBird CLI, use this command
```
wb version
```

### Compiling your project
To compile your project, use this command:
```
wb compile
```
This will do all the steps mentioned in the "How the layout works" section.

### Running the project
To run your project in your preferred/pre-set development server, use this command:
```
wb run-dev
```
This will compile and then host your server files by either using `python3` and `http.server` or by using `PHP`'s built in development server.

# Get started
Before we get started building web applications with this WingBird, here is a quick explanation of what is going on inside the provided example file `index.bat`

Here is how the file looks like in the beginning:
```bat
@echo off
cd commands\html
set component=..\..\components

call paragraph Hello World!

@REM Call google-link.bat in the source dir
call %component%\google-link

:EOF
call ..\endfile index.html
```

After turning echo off, we can see that the file enters a directory called `commands\html`. This happens because every file in the `src` directory starts from the root directory of the project (except for components). With this line we can specify the filetype/the type of commands we are going to use. For example, if we want to create a CSS file, we use `coammnds\css`, for HTML we use `coammnds\html` and so on...

Then we declare a variable named `component`. This makes it easier to call components. Using this, we don't have to type out `..\..\components\` every time we want to call a component.

After that, we execute this:
```bat
call paragraph Hello World!
```

This calls the file `paragraph.bat`. When compiling this line turns into `<p>Hello World!</p>`.

We can also create anchors/links using this method.
```bat
call link about.html Go to about page
```
This code creates an `<a>` tag that redirects users to the `about.html` page. **Note that we do not use `about.bat` when using links or referencing files basically anywhere in this framework.** Instead we use the "endfile name" of a file which we declare at the end of the file (will talk more about this later).

The next line calls a component named `google-link`
```bat
@REM Call google-link.bat in the source dir
call %component%\google-link
```
When we want to call a component, we need to prefix the component's name with `%component%\` to tell the batch file that we want to run a component instead of a tag.

The last 2 lines:
```bat
:EOF
call ..\endfile index.html
```
The first line is a goto label named `EOF`. This can be called anywhere in this file, and that skips to the end of the file and closes it.

The second line closes the file. It tells the compiler that the file ended. It moves the `compilation.temp` file that is created by the tags into the out directory where it gets renamed into an **endfile name**.

In this example, the `index.bat` file would get compiled into the file named `index.html`.

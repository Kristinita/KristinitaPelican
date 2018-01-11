# grunt-htmltidy

> Tidy HTML using htmltidy.


## Getting Started
This plugin requires Grunt `>=0.4.5`

If you haven't used [Grunt](http://gruntjs.com/) before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started) guide, as it explains how to create a [Gruntfile](http://gruntjs.com/sample-gruntfile) as well as install and use Grunt plugins. Once you're familiar with that process, you may install this plugin with this command:

```shell
npm install grunt-htmltidy --save-dev
```

Once the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript:

```js
grunt.loadNpmTasks('grunt-htmltidy');
```


## The "htmltidy" task

_Run this task with the `grunt htmltidy` command._

Tidies HTML using [htmltidy](https://github.com/vavere/htmltidy). Bugs regarding the output should be reported [here](https://github.com/vavere/htmltidy/issues/new).


### Overview
In your project's Gruntfile, add a section named `htmltidy` to the data object passed into `grunt.initConfig()`.

```js
grunt.initConfig({
  htmltidy: {
    options: {
      // Task-specific options go here.
    },
    your_target: {
      // Target-specific file lists and/or options go here.
    },
  },
});
```


### Examples
You can tidy multiple HTML files with the one target using Grunt's `files` array syntax:

```js
grunt.initConfig({
  htmltidy: {
    tidyMultiple: {
      files: [{
        expand: true,
        cwd: 'input/path',
        src: '**/*.html',
        dest: 'output/path'
      }]
    }
  }
});
```


## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality. Lint and test your code using [Grunt](http://gruntjs.com/).


## Release History

Refer to the [change log](https://github.com/gavinballard/grunt-htmltidy/blob/master/CHANGELOG.md) for a full list of changes.

---

Task submitted by [Gavin Ballard](https://github.com/gavinballard)
Thanks to [Sindre Sorhus](https://github.com/sindresorhus)

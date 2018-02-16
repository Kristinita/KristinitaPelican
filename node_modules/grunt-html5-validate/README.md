# grunt-html5-validate

A simpler, kinder Grunt plugin for Mozilla's HTML5 Linter.

## Getting Started

This plugin requires Grunt.

If you haven't used [Grunt](http://gruntjs.com/) before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started) guide, as it explains how to create a [Gruntfile](http://gruntjs.com/sample-gruntfile) as well as install and use Grunt plugins. Once you're familiar with that process, you may install this plugin with this command:

```shell
npm install grunt-html5-validate --save-dev
```

Once the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript:

```js
grunt.loadNpmTasks('grunt-html5-validate');
```

## The `html5validate` task

In your project's Gruntfile, add a section named `mozilla_html5_lint` to the data object passed into `grunt.initConfig()`.

```js
grunt.initConfig({
  html5validate: {
    src: 'dist/*.html',
  },
})

grunt.registerTask('default', ['html5validate']);
```

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality. Lint and test your code using [Grunt](http://gruntjs.com/).

## License
Copyright (c) 2016 [Ricardo Gladwell](https://gladwell.me). Licensed under the MIT license.

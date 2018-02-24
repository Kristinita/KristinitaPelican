# grunt-project-update [![Build Status](https://travis-ci.org/snailjs/grunt-project-update.png?branch=master)](https://travis-ci.org/snailjs/grunt-project-update)

> Grunt task to update bower, npm, and other arbitrary update tasks

## Getting Started
This plugin requires Grunt `~0.4.2`

If you haven't used [Grunt](http://gruntjs.com/) before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started) guide, as it explains how to create a [Gruntfile](http://gruntjs.com/sample-gruntfile) as well as install and use Grunt plugins. Once you're familiar with that process, you may install this plugin with this command:

```shell
npm install grunt-project-update --save-dev
```

Once the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript:

```js
grunt.loadNpmTasks('grunt-project-update');
```

## The "projectUpdate" task

### Overview

To activate plugin please define a default config similar to this.

```js
grunt.initConfig({
  projectUpdate: {
    update: {}
  }
})
```

It will autodetect `package.json` and `bower.json` and update them appropriately.
This requires you have `npm` and/or `bower` installed globally.

### Options

#### commands
Type: `Array`
Default value: []

An array of commands to run in this format
```js
{cmd: 'npm', args: ['prune']}
```

or with the CWD (current working directory)
```js
{cmd: 'npm', args: ['prune'], opts: {cwd: '/foo'}}
```

This is useful for specifying custom commands to run during the update.

#### cwd
Type: `String`
Default value: null

This will change the current working directory the commands are ran in.

If say bower is in a different folder use two separate targets like so:

```js
grunt.initConfig({
  projectUpdate: {
    npm: {},
    bower: {cwd: 'assets'}
  }
})
```

#### npm
Type: `Boolean`
Default value: false

This will enable or disable `npm` explicitly.

#### bower
Type: `Boolean`
Default value: false

This will enable or disable `bower` explicitly.

### Usage Examples

#### Default Usage

The default functionality will auto detect bower and npm and update them
appropriately.

```js
grunt.initConfig({
  projectUpdate: {
    update: {}
  }
})
```

#### Enable NPM/Bower Explicitly

If you have non-standard file locations use something like this:

```js
grunt.initConfig({
  projectUpdate: {
    update: {
      npm: true,
      bower: true
    }
  }
})
```

#### Arbitrary Commands

To add your own arbitrary commands try this:

```js
grunt.initConfig({
  projectUpdate: {
    update: {
      npm: true,
      bower: true,
      commands: [
        {cmd: 'my-package-manager', args: ['install']},
        {cmd: 'my-package-manager', args: ['update']},
        {cmd: 'my-package-manager', args: ['prune']}
      ]
    }
  }
})
```

Just not that commands set there are used first and then the others will be ran.

## Contributing
Commits and changes are welcome.

Please follow the NPM coding style: https://npmjs.org/doc/coding-style.html

## Release History

### 0.2.4
* Fixes #2 which would enable npm if `package.json` exists even if npm is
specifically disabled at runtime
* Changed the order to prune, install, update to stop the update of
packages that have been dropped

### 0.2.3
* Fixed issue with working directories on custom commands

### 0.2.2
* Updated project properties for package.json

### 0.2.1
* Updated project name in package.json

### 0.2.0
* API rewrite with automatic package manager detection.

### 0.1.0
* Initial release and port from custom task right in the gruntfile

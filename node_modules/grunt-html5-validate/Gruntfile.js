/*
 * Copyright (c) 2016 Ricardo Gladwell
 * Licensed under the MIT license.
 */

'use strict';

module.exports = function (grunt) {
  require('load-grunt-tasks')(grunt);

  grunt.initConfig({
    jshint: {
      all: [
        'Gruntfile.js',
        'tasks/*.js',
        '<%= nodeunit.tests %>'
      ],
      options: {
        jshintrc: '.jshintrc',
        reporter: require('jshint-stylish')
      }
    },

    html5validate: {
      valid: {
        src: 'test/fixtures/valid.html'
      }
    },

    nodeunit: {
      tests: ['test/*_test.js']
    }

  });

  grunt.loadTasks('tasks');

  grunt.registerTask('test', ['html5validate', 'nodeunit']);
  grunt.registerTask('default', ['jshint', 'test']);

};

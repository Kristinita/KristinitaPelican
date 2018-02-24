/*
 * grunt-project-update
 * https://github.com/snailjs/grunt-project-update
 *
 * Copyright (c) 2013 Bryan Tong
 * Licensed under the LGPLv3 license.
 */


/**
 * Grunt config
 * @param {object} grunt
 */
module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    jshint: {
      all: [
        'gruntfile.js',
        'tasks/*.js',
        '*.test.js'
      ],
      options: {
        jshintrc: '.jshintrc'
      }
    },
    clean: {
      tests: ['tmp']
    },
    mochaTest: {
      src: ['*.test.js']
    },
    watch: {
      files: ['*.js'],
      tasks: ['test']
    },
    projectUpdate: {
      update: {npm: true}
    }
  })

  // Actually load this plugin's task(s).
  grunt.loadTasks('tasks')
  // These plugins provide necessary tasks.
  grunt.loadNpmTasks('grunt-mocha-test')
  grunt.loadNpmTasks('grunt-contrib-jshint')
  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-watch')
  //tasks
  grunt.registerTask('test', ['mochaTest'])
  grunt.registerTask('update',['projectUpdate'])
  grunt.registerTask('default', ['jshint', 'test', 'watch'])

}

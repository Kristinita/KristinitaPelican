/*
 * grunt-posthtml
 * https://github.com/TCotton/grunt-posthtml
 *
 * Copyright (c) 2015 Andy Walpole
 * Licensed under the MIT license.
 */

'use strict';

var posthtml = require('posthtml');

/**
 *
 * @param file {string}
 * @param grunt {object}
 */
function validation(file, grunt) {

  if (!file) {
    grunt.log.warn('grunt-posthtml: No files have been specified');
    return;
  }

  if (!grunt.file.exists(file)) {
    grunt.log.warn('grunt-posthtml: Source file "' + file + '" not found.');
  }

}

module.exports = function(grunt) {

  grunt.registerMultiTask('posthtml', 'PostHMTL Grunt Plugin', function() {
    // Merge task-specific and/or target-specific options with these defaults.
    var options = this.options({
      use: [],
      singleTags: [],
      closingSingleTag: 'default',
      skipParse: null,
      sync: null
    });

    var plugins;

    if (!Array.isArray(options.use) || options.use.length === 0) {
      grunt.log.warn('grunt-posthtml: You must specify the PostHTML plugins you wish to use in the configuration');
    } else {
      plugins = options.use;
      delete options.use;
    }

    this.files.forEach(function(file) {

      validation(file.src[0], grunt);

      var content = grunt.file.read(file.src[0]);

      posthtml(plugins)
        .process(content, options)
        .then(function(result) {
          grunt.file.write(file.dest, result.html);
        });

    });

  });

};
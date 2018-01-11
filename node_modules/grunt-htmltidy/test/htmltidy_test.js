'use strict';
var grunt = require('grunt');

exports.htmltidy = {
  compile: function(test) {
    test.expect(1);

    var actual = grunt.file.read('tmp/test.html');
    var expected = grunt.file.read('test/expected/test.html');
    test.equal(actual, expected, 'should tidy HTML');

    test.done();
  },
  compileMultiple: function(test) {
    test.expect(2);

    // Test first file.
    var actual1 = grunt.file.read('tmp/multiple1.html');
    var expected1 = grunt.file.read('test/expected/multiple1.html');
    test.equal(actual1, expected1, 'should tidy HTML for first multiple file');

    // Test second file.
    var actual2 = grunt.file.read('tmp/multiple1.html');
    var expected2 = grunt.file.read('test/expected/multiple1.html');
    test.equal(actual2, expected2, 'should tidy HTML for second multiple file');

    test.done();
  },
  empty: function(test) {
    test.expect(1);

    test.ok(!grunt.file.exists('tmp/idontexist.html'), 'Empty tidied file should not exist');

    test.done();
  }
};

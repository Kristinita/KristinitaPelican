#############
# Uglify JS #
#############
# JavaScript minifier:
# http://lisperator.net/uglifyjs/
# https://www.npmjs.com/package/grunt-contrib-uglify
# Options:
# http://lisperator.net/uglifyjs/compress
# [INFO] I selected Uglify JS, not alternatives, because they obsolete:
# Esmangle:
# https://github.com/estools/esmangle
# Closure-compiler:
# https://github.com/gmarty/grunt-closure-compiler
# [INFO] Benchmark:
# https://evmar.github.io/js-min-bench/
module.exports =
	options:
		# [LEARN][CSS][JAVASCRIPT] Sourcemaps
		# make debugging simply, if styles and scripts combine and compress:
		# https://blog.teamtreehouse.com/introduction-source-maps
		sourceMap: true
	uglifypersonal:
		files: [
			expand: true
			cwd: "<%= templates.yamlconfig.OUTPUT_PATH %>/js/personal"
			# [LEARN][GRUNT] “!” symbol — exclude paths:
			# https://stackoverflow.com/a/28277841/5951529
			src: ['**/*.js'
					'!**/*.min*js']
			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/js/personal"
			# [LEARN][GRUNT] Extensions in filepaths:
			# https://gruntjs.com/configuring-tasks#building-the-files-object-dynamically
			ext: '.min.js'
			]
	uglifytheme:
		files: [
			expand: true
			cwd: "<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/js"
			src: ['**/*.js'
					'!**/*.min*js']
			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/js"
			ext: '.min.js'
			]

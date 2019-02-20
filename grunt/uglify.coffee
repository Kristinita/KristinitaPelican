#############
# Uglify JS #
#############
# JavaScript minifier:
# http://lisperator.net/uglifyjs/
# https://www.npmjs.com/package/grunt-contrib-uglify
# Options:
# http://lisperator.net/uglifyjs/compress
# I select it, not alternatives, because they obsolete:
# Esmangle:
# https://github.com/estools/esmangle
# Closure-compiler:
# https://github.com/gmarty/grunt-closure-compiler
module.exports =
	options:
		# [LEARN][CSS][JAVASCRIPT] Sourcemaps
		# make debugging simply, if styles and scripts combine and compress:
		# https://blog.teamtreehouse.com/introduction-source-maps
		sourceMap: true
	uglifypersonal:
		files: [
			expand: true
			cwd: "<%= templates.paths.output_path %>/js/personal"
			# “!” symbol — exclude paths:
			# https://stackoverflow.com/a/28277841/5951529
			src: ['**/**/*.js'
					'!**/**/*.min.js']
			dest: "<%= templates.paths.output_path %>/js/personal"
			# Extensions in filepaths:
			# https://gruntjs.com/configuring-tasks#building-the-files-object-dynamically
			ext: '.min.js'
			]
	uglifytheme:
		files: [
			expand: true
			cwd: "<%= templates.paths.output_path %>/<%= templates.yamlconfig.theme_static_dir %>/js"
			src: ['**/**/*.js'
					'!**/**/*.min.js']
			dest: "<%= templates.paths.output_path %>/<%= templates.yamlconfig.theme_static_dir %>/js"
			# Extensions in filepaths:
			# https://gruntjs.com/configuring-tasks#building-the-files-object-dynamically
			ext: '.min.js'
			]

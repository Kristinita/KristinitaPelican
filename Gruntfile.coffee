# @Author: Kristinita
# @Date:   2017-04-05 20:11:18
# @Last Modified time: 2017-04-11 08:20:09

# Grunt apply for files dynamically:
# https://gruntjs.com/configuring-tasks#building-the-files-object-dynamically

# [DONE]
# https://superuser.com/q/1198421/572069
# [BUG] In ConEmu background color = Grunt output color
# https://github.com/gruntjs/grunt/issues/1589
# Temporarily solution — using --no-color argument
# https://stackoverflow.com/a/23550493/5951529

# [DONE]
# Node.js 10.0.0 bugs:
# 1. node::contextify::ContextifyScript
# https://github.com/gulpjs/gulp/issues/2162
# 2. npm ERR cb() never called
# https://stackoverflow.com/a/15483897/5951529

###########################
## Loading Grunt plugins ##
###########################

module.exports = (grunt) ->

	###
	Rename “htmllint” task of grunt-html to “html-vnu”,
	because same name have task of grunt-htmllint:
	https://stackoverflow.com/a/13880658/5951529
	https://gruntjs.com/api/grunt.task#grunt.task.renametask
	###
	grunt.loadNpmTasks 'grunt-html'
	# Comma required, I can't get similar behavior, use indentation:
	grunt.renameTask 'htmllint', 'html-nu'

	#######################
	## load-grunt-config ##
	#######################
	# Configure Gruntfile.coffee to multiple files.
	# https://npmjs.org/package/load-grunt-config
	# https://www.html5rocks.com/en/tutorials/tooling/supercharging-your-gruntfile/
	# Use load-grunt-tasks
	# https://github.com/sindresorhus/load-grunt-tasks
	# doesn't write “grunt.loadNpmTasks 'task'” each time
	# [WARNING] Do not use grunt-lazyload! It conflicting plugin
	# https://www.npmjs.com/package/grunt-lazyload
	require('load-grunt-config') grunt

	################
	## grunt-time ##
	################
	# Show time for Grunt tasks:
	# https://github.com/sindresorhus/time-grunt
	require('time-grunt') grunt

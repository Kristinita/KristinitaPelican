# @Author: Kristinita
# @Date:   2017-04-05 20:11:18
# @Last Modified time: 2017-04-11 08:20:09

# [BUG] In ConEmu background color = Grunt output color
# https://github.com/gruntjs/grunt/issues/1589
# Temporarily solution — using --no-color argument
# https://stackoverflow.com/a/23550493/5951529

# Grunt apply for files dynamically:
# https://gruntjs.com/configuring-tasks#building-the-files-object-dynamically

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
	require('load-grunt-config')(grunt)

	################
	## grunt-time ##
	################
	# Show time for Grunt tasks:
	# https://github.com/sindresorhus/time-grunt
	require('time-grunt')(grunt)

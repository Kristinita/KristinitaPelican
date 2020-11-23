###
@Author: Kristinita
@Date:   2017-04-05 20:11:18
@Last Modified time: 2017-04-11 08:20:09
###
#########################
# Loading Grunt plugins #
#########################
module.exports = (grunt) ->


	###
	[NOTE] Even if you use load-grunt-tasks and load-grunt-config, you need
	manually load all tasks, which don’t contain “grunt” word in the name:
	https://www.npmjs.com/package/load-grunt-tasks#pattern
	###
	grunt.loadNpmTasks 'merge-source-maps'


	###
	[INFO] Rename “htmllint” task of grunt-html to “html-nu”,
	because same name have task of grunt-htmllint:
	https://stackoverflow.com/a/13880658/5951529
	https://gruntjs.com/api/grunt.task#grunt.task.renametask
	###
	grunt.loadNpmTasks 'grunt-html'
	# [REQUIRED] Comma; I can’t get similar behavior, use indentation:
	grunt.renameTask 'htmllint', 'html-nu'


	#####################
	# load-grunt-config #
	#####################
	###
	[OVERVIEW] Configure “Gruntfile.coffee” to multiple files.
	https://npmjs.org/package/load-grunt-config
	https://www.html5rocks.com/en/tutorials/tooling/supercharging-your-gruntfile/

	[INFO] Use load-grunt-tasks, so that
	doesn’t write “grunt.loadNpmTasks 'task'” each time:
	https://github.com/sindresorhus/load-grunt-tasks

	[NOTE] Do not use grunt-lazyload with load-grunt-config both! It conflicting plugin:
	https://www.npmjs.com/package/grunt-lazyload
	[NOTE] Not possible use subtasks in separate files:
	https://github.com/firstandthird/load-grunt-config/issues/178
	###
	require('load-grunt-config') grunt


	##############
	# grunt-time #
	##############
	###
	[OVERVIEW] Show time for Grunt tasks:
	https://github.com/sindresorhus/time-grunt
	###
	require('time-grunt') grunt


	###########
	# Closure #
	###########
	###
	[INFO] Use Closure Compiler in Grunt:
	https://github.com/google/closure-compiler-npm/blob/master/packages/google-closure-compiler/docs/grunt.md

	[NOTE] We need initialize Closure via “require”,
	not as another Grunt plugins.


	[INFO] Java arguments as JVM memory available:
	https://bit.ly/closure__extrajava-arguments--grunt-and-gulp
	https://www.programmersought.com/article/47811098599/

	[REQUIRED] Comma after “grunt”
	###
	require('google-closure-compiler').grunt grunt,
		# [INFO] Compiler version; I use default value
		platform: [
			'native'
			'java'
			'javascript'
		]
		# [INFO] Number of parallel compilations
		max_parallel_compilations: require('os').cpus().length

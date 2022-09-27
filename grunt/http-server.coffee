#####################
# grunt-http-server #
#####################
###
[OVERVIEW] Local server for Grunt.

[INFO] For my project I use it with clean-console, checkPages and pageres:
https://divhide.com/node-grunt-http-server-1-x/
###
module.exports =

	'dev-http-server':
		###
		[INFO] “Specify "0.0.0.0" to be available everywhere”:
		https://divhide.com/node-grunt-http-server-1-x/#configuration
		###
		host: "0.0.0.0"

		# [BUG] clean-console PhantomJS doesn’t support https
		https: false
		port: 4147

		# [INFO] If true, run parallel with other tasks
		runInBackground: true
		root: "<%= templates.paths.cwd %>"

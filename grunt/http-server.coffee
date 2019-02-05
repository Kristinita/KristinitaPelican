#####################
# grunt-http-server #
#####################
# Local server for Grunt.
# Run, for example, that take pageres screenshots:
# https://divhide.com/node-grunt-http-server-1-x/
module.exports =
	# For grunt-clean-console:
	# https://www.npmjs.com/package/grunt-clean-console
	'clean-console-server':
		# [INFO] “Specify "0.0.0.0" to be available everywhere”:
		# https://divhide.com/node-grunt-http-server-1-x/#configuration
		host: "0.0.0.0"
		# [BUG] clean-console PnahtomJS doesn't support https
		https: false
		port: 4147
		# If true, run parallel with other tasks
		runInBackground: true
		root: "<%= templates.paths.cwd %>"

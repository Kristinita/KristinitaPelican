#####################
# grunt-http-server #
#####################
# Local server for Grunt.
# Run, for example, that take pageres screenshots:
# https://divhide.com/node-grunt-http-server-1-x/
module.exports =
	server:
		# “Specify "0.0.0.0" to be available everywhere”
		host: "0.0.0.0"
		https: true
		port: 8282
		# If true, run parallel with other tasks
		runInBackground: true
		root: "."

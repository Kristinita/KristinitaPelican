########################
## grunt-browser-sync ##
########################
# Live Reloading
# https://github.com/BrowserSync/grunt-browser-sync
module.exports =
	bsFiles:
		src : ['output/theme/css/**/*.css', 'output/theme/css/**/**/*.css', 'output/theme/js/**/*.js']
	options:
		server:
			baseDir: "../"
		# localtunnel doesn't work, see:
		# https://github.com/BrowserSync/browser-sync/issues/1513
		tunnel: false
		plugins: [
			###################
			## html-injector ##
			###################
			# That HTML don't refresh, if I change HTML file:
			# https://github.com/shakyshane/html-injector
			# JavaScript needs refresh, see
			# https://stackoverflow.com/q/30762114/5951529
			module: "bs-html-injector"
			options:
				files: "<%= templates.paths.html %>"
			]
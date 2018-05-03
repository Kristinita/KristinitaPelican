########################
## grunt-browser-sync ##
########################
# Live Reloading:
# https://www.npmjs.com/package/grunt-browser-sync
module.exports =
	bsFiles:
		src : ['<%= templates.paths.theme %>/css/**/*.css', '<%= templates.paths.theme %>/css/**/**/*.css', \
				'<%= templates.paths.theme %>/js/**/*.js']
	options:
		# Doesn't open “http://localhost:3001/” tab, when BrowserSync start:
		# https://browsersync.io/docs/options#option-open
		open: false
		port: 3000
		server:
			baseDir: '../'
		# localtunnel doesn't work, see:
		# https://github.com/BrowserSync/browser-sync/issues/1513
		tunnel: false
		plugins: [
			###################
			## html-injector ##
			###################
			# That HTML don't refresh, if I change HTML file:
			# https://github.com/shakyshane/html-injector
			# JavaScript needs refresh:
			# https://stackoverflow.com/q/30762114/5951529
			# If I change HTML or CSS in HTML file, I need save file, that to see changes in browser.
			# Else I change JavaScript in HTML file, I need save file 2 times,
			# that HTML page reload in browser and I can to see changes in browser.
			module: "bs-html-injector"
			options:
				files: "<%= templates.paths.html %>"
			]

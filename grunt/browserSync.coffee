########################
## grunt-browser-sync ##
########################
# Live Reloading:
# https://www.npmjs.com/package/grunt-browser-sync
module.exports =
	dev:
		bsFiles:
			src: ["<%= templates.yamlconfig.output_path %>/**/**/*.min.css"
					"<%= templates.yamlconfig.output_path %>/**/*.min.js"]
		options:
			# Doesn't open “http://localhost:3001/” tab, when BrowserSync start:
			# https://browsersync.io/docs/options#option-open
			open: false
			port: 3000
			server:
				baseDir: "<%= templates.paths.output_path %>"
			###############
			# Localtunnel #
			###############
			# Share localhost to temporary URL address;
			# Ngrok is Localtunnel alternative.
			# https://localtunnel.github.io/www/
			# [FIXED]
			# # localtunnel doesn't work, see:
			# # https://github.com/BrowserSync/browser-sync/issues/1513
			tunnel: true
			plugins: [
				######################
				## bs-html-injector ##
				######################
				# That HTML don't refresh, if I change HTML file:
				# https://www.npmjs.com/package/bs-html-injector
				# JavaScript needs refresh:
				# https://stackoverflow.com/q/30762114/5951529
				# If I change HTML or CSS in HTML file, I need save file, that to see changes in browser.
				# Else I change JavaScript in HTML file, I need save file 2 times,
				# that HTML page reload in browser and I can to see changes in browser.
				module: "bs-html-injector"
				options:
					files: "<%= templates.paths.html %>"
				]
			# Ingegrate “watch” task:
			# https://browsersync.io/docs/grunt#grunt-watch
			# [NOTE] Needs run “grunt browserSync watch”, not “grunt browserSync”, that it works:
			# https://seenukarthi.com/devtools/2016/02/19/jekyll-livereload-with-grunt/
			watchTask: true

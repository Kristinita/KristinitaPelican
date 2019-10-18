##############
# cache-bust #
##############
# Add hash to CSS and JS files for using Cache-Control — immutable:
# https://medium.com/pixelpoint/best-practices-for-cache-control-settings-for-your-website-ff262b38c5a2
# https://www.npmjs.com/package/grunt-cache-bust
# Options:
# https://www.npmjs.com/package/grunt-cache-bust#options
module.exports =
	# Example configuration:
	# https://github.com/hollandben/grunt-cache-bust/issues/184#issuecomment-194817782
	options:
		# [NOTE] Works solely for this combination “assets” and “baseDir”
		# [NOTE] If “.css”, not “.min.css”, cacheBust not change HTML
		assets: ["**/*.min.{css,js}"]
		baseDir: "<%= templates.yamlconfig.OUTPUT_PATH %>"
		# [INFO] Add hashes for absolute URLs filenames:
		# https://www.npmjs.com/package/grunt-cache-bust#optionsurlprefixes
		# [WARNING] Don't add trailing slash!
		urlPrefixes: ["<%= templates.yamlconfig.SITEURL %>"]
	assets:
		files: [
			cwd: "<%= templates.yamlconfig.OUTPUT_PATH %>"
			expand: true
			src: ["**/*.html"]
			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>"
		]

##############
# cache-bust #
##############
###
[OVERVIEW] Add hash to CSS and JS files for using Cache-Control — immutable:
https://medium.com/pixelpoint/best-practices-for-cache-control-settings-for-your-website-ff262b38c5a2
https://www.npmjs.com/package/grunt-cache-bust

[OPTIONS]
https://www.npmjs.com/package/grunt-cache-bust#options

[FIXME] This cache-bust configuration doesn’t work for root html files as “index.html”
###
module.exports =
	###
	[INFO] Example configuration:
	https://github.com/hollandben/grunt-cache-bust/issues/184#issuecomment-194817782
	###
	options:
		###
		[NOTE] Plugin works solely for this combination “assets” and “baseDir”

		[NOTE] If “.css”, not “.min.css”, cacheBust will not change HTML
		###
		assets: ["**/*.min.{css,js}"]
		baseDir: "<%= templates.yamlconfig.OUTPUT_PATH %>"
		###
		[INFO] Add hashes for absolute URLs filenames:
		https://www.npmjs.com/package/grunt-cache-bust#optionsurlprefixes

		[NOTE] Don’t add trailing slash!
		###
		urlPrefixes: ["<%= templates.yamlconfig.SITEURL %>"]

	assets:
		files: [
			cwd: "<%= templates.yamlconfig.OUTPUT_PATH %>"
			expand: true
			src: ["**/*.html"]
			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>"
		]

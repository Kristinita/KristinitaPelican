############
# critical #
############
###
Inline critical CSS for PageSpeed Insights:
https://www.npmjs.com/package/critical
http://prgssr.ru/development/razbiraemsya-s-kritichnym-css.html
https://medium.com/web-standards/critical-and-progressive-css-d6611f034d7d
Grunt wrapper:
https://www.npmjs.com/package/grunt-critical
Penthouse:
https://www.npmjs.com/package/penthouse
https://www.npmjs.com/package/grunt-penthouse
[NOTE] Doesn't need special “mobile” critical CSS:
https://github.com/pocketjoso/penthouse/issues/171#issuecomment-320516807
I use default 1300/900 size.
Options:
https://www.npmjs.com/package/critical#usage
https://www.npmjs.com/package/critical#options
[NOTE] Critical use Penthouse + Puppeteer, but I don't use Penthouse direct, because Critical
automatically inject CSS to HTML:
https://www.npmjs.com/package/critical#when-should-i-just-use-penthouse-directly
[NOTE] CSS should be duplicated in external CSS document:
1. Cache in external CSS
2. Problems with multiple HTML, linked to single CSS
https://stackoverflow.com/a/34145199/5951529
###
module.exports =
	dist:
		options:
			# [INFO] Removing the critical CSS per page results in a unique async loaded CSS file for every page:
			# https://www.npmjs.com/package/critical#options
			extract: false
		files: [
			expand: true
			cwd: "."
			src: ["<%= templates.paths.html %>"
					# [INFO] HTML for Bitcoin images
					"!<%= templates.yamlconfig.OUTPUT_PATH %>/images/**/*.html"
					# [FIXME] Templates for Pelican
					"!<%= templates.yamlconfig.OUTPUT_PATH %>/author/*.html"
					"!<%= templates.yamlconfig.OUTPUT_PATH %>/category/*.html"
					"!<%= templates.yamlconfig.OUTPUT_PATH %>/tag/*.html"
					"!<%= templates.yamlconfig.OUTPUT_PATH %>/archives.html"
					"!<%= templates.yamlconfig.OUTPUT_PATH %>/authors.html"
					"!<%= templates.yamlconfig.OUTPUT_PATH %>/categories.html"
					]
			dest: "."
			]
		# src: "<%= templates.yamlconfig.OUTPUT_PATH %>/Programs/KristinitaLuckyLink.html"
		# dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/Programs/KristinitaLuckyLink.html"

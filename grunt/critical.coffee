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
			src: ["<%= templates.paths.output_path %>/**/*.html"
					# [INFO] HTML for Bitcoin images
					"!<%= templates.paths.output_path %>/images/**/*.html"
					# [FIXME] Templates for Pelican
					"!<%= templates.paths.output_path %>/author/*.html"
					"!<%= templates.paths.output_path %>/category/*.html"
					"!<%= templates.paths.output_path %>/tag/*.html"
					"!<%= templates.paths.output_path %>/archives.html"
					"!<%= templates.paths.output_path %>/authors.html"
					"!<%= templates.paths.output_path %>/categories.html"
					]
			dest: "."
			]
		# src: "<%= templates.paths.output_path %>/Programs/KristinitaLuckyLink.html"
		# dest: "<%= templates.paths.output_path %>/Programs/KristinitaLuckyLink.html"

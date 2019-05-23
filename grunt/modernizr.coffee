###################
# grunt-modernizr #
###################
###
Modernizr fix flaws of non-compatible browsers:
https://modernizr.com/
grunt-modernizr generate Modernizr custom file for needed features:
https://www.npmjs.com/package/grunt-modernizr
[INFO] Get Grunt configuration from online tool; I select “WebP” solely:
https://modernizr.com/download
###
module.exports =
	dist:
		# [INFO] Full options list:
		# https://github.com/modernizr/customizr#config-file
		dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>\
				/js/Modernizr/modernizr-custom.min.js"
		# Doesn't crawl project
		crawl: false
		# [INFO] I use Modernizr for Webp support:
		# https://css-tricks.com/using-webp-images/#article-header-id-4
		tests: ["webp"]
		# Uglify JavaScript
		uglify: true

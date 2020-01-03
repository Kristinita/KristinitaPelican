#####################
## Grunt templates ##
#####################
# https://quickleft.com/blog/grunt-js-tips-tricks/
module.exports = (grunt) ->
	# [INFO] Frequent paths in plugins configuration.
	# Grunt parsing YAML configuration file:
	# https://stackoverflow.com/a/49901700/5951529
	# [INFO] Using variables: “<%= templates.yamlconfig.VARIABLE %>”
	yamlconfig: grunt.file.readYAML("site_variables.yaml")
	paths:
		coffee: "<%= templates.yamlconfig.OUTPUT_PATH %>/**/coffee/**/*.coffee"
		css: [
			expand: true
			cwd: "<%= templates.yamlconfig.OUTPUT_PATH %>"
			src: [
					"**/*.css"
					# [LEARN][GLOB] “*” — matches any character zero or more time, except for “/”:
					# https://github.com/begin/globbing#wildcards
					# This pattern exclude “.min.css” and “.min.<any_symbols>.css” files,
					# that created by cache-bust:
					# https://www.npmjs.com/package/grunt-cache-bust
					"!**/*.min*css"
					]
			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>"
			]
		# [INFO] Get current working directory of Gruntfile:
		# https://gruntjs.com/creating-plugins#avoid-changing-the-current-working-directory:-process.cwd
		# https://stackoverflow.com/q/28755625/5951529
		cwd: process.cwd()
		images: [
			expand: true
			cwd: '.'
			# [LEARN][GLOB] Use “/**/”, that include “output/images/**” and “output/theme/images/**”
			src: ["<%= templates.yamlconfig.OUTPUT_PATH %>/**/images/**/*.{png,jpg,jpeg,gif,svg}"]
			dest: '.'
			]
		# [NOTE] “**.html” will not works; subdirectories will not included
		html: "<%= templates.yamlconfig.OUTPUT_PATH %>/**/*.html"
		markdown: [
			"*.md"
			".github/*.md"
			"<%= templates.yamlconfig.CONTENT_PATH %>/**/*.md"
			"tidy/*.md"
			# [FIXME] I disable remark and markdownlint for generated, not personal created files
			# Use remark-stringify:
			# https://www.npmjs.com/package/remark-stringify
			"!CODE_OF_CONDUCT.md"
			"!LICENSE.md"
			"!<%= templates.yamlconfig.CONTENT_PATH %>/Pages/Terms-and-Conditions-and-Privacy-Policy.md"
		]
		# [INFO] Lint Pelican personal plugins and configuration files:
		python: ["<%= templates.yamlconfig.PLUGIN_PATHS[1] %>/**/*.py"
							"*.py"]
		stylus: "<%= templates.yamlconfig.OUTPUT_PATH %>/**/stylus/**/*.styl"
	tokens:
		# [INFO] Get system environment variables:
		# https://stackoverflow.com/a/14089064/5951529
		# https://gruntjs.com/creating-tasks#cli-options-environment
		api_key_appveyor: process.env.API_KEY_APPVEYOR
		# [INFO] Google developers API keys:
		# https://developers.google.com/apis-explorer/#p/pagespeedonline/v5/
		# https://developers.google.com/speed/docs/insights/v5/get-started#key
		api_key_pagespeed_insights_v5: process.env.API_KEY_PAGESPEED_INSIGHTS_V5
	# [FIXME] Check all HTML, when tags and categories will works normally:
	# https://stackoverflow.com/q/54388924/5951529
	# getFiles: ->
	# 	grunt.file.expand 'output/**/*.html'

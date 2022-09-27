#####################
## Grunt templates ##
#####################
###
[INFO] Grunt templates
https://quickleft.com/blog/grunt-js-tips-tricks/
###
module.exports = (grunt) ->

	###
	[INFO] Frequent paths in plugins configuration.
	Grunt parsing YAML configuration file:
	https://stackoverflow.com/a/49901700/5951529

	[INFO] Using variables: “<%= templates.yamlconfig.VARIABLE %>”
	###
	yamlconfig: grunt.file.readYAML("site_variables.yaml")

	project_name: "Kristinita’s Search"

	paths:
		# [INFO] Theme, personal CoffeeScript files and Grunt CoffeeScript configuration
		coffee: ["<%= templates.yamlconfig.OUTPUT_PATH %>/**/*.coffee"
					"<%= templates.paths.cwd %>/grunt/*.coffee"]

		css: [
			expand: true
			cwd: "<%= templates.yamlconfig.OUTPUT_PATH %>"
			src: [
					"**/*.css"

					# [LEARN][GRUNT][GLOB] “*” — matches any character zero or more time, except for “/”:
					# https://github.com/begin/globbing#wildcards
					# This pattern exclude “.min.css” and “.min.<any_symbols>.css” files,
					# that created by cache-bust:
					# https://www.npmjs.com/package/grunt-cache-bust
					"!**/*.min*css"
					]
			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>"
			]

		###
		[INFO] Get current working directory of Gruntfile:
		https://gruntjs.com/creating-plugins#avoid-changing-the-current-working-directory:-process.cwd
		https://stackoverflow.com/q/28755625/5951529
		###
		cwd: process.cwd()

		images: [
			expand: true
			cwd: '.'

			# [LEARN][GLOB] Use “/**/”, that include “output/images/**” and “output/theme/images/**”
			src: ["<%= templates.yamlconfig.OUTPUT_PATH %>/**/images/**/*.{png,jpg,jpeg,gif,svg}"]
			dest: '.'
			]

		###
		[LEARN][GRUNT] Grunt apply for files dynamically:
		https://gruntjs.com/configuring-tasks#building-the-files-object-dynamically
		###
		js: [
			expand: true
			cwd: "<%= templates.yamlconfig.OUTPUT_PATH %>"
			src: [
					"**/*.js"
					"!**/*.min*js"
					]
			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>"
			]

		# [LEARN][GRUNT] “**.html” will not works; subdirectories will not included
		html: "<%= templates.yamlconfig.OUTPUT_PATH %>/**/*.html"

		markdown: [
			"*.md"
			".github/*.md"
			"<%= templates.yamlconfig.CONTENT_PATH %>/**/*.md"
		]

		# [INFO] Lint Pelican personal plugins, Jinja filters and configuration files:
		python: [
					"<%= templates.yamlconfig.PLUGIN_PATHS[1] %>/**/*.py"
					"<%= templates.paths.cwd %>/jinja_filters/*.py"
					"*.py"
				]

		# [INFO] Paths for theme and personal Stylus files
		stylus: "<%= templates.yamlconfig.OUTPUT_PATH %>/**/*.styl"

		# [INFO] Used theme path
		theme: "<%= templates.yamlconfig.THEME %>"

	tokens:
		###
		[INFO] Get system environment variables:
		https://stackoverflow.com/a/14089064/5951529
		https://gruntjs.com/creating-tasks#cli-options-environment
		###
		api_key_appveyor: process.env.API_KEY_APPVEYOR
		###
		[INFO] Google developers API keys:
		https://developers.google.com/apis-explorer/#p/pagespeedonline/v5/
		https://developers.google.com/speed/docs/insights/v5/get-started#key
		###
		api_key_pagespeed_insights_v5: process.env.API_KEY_PAGESPEED_INSIGHTS_V5

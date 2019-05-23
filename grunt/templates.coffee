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
		# [INFO] Get current working directory of Gruntfile:
		# https://gruntjs.com/creating-plugins#avoid-changing-the-current-working-directory:-process.cwd
		# https://stackoverflow.com/q/28755625/5951529
		cwd: process.cwd()
		html_all: "<%= templates.yamlconfig.OUTPUT_PATH %>/**/*.html"
	tokens:
		# [INFO] Get system environment variables:
		# https://stackoverflow.com/a/14089064/5951529
		# https://gruntjs.com/creating-tasks#cli-options-environment
		api_key_appveyor: process.env.API_KEY_APPVEYOR
		# [INFO] Google developers API keys:
		# https://developers.google.com/apis-explorer/#p/pagespeedonline/v5/
		api_key_pagespeed_insights_v5: process.env.API_KEY_PAGESPEED_INSIGHTS_V5
	# [FIXME] Check all HTML, when tags and categories will works normally:
	# https://stackoverflow.com/q/54388924/5951529
	# getFiles: ->
	# 	grunt.file.expand 'output/**/*.html'

#####################
## Grunt templates ##
#####################
# https://quickleft.com/blog/grunt-js-tips-tricks/
module.exports = (grunt) ->
	# [INFO] Frequent paths in plugins configuration.
	# Grunt parsing YAML configuration file:
	# https://stackoverflow.com/a/49901700/5951529
	yamlconfig: grunt.file.readYAML("pelicanvariables.yaml")
	paths:
		# Get current working directory of Gruntfile:
		# https://gruntjs.com/creating-plugins#avoid-changing-the-current-working-directory:-process.cwd
		# https://stackoverflow.com/q/28755625/5951529
		cwd: process.cwd()
		content_path: "<%= templates.yamlconfig.content_path %>"
		output_path: "<%= templates.yamlconfig.output_path %>"
		html_all: "<%= templates.yamlconfig.output_path %>/**/*.html"
		theme: "<%= templates.yamlconfig.theme %>"
		theme_static_dir: "<%= templates.yamlconfig.theme_static_dir %>"
		theme_static_paths: "<%= templates.yamlconfig.theme_static_paths %>"
	site:
		siteurl: "<%= templates.yamlconfig.siteurl %>"
	# MailerLite:
	# [FIXME] MailerLite bugs for RSS and CoffeeScript:
	# https://github.com/Kristinita/SashaMiscellaneous/issues/18
	# https://github.com/Kristinita/SashaMiscellaneous/issues/19
	# mailerlite:
	# 	mailerlite_account_id: "<%= templates.yamlconfig.mailerlite_account_id %>"
	# 	mailerlite_account_key: "<%= templates.yamlconfig.mailerlite_account_key %>"
	tokens:
		# [INFO] Get system environment variables:
		# https://stackoverflow.com/a/14089064/5951529
		# https://gruntjs.com/creating-tasks#cli-options-environment
		api_key_appveyor: process.env.API_KEY_APPVEYOR
		# [FIXME][NOTE] Not possible get user environment variables from browser:
		# https://stackoverflow.com/q/21315708/5951529
		api_key_wildfire_firebase: "<%= templates.yamlconfig.api_key_wildfire_firebase %>"
		form_id_typo_reporter: "<%= templates.yamlconfig.form_id_typo_reporter %>"
	databases:
		wildfire_firebase_project: "<%= templates.yamlconfig.wildfire_firebase_project %>"
		wildfire_messaging_sender_id: "<%= templates.yamlconfig.wildfire_messaging_sender_id %>"
	# [FIXME] Check all HTML, when tags and categories will works normally:
	# https://stackoverflow.com/q/54388924/5951529
	# getFiles: ->
	# 	grunt.file.expand 'output/**/*.html'

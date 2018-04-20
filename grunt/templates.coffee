#####################
## Grunt templates ##
#####################
# https://quickleft.com/blog/grunt-js-tips-tricks/
module.exports = (grunt) ->
	# Frequent paths in plugins configuration.
	# Grunt parsing YAML configuration file:
	# https://stackoverflow.com/a/49901700/5951529
	yamlconfig: grunt.file.readYAML("pelicanvariables.yaml")
	paths:
		# Get current working directory of Gruntfile:
		# https://gruntjs.com/creating-plugins#avoid-changing-the-current-working-directory:-process.cwd
		# https://stackoverflow.com/q/28755625/5951529
		cwd: process.cwd()
		path: "<%= templates.yamlconfig.path %>"
		output_path: "<%= templates.yamlconfig.output_path %>"
		theme: "<%= templates.yamlconfig.theme %>"
		theme_static_dir: "<%= templates.yamlconfig.theme_static_dir %>"
		theme_static_paths: "<%= templates.yamlconfig.theme_static_paths %>"
		html: "<%= templates.yamlconfig.output_path %>/**/*.html"
		css: "<%= templates.yamlconfig.output_path %>/**/*.css"

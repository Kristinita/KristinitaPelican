########################
## grunt-markdownlint ##
########################
###
[OVERVIEW] Lint Markdown files:
https://dlaa.me/markdownlint/

[INFO] Grunt wrapper:
https://www.npmjs.com/package/grunt-markdownlint

[INFO] Support YAML configuration file:
https://github.com/DavidAnson/markdownlint/issues/118

[BUG] “No tasks were registered or unregistered” unexpected message
on the “Registering Gruntfile tasks” stage:
https://github.com/sagiegurari/grunt-markdownlint/issues/25
###
module.exports = (grunt) ->
	options:
		config: grunt.file.readYAML(".markdownlint.yaml")
	src: "<%= templates.paths.markdown %>"

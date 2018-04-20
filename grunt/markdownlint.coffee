########################
## grunt-markdownlint ##
########################
# Lint Markdown files:
# https://www.npmjs.com/package/grunt-markdownlint
# [NOTE] Support YAML configuration file:
# https://github.com/DavidAnson/markdownlint/issues/118
module.exports = (grunt) ->
	options:
		config: grunt.file.readYAML(".markdownlint.yaml")
	src:
		[
			'*.md'
			'.github/*.md'
			'content/**/*.md'
			'tidy/*.md'
		]

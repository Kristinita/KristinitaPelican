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
			"*.md"
			".github/*.md"
			"<%= templates.paths.content_path %>/**/*.md"
			"tidy/*.md"
			# [NOTE] I disable remark and markdownlint for generated, not personal files
			"!CODE_OF_CONDUCT.md"
			"!LICENSE.md"
		]

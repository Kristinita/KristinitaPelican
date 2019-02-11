################
# grunt-remark #
################
# Markdown linter:
# https://remark.js.org/
# Grunt implementation:
# https://www.npmjs.com/package/grunt-remark
# [WARNING] You need to install remark plugins separately:
# “npm install remark-preset-lint-markdown-style-guide remark-preset-lint-recommended --save-dev”
module.exports =
	src:
		[
			"*.md"
			".github/*.md"
			"<%= templates.paths.content_path %>/**/*.md"
			"tidy/*.md"
			# [FIXME] I disable remark and markdownlint for generated, not personal created files
			# Use remark-stringify:
			# https://www.npmjs.com/package/remark-stringify
			"!CODE_OF_CONDUCT.md"
			"!LICENSE.md"
			"!<%= templates.paths.content_path %>/Pages/Terms-and-Conditions-and-Privacy-Policy.md"
		]
	# Full options list:
	# https://github.com/unifiedjs/unified-engine-gulp#options
	options:
		# Build failed, if any warning:
		# https://github.com/unifiedjs/unified-engine-gulp#optionsfrail
		frail: true

################
# grunt-remark #
################
# Markdown linter:
# https://remark.js.org/
# Grunt implementation:
# https://www.npmjs.com/package/grunt-remark
# [NOTE] You need to install remark plugins separately:
# “npm install remark-preset-lint-markdown-style-guide remark-preset-lint-recommended --save-dev”
# [INFO] Disabling specific rules:
# https://github.com/remarkjs/remark-lint#configuring-remark-lint
module.exports =
	src:
		[
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
	# Full options list:
	# https://github.com/unifiedjs/unified-engine-gulp#options
	options:
		# Build failed, if any warning:
		# https://github.com/unifiedjs/unified-engine-gulp#optionsfrail
		frail: true

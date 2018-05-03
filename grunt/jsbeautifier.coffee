########################
## grunt-jsbeautifier ##
########################
# https://www.npmjs.com/package/grunt-jsbeautifier
# [BUG] grunt-jsbeautifier doesn't support “.jsbeautifyrc”:
# https://github.com/vkadam/grunt-jsbeautifier/issues/63
module.exports =
	options:
		html:
			endWithNewline: true
			indentWithTabs: true
			# [BUG] This parameter required:
			# https://github.com/vkadam/grunt-jsbeautifier/issues/64
			wrapLineLength: 0
		css:
			endWithNewline: true
			indentWithTabs: true
			wrapLineLength: 0
	files: [
			"<%= templates.paths.html %>"
			"<%= templates.paths.css %>"
			]

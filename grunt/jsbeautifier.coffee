########################
## grunt-jsbeautifier ##
########################
# https://www.npmjs.com/package/grunt-jsbeautifier
# [BUG] grunt-jsbeautifier doesn't support “.jsbeautifyrc”:
# https://github.com/vkadam/grunt-jsbeautifier/issues/63
module.exports =
	options:
		html:
			indentWithTabs: true
			endWithNewline: true
		css:
			indentWithTabs: true
			endWithNewline: true
	files: [
			"<%= templates.paths.html %>"
			"<%= templates.paths.css %>"
			]

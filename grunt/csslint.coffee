###########
# csslint #
###########
###
[OVERVIEW] Linter for CSS:
http://csslint.net/

[INFO] Grunt wrapper:
https://www.npmjs.com/package/grunt-contrib-csslint

[INFO] Rules:
https://github.com/CSSLint/csslint/wiki/Rules

[INFO] Grunt options:
https://www.npmjs.com/package/grunt-contrib-csslint#csslint-task

[INFO] Ignoring parts of CSS during linting:
https://github.com/CSSLint/csslint/wiki/Ignoring-parts-of-CSS-during-linting

[NOTE] Isn’t possible ignore specific rules for specific lines:
https://stackoverflow.com/questions/29248792#comment103080092_35260823

[NOTE] Stylus single-line buffered comments doesn’t worked for
CSSLint ignore rules per line; they still removed:
http://stylus-lang.com/docs/comments.html#multi-line-buffered
https://github.com/CSSLint/csslint/wiki/Ignoring-parts-of-CSS-during-linting#ignoring-rules-per-line
###
module.exports =
	options:
		csslintrc: '.csslintrc'
	lint:
		# [NOTE] “files” object doesn't work
		src: [
				"<%= templates.yamlconfig.OUTPUT_PATH %>/**/*.css"
				"!<%= templates.yamlconfig.OUTPUT_PATH %>/**/*.min*css"
				]

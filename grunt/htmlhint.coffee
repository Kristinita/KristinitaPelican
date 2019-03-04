##################
# grunt-htmlhint #
##################
# Hint HTML:
# https://htmlhint.io/
# Grunt wrapper:
# https://www.npmjs.com/package/grunt-htmlhint
# Rules:
# https://github.com/htmlhint/HTMLHint/wiki/Rules
# [NOTE] All options in “.htmlhintrc” required
module.exports =
	options:
		# [NOTE] I prefer tabs, not spaces.
		# [LINK] “.editorconfig”
		# "space-tab-mixed-disabled": "tab",
		# [NOTE] BEM required underlines and dashes both:
		# https://en.bem.info/methodology/quick-start/#element
		# https://github.com/htmlhint/HTMLHint/issues/340
		# "id-class-value": false,
		# [NOTE] “script” tag must contain in head:
		# https://stackoverflow.com/a/24070373/5951529
		# https://github.com/htmlhint/HTMLHint/issues/340
		# "head-script-disabled": false
		htmlhintrc: ".htmlhintrc"
	target:
		src: ["<%= templates.paths.output_path %>/**/*.html"]

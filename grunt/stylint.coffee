#################
# grunt-stylint #
#################
# Lint Stylus files
# https://simenb.github.io/stylint/
# https://www.npmjs.com/package/grunt-stylint
# [WARNING] Needs full “.stylintrc” file, if “.stylintrc” — “{ colons: false }”,
# Stylint will not show any errors/warnings:
# https://travis-ci.org/Kristinita/SashaStylint/builds/374954051
# https://ci.appveyor.com/project/Kristinita/sashastylint
# [WARNING] Relevant documentation in NPM, not in GitHub Pages site!
# https://www.npmjs.com/package/stylint
# Actual options here:
# https://www.npmjs.com/package/stylint#the-config-approach
# [NOTE] “never” and “always” support for Stylint and Stylus Supermacy both.
# https://thisismanta.github.io/stylus-supremacy/#stylint
# [WARNING] Possible “"warning": true”, but for me all warnings is errors.
# [WARNING] “{ "expect": "always", "error": true },” required,
# otherwise always exit code 1.
# https://travis-ci.org/Kristinita/SashaGruntDebugging/builds/378052744
# All options enabled except below:
# "blocks": "never", — no syntax sugar
# http://stylus-lang.com/docs/block.html
# "colons": "never", — brackets, colons and semicolons is extra elements
# "extendPref": "@extend", — “@extend” more short
# "indentPref": "never", — “if you use hard tabs, set this value to false”
# "leadingZero": "never" — leading zero — extra symbol
# "maxErrors": "never", — I want all warnings
# "maxWarnings": "never", — I want all warnings
# "namingConvention": false, — [FIXME], I need migrate to BEM or other alternative
# "none": "never" — prefer “0”, that “none”:
# https://stackoverflow.com/a/2922923/5951529
# "parenSpace" — extra spaces
# "prefixVarsWithDollar": "never" — $ is extra symbol, not must problem if conventional variables naming,
# not "never", because “$” symbol used in placeholders:
# http://stylus-lang.com/docs/variables.html
# http://stylus-lang.com/docs/extend.html#extending-placeholder-selectors
# "quotePref": "double", — preferrable
# "sortOrder": false, — no tools for automatically sort Stylus rules, use PostCSS:
# https://stackoverflow.com/a/32056120/5951529
# https://github.com/SimenB/stylint/blob/master/src/data/ordering.json
# Supermacy can sort, but problem:
# https://github.com/ThisIsManta/stylus-supremacy/issues/34
# "valid": "never" — [BUG] “webkit-text-stroke” and “unicode-bidi” properties check as invalid:
# https://github.com/SimenB/stylint/issues/436
# "zeroUnits": "never", — disallow units for zero values:
# https://github.com/CSSLint/csslint/wiki/Disallow-units-for-zero-values
# "z-index" — 100 value:
# https://webref.ru/css/z-index
# https://css-tricks.com/rational-z-index-values/#article-header-id-2
module.exports =
	# https://www.npmjs.com/package/grunt-stylint#options
	options:
		# [WARNING] If true, grunt-stylint will not show any errors/warnings:
		quiet: false
	src: ["<%= templates.yamlconfig.output_path %>/<%= templates.yamlconfig.theme_static_dir %>/stylus/**/*.styl"
			"<%= templates.yamlconfig.output_path %>/stylus/**/*.styl"]

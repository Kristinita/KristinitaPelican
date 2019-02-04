####################
# grunt-coffeelint #
####################
# Lint CoffeeScript files:
# http://www.coffeelint.org/
# https://www.npmjs.com/package/grunt-coffeelint
# [WARNING] Support JSON configuration files, so options description here.
# https://github.com/clutchski/coffeelint/issues/638
# Configuration:
# http://www.coffeelint.org/#options
# [NOTE] Backslash — wrap long lines:
# https://github.com/jashkenas/coffeescript/issues/966
# [BUG] Trailing semicolon error for some comments:
# https://github.com/clutchski/coffeelint/issues/194#issuecomment-111058595

###
For all ignored levels in default configuration I set warning level:
Custom options:
“colon_assignment_spacing” — extra spacing
“indentation” 1 needs for tabs indentation
“max_value_length” — https://stackoverflow.com/a/111015/5951529
“no_implicit_braces” — extra braces
“no_implicit_parens” — extra parens
“no_tabs” — I use tabs indentation:
https://softwareengineering.stackexchange.com/a/72/264224
“no_unnecessary_double_quotes” ignore, because BetterCoffeeScript
highlight templates between double quotes, not between single:
https://packagecontrol.io/packages/Better%20CoffeeScript
[FIXME] “missing_fat_arrows” — ignore:
FancyBox coffee error
https://stackoverflow.com/a/15422322/5951529
https://github.com/clutchski/coffeelint/blob/master/src/rules/missing_fat_arrows.coffee
###
module.exports =
	options:
		configFile: "coffeelint.json"
	source:
		files:
			src: ["grunt/*.coffee"]
	theme:
		files:
			src: ["<%= templates.yamlconfig.output_path %>/<%= templates.yamlconfig.theme_static_dir %>/coffee/**/*.coffee"]
	personal:
		files:
			src: ["<%= templates.paths.output_path %>/coffee/**/**/*.coffee"]

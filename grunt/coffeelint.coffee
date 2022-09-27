####################
# grunt-coffeelint #
####################
###
[INFO] Lint CoffeeScript files:
http://www.coffeelint.org/
https://www.npmjs.com/package/grunt-coffeelint

[WARNING] Support JSON configuration files, so options description here.
https://github.com/clutchski/coffeelint/issues/638

Configuration:
http://www.coffeelint.org/#options

[LEARN][COFFEESCRIPT] Backslash — wrap long lines:
https://github.com/jashkenas/coffeescript/issues/966

[BUG] Trailing semicolon error for some comments:
https://github.com/clutchski/coffeelint/issues/194#issuecomment-111058595
###

###
[INFO] For all ignored levels in default configuration I set warning level

[INFO] Custom options:
“colon_assignment_spacing” — extra spacing
“indentation” 1 needs for tabs indentation
“max_value_length” — https://stackoverflow.com/a/111015/5951529
“no_implicit_braces” — extra braces
“no_implicit_parens” — extra parens
“no_tabs” — I use tabs indentation:
https://softwareengineering.stackexchange.com/a/72/264224

[INFO] “no_unnecessary_double_quotes” ignore, because BetterCoffeeScript
highlight templates between double quotes, not between single:
https://packagecontrol.io/packages/Better%20CoffeeScript
###
module.exports =
	options:
		configFile: "coffeelint.json"
	configs:
		files:
			src: ["<%= templates.paths.cwd %>/grunt/*.coffee"]
	site:
		files:
			src: ["<%= templates.yamlconfig.OUTPUT_PATH %>/**/*.coffee"]

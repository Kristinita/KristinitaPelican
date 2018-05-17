############
# minimize #
############
# Minify HTML:
# https://www.npmjs.com/package/minimize
# https://www.npmjs.com/package/grunt-minify-html
# Use HTML parser, grunt-contrib-htmlmin use regexes.
# grunt-htmlclean simply than grunt-minify-html:
# https://github.com/anseki/htmlclean/issues/11#issuecomment-389386676
module.exports =
	# https://github.com/Swaagie/minimize#options-1
	# All set false by default:
	# https://github.com/Swaagie/minimize#options
	options:
		# I'm not support spare attirbutes for older browsers:
		# https://github.com/Swaagie/minimize#spare
		spare: false
		# W3C recommends quotes:
		# https://www.w3schools.com/html/html_attributes.asp
		quotes: true
	minimize:
		files: [
			expand: true
			cwd: "."
			src: ["<%= templates.paths.output_path %>/**/*.html"]
			dest: "."
			]

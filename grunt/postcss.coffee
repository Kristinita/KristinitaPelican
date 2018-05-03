###################
## grunt-postcss ##
###################
# https://www.npmjs.com/package/grunt-postcss
module.exports =
	options:
		# Disable sourcemapping, because I don't minify CSS
		# https://stackoverflow.com/a/28993441/5951529
		map: false
		# PostCSS Autoprefixer
		# https://github.com/postcss/autoprefixer
		processors: [
			require('autoprefixer')()
		]
	dist:
		src: ["<%= templates.yamlconfig.output_path %>/<%= templates.paths.theme_static_dir %>/css/**/*.css", \
				"<%= templates.paths.output_path %>/css/personal/**/*.css"]

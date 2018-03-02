###################
## grunt-postcss ##
###################
# https://github.com/nDmitry/grunt-postcss
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
		src: ['output/theme/css/**/*.css', 'output/css/personal/**/*.css']
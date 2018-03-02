###########################
## grunt-contrb-imagemin ##
###########################
# Plugin for minify images:
# https://github.com/gruntjs/grunt-contrib-imagemin
# Minify all images in output folder
# [NOTE] Non-documented behavior!
# “gulp-htmltidy” task run, if I run “imagemin” task, see:
# https://github.com/shama/grunt-gulp/issues/14
module.exports =
	dynamic:
		options:
			optimizationLevel: 7
		files: [
			expand: true
			cwd: '.'
			src: ['output/images/**/*.{png,jpg,jpeg,gif,svg}']
			dest: '.'
			]
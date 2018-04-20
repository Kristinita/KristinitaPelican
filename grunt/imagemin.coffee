###########################
## grunt-contrb-imagemin ##
###########################
# Plugin for minify images:
# https://www.npmjs.com/package/grunt-contrib-imagemin
# Minify all images in output folder
# [NOTE] Non-documented behavior!
# “gulp-htmltidy” task run, if I run “imagemin” task, see:
# https://github.com/shama/grunt-gulp/issues/14
# [BUG] Don't use grunt-image:
# https://github.com/1000ch/grunt-image/issues/34
module.exports =
	dynamic:
		options:
			optimizationLevel: 7
		files: [
			expand: true
			cwd: '.'
			src: ["<%= templates.paths.output_path %>/images/**/*.{png,jpg,jpeg,gif,svg}"]
			dest: '.'
			]

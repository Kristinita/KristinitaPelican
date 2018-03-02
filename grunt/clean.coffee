#########################
## grunt-contrib-clean ##
#########################
# Delete blank folders and files
# https://github.com/gruntjs/grunt-contrib-clean
# Remove parent css file for design sections
module.exports =
	[
		'output/extra'
		'output/favicons'
		'output/root-html'
		'output/theme/css/sections/core-design.css'
	]
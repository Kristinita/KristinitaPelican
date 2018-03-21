#########################
## grunt-contrib-clean ##
#########################
# Delete blank folders and non-needed files
# https://www.npmjs.com/package/grunt-contrib-clean
# Remove parent css file for design sections
module.exports =
	[
		'output/extra'
		'output/root-html'
		'output/theme/css/sections/core-design.css'
	]

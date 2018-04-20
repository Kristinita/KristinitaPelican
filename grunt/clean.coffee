#########################
## grunt-contrib-clean ##
#########################
# Delete blank folders and non-needed files
# https://www.npmjs.com/package/grunt-contrib-clean
# Remove parent css file for design sections
module.exports =
	[
		"<%= templates.paths.output_path %>/extra"
		"<%= templates.paths.output_path %>/root-html"
		"<%= templates.yamlconfig.output_path %>/<%= templates.paths.theme %>/css/sections/core-design.css"
	]

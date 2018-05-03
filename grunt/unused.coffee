##################
## grunt-unused ##
##################
# Remove unused images
# https://www.npmjs.com/package/grunt-unused
# [BUG] — doesn't work with multiple reference folders
# https://github.com/ryanburgess/grunt-unused/issues/10
# If fail: true, and unused files, exit code 1;
# If fail: false and unused files, Grunt continue to work.
# [WARNING] Find images, for which links in HTML files, not Markdown files.
# If you add link to image to your Markdown file, but you haven't link to file
# in your HTML file, grunt-unused delete this image.
module.exports =
	options:
		reference: "<%= templates.yamlconfig.output_path %>/images/"
		directory: ["<%= templates.paths.html %>"]
		days: false
		remove: true
		reportOutput: false
		fail: false

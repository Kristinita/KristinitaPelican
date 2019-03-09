##############
# grunt-curl #
##############
# Download remote files:
# https://www.npmjs.com/package/grunt-curl
# I use grunt-curl, that then minify non-minified remote scripts or stylesheets
module.exports =
	# [NOTE] gemini-scrollbar files exists in JSDelivr, despite the fact that they not exists in GitHub
	# https://github.com/noeldelgado/gemini-scrollbar/pull/61
	# [NOTE] AddToAny — https://static.addtoany.com/menu/page.js —
	# and Wildfire scripts — https://cdn.jsdelivr.net/npm/wildfire/dist/wildfire.auto.js — already minified
	# Visualize:
	# https://github.com/kellyk/visualize/pull/1
	visualize:
		src: "https://gitcdn.xyz/repo/kellyk/visualize/master/visualize.js"
		dest: "<%= templates.paths.output_path %>/<%= templates.yamlconfig.theme_static_dir %>/js/Visualize/visualize.js"

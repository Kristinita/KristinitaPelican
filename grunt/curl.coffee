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
	# [NOTE] Use GitHub Raw, not GitCDN or another GitHub CDN,
	# because CDN — additional resource, that may not work:
	# https://github.com/schme16/gitcdn.xyz/issues/49#issuecomment-493354294
	visualize:
		src: "https://raw.githubusercontent.com/kellyk/visualize/master/visualize.js"
		dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/js/Visualize/visualize.js"

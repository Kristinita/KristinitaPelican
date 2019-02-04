#######################
# grunt-clean-console #
#######################
# Check console errors:
# https://www.npmjs.com/package/grunt-clean-console
# [WARNING] Deprecated PhantomJS used:
# https://github.com/bahmutov/grunt-clean-console/issues/3
module.exports =
	all:
		options:
			# [BUG] Not include index.html, due to AdSense scripts:
			# https://github.com/Kristinita/SashaMiscellaneous/issues/20
			# [BUG] Non-ASCII symbols in path doesn't support.
			# 1. If Cyrillic symbol, PhantomJS replace it to “?”.
			# 2. Else decoded URL, PhantomJS add “http” protocol.
			# [WARNING] Glob patterns doesn't work for custom keys:
			# https://stackoverflow.com/q/54388924/5951529
			url: ["<%= templates.paths.output_path %>/404.html"
					"<%= templates.paths.output_path %>/Sasha-Black.html"
					"<%= templates.paths.output_path %>/IT-Articles/How-to-publish-your-package-to-PyPI-2018.html"
					"<%= templates.paths.output_path %>/Programs/KristinitaLuckyLink.html"
					"<%= templates.paths.output_path %>/Pages/About-for-developers.html"
					"<%= templates.paths.output_path %>/Sublime-Text/Sacagawea.html"]
			# Second to wait any error
			timeout: 4

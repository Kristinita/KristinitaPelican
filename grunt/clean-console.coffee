#######################
# grunt-clean-console #
#######################
# Check console errors:
# https://www.npmjs.com/package/grunt-clean-console
# [WARNING] Deprecated PhantomJS used:
# https://github.com/bahmutov/grunt-clean-console/issues/3
# [NOTE] Using grunt-http-server for localhost:
# https://divhide.com/node-grunt-http-server-1-x/
# [BUG] Use localhost, not local paths!
# PhantomJS assumed “http://” for local paths, even if “file:///” protocol specified:
# https://ci.appveyor.com/project/Kristinita/sashagruntdebugging/builds/22130696
# https://travis-ci.org/Kristinita/SashaGruntDebugging/builds/488929531
# https://github.com/Kristinita/SashaGruntDebugging/blob/b8e8e72a199dae85ef292990611c441c7a81169e/Gruntfile.coffee
module.exports =
	all:
		options:
			# [FIXME] Check all URLs instead of specific, when fix Pelican categories and tags:
			# https://stackoverflow.com/q/54388924/5951529
			# url: ["<%= templates.all_html_array %>"]
			# [BUG] Not include index.html, due to AdSense scripts:
			# https://github.com/Kristinita/SashaMiscellaneous/issues/20
			# [BUG] Non-ASCII symbols in path doesn't support; URL decoding required;
			# tests passed for any errored URL with Cyrillic letters.
			# [WARNING] Glob patterns doesn't work for custom keys:
			# https://stackoverflow.com/q/54388924/5951529
			# [BUG] “https” doesn't support, use “http”:
			# Error code: 6. Description: SSL handshake failed
			url: ["http://localhost:4147/<%= templates.yamlconfig.OUTPUT_PATH %>/index.html"
					"http://localhost:4147/<%= templates.yamlconfig.OUTPUT_PATH %>/404.html"
					"http://localhost:4147/<%= templates.yamlconfig.OUTPUT_PATH %>/Sasha-Black.html"
					"http://localhost:4147/<%= templates.yamlconfig.OUTPUT_PATH %>/Gingerinas/\
					%D0%94%D0%B6%D0%B8%D0%BD%D0%B4%D0%B6%D0%B5%D1%80%D0%B8%D0%BD%D1%8B.html"
					"http://localhost:4147/<%= templates.yamlconfig.OUTPUT_PATH %>/IT-articles/\
					How-to-publish-your-package-to-PyPI-2018.html"
					"http://localhost:4147/<%= templates.yamlconfig.OUTPUT_PATH %>/Pages/About-for-developers.html"
					"http://localhost:4147/<%= templates.yamlconfig.OUTPUT_PATH %>/Programs/KristinitaLuckyLink.html"
					"http://localhost:4147/<%= templates.yamlconfig.OUTPUT_PATH %>/Sasha-Black/Sasha-Black-description.html"
					"http://localhost:4147/<%= templates.yamlconfig.OUTPUT_PATH %>/Smert-svobode/\
					%D0%9D%D0%BE%D0%B2%D1%8B%D0%B5-%D0%BD%D0%B5%D0%B4%D0%BE%D0%B2%D0%BE%D0%BB%D1%8C%D0%BD%D1%8B%D0%B5\
					-%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B5.html"
					"http://localhost:4147/<%= templates.yamlconfig.OUTPUT_PATH %>/Sublime-Text/Sacagawea.html"]
			# [INFO] Second to wait any error
			timeout: 4

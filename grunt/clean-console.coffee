#######################
# grunt-clean-console #
#######################
###
[OVERVIEW] Check console errors:
https://www.npmjs.com/package/grunt-clean-console

[WARNING] Deprecated PhantomJS used:
https://github.com/bahmutov/grunt-clean-console/issues/3

[NOTE] Using grunt-http-server for localhost:
https://divhide.com/node-grunt-http-server-1-x/

[NOTE] Use localhost, not local paths!
PhantomJS assumed “http://” for local paths, even if “file:///” protocol specified:
https://ci.appveyor.com/project/Kristinita/sashagruntdebugging/builds/22130696
https://travis-ci.org/Kristinita/SashaGruntDebugging/builds/488929531
https://github.com/Kristinita/SashaGruntDebugging/blob/b8e8e72a199dae85ef292990611c441c7a81169e/Gruntfile.coffee
###
module.exports =
	all:
		options:
			###
			[FIXME] Check all URLs instead of specific, when fix Pelican categories and tags:
			https://stackoverflow.com/q/54388924/5951529
			url: ["<%= templates.all_html_array %>"]

			[BUG] Not include index.html, due to AdSense scripts:
			https://github.com/Kristinita/SashaMiscellaneous/issues/20

			[BUG] Non-ASCII symbols in path doesn't support; URL decoding required;
			tests passed for any errored URL with Cyrillic letters.

			[WARNING] Glob patterns doesn't work for custom keys:
			https://stackoverflow.com/q/54388924/5951529

			[BUG] “https” doesn't support, use “http”:
			Error code: 6. Description: SSL handshake failed

			[BUG] PhantomJS shows errors for pages below while modern browsers for 2022 don’t show errors.
			PhantomJS works incorrectly for Programmable Search Engine, Stork search, Mermaid charts and PeerTube videos:

			"http://localhost:4147/<%= templates.yamlconfig.OUTPUT_PATH %>/404.html"
			"http://localhost:4147/<%= templates.yamlconfig.OUTPUT_PATH %>/index.html"
			"http://localhost:4147/<%= templates.yamlconfig.OUTPUT_PATH %>/Gingerinas/%D0%9A%D0%B5%D0%B9%D0%94%D0%B8.html"
			"http://localhost:4147/<%= templates.yamlconfig.OUTPUT_PATH %>/Gingerinas/%D0%9F%D1%80%D0%B8%D0%BC%D0%B5%D1%80\
			-%D1%80%D0%B0%D0%B7%D0%B1%D0%BE%D1%80%D0%B0-%D0%B8%D0%B3%D1%80%D1%8B\
			-%D0%A1%D0%BF%D0%BE%D1%80%D1%82%D0%A1%D0%98.html"
			"http://localhost:4147/<%= templates.yamlconfig.OUTPUT_PATH %>/Sublime-Text/KristinitaLuckyLink.html"
			"http://localhost:4147/<%= templates.yamlconfig.OUTPUT_PATH %>/Sublime-Text/Sacagawea.html"
			###
			url: [
					"http://localhost:4147/<%= templates.yamlconfig.OUTPUT_PATH %>/Gingerinas/Korvers.html"

					# [INFO] “Библиотека-для-джинджерин”
					"http://localhost:4147/<%= templates.yamlconfig.OUTPUT_PATH %>/Gingerinas/\
					%D0%91%D0%B8%D0%B1%D0%BB%D0%B8%D0%BE%D1%82%D0%B5%D0%BA%D0%B0-%D0%B4%D0%BB%D1%8F\
					-%D0%B4%D0%B6%D0%B8%D0%BD%D0%B4%D0%B6%D0%B5%D1%80%D0%B8%D0%BD.html"

					# [INFO] “Джинджерины”
					"http://localhost:4147/<%= templates.yamlconfig.OUTPUT_PATH %>/Gingerinas/\
					%D0%94%D0%B6%D0%B8%D0%BD%D0%B4%D0%B6%D0%B5%D1%80%D0%B8%D0%BD%D1%8B.html"

					"http://localhost:4147/<%= templates.yamlconfig.OUTPUT_PATH %>/IT-articles/\
					How-to-publish-your-package-to-PyPI-2018.html"

					"http://localhost:4147/<%= templates.yamlconfig.OUTPUT_PATH %>/IT-Articles/\
					Fastest-way-to-add-new-version-of-Sublime-Text-3-package.html"

					# [INFO] “Библиотека-для-жизни”
					"http://localhost:4147/<%= templates.yamlconfig.OUTPUT_PATH %>/Library-for-life/\
					%D0%91%D0%B8%D0%B1%D0%BB%D0%B8%D0%BE%D1%82%D0%B5%D0%BA%D0%B0-%D0%B4%D0%BB%D1%8F\
					-%D0%B6%D0%B8%D0%B7%D0%BD%D0%B8.html"

					# [INFO] “Библиотека-непрерывного-обучения”
					"http://localhost:4147/<%= templates.yamlconfig.OUTPUT_PATH %>/Library-for-life/\
					%D0%91%D0%B8%D0%B1%D0%BB%D0%B8%D0%BE%D1%82%D0%B5%D0%BA%D0%B0\
					-%D0%BD%D0%B5%D0%BF%D1%80%D0%B5%D1%80%D1%8B%D0%B2%D0%BD%D0%BE%D0%B3%D0%BE\
					-%D0%BE%D0%B1%D1%83%D1%87%D0%B5%D0%BD%D0%B8%D1%8F.html"

					# [INFO] “Работа”
					"http://localhost:4147/<%= templates.yamlconfig.OUTPUT_PATH %>/Library-for-life/\
					%D0%A0%D0%B0%D0%B1%D0%BE%D1%82%D0%B0.html"

					# [INFO] “Комнаты-Нели”
					"http://localhost:4147/<%= templates.yamlconfig.OUTPUT_PATH %>/Nelias-Rooms/\
					%D0%9A%D0%BE%D0%BC%D0%BD%D0%B0%D1%82%D1%8B-%D0%9D%D0%B5%D0%BB%D0%B8.html"

					"http://localhost:4147/<%= templates.yamlconfig.OUTPUT_PATH %>/Pages/About-for-developers.html"

					"http://localhost:4147/<%= templates.yamlconfig.OUTPUT_PATH %>/Sasha-Black.html"

					"http://localhost:4147/<%= templates.yamlconfig.OUTPUT_PATH %>/Sasha-Black/Sasha-Black.html"

					# [INFO] “Новые-недовольные-русские”
					"http://localhost:4147/<%= templates.yamlconfig.OUTPUT_PATH %>/Smert-svobode/%D0%9D%D0%BE%D0%B2%D1%8B%D0%B5\
					-%D0%BD%D0%B5%D0%B4%D0%BE%D0%B2%D0%BE%D0%BB%D1%8C%D0%BD%D1%8B%D0%B5\
					-%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B5.html"

					"http://localhost:4147/<%= templates.yamlconfig.OUTPUT_PATH %>/Sublime-Text/SashaSublime.html"

					"http://localhost:4147/<%= templates.yamlconfig.OUTPUT_PATH %>/tag/library-for-life-base.html"
				]


			# [INFO] Seconds to wait any error
			timeout: 4

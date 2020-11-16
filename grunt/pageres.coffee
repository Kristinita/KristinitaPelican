#################
# grunt-pageres #
#################
###
[OVERWIEW] Screenshots of site pages:
https://www.npmjs.com/package/pageres

[INFO] Grunt wrapper:
https://www.npmjs.com/package/grunt-pageres

[INFO] Options:
https://www.npmjs.com/package/pageres#options

[FIXME] Publish screenshots to Imgur “after_success” and overwrite current Imgur album:
https://github.com/sindresorhus/pageres/issues/358
###
module.exports =
	screenshots:
		options:
			delay: 4
			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/screenshots"
			###
			[INFO] I use 2 most popular screen resolutions for PC:
			https://www.w3counter.com/globalstats.php

			[NOTE] Viewport sizes is obsolete:
			http://viewportsizes.com

			[DECLINED] pageres will not show how web pages look on real mobile devices;
			it will take screenshots that have nothing to do with the actual display
			of web pages on mobile devices
			[INFO] Add resolutions of supported mobile and tablet devices:
			iPhone XS Max — 1242x2688
			iPad Pro 12.9.2018 — 2048x2732
			Samsung Galaxy S9+ — 1440x2960
			###
			sizes: [
					"1366x768"
					"640x360"
					]
			###
			[NOTE] It would be nice add “cwd” for templates, so that there are no duplicates:
			https://github.com/sindresorhus/pageres/issues/352#issuecomment-464048880
			###
			urls: ["<%= templates.yamlconfig.OUTPUT_PATH %>/index.html"
					"<%= templates.yamlconfig.OUTPUT_PATH %>/404.html"
					"<%= templates.yamlconfig.OUTPUT_PATH %>/Sasha-Black.html"
					"<%= templates.yamlconfig.OUTPUT_PATH %>/Pages/About-for-developers.html"
					"<%= templates.yamlconfig.OUTPUT_PATH %>/Smert-svobode/Новые-недовольные-русские.html"
					"<%= templates.yamlconfig.OUTPUT_PATH %>/Programs/KristinitaLuckyLink.html"
					"<%= templates.yamlconfig.OUTPUT_PATH %>/IT-articles/typo-reporter.html"
					"<%= templates.yamlconfig.OUTPUT_PATH %>/Erics-Rooms/Тао.html"
					"<%= templates.yamlconfig.OUTPUT_PATH %>/Giologica/Nas-Izu.html"]

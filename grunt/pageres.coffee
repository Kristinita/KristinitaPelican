#################
# grunt-pageres #
#################
# Screenshots of site pages:
# https://www.npmjs.com/package/pageres
# https://www.npmjs.com/package/grunt-pageres
# [DONE]
# # [WARNING] PhantomJS make screenshots for old browser, that detect as Safari 4:
# # "Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/538.1 (KHTML, like Gecko) PhantomJS/2.1.1 Safari/538.1"
# # screenshots can differ a lot by real pages for modern browsers.
# # [BUG] pageres works bad with absolute paths,
# # I use pageres use local server via grunt-http-server
# # [BUG] Native scrollbars displayed:
# # https://github.com/sindresorhus/pageres/issues/331
# [FIXME] Publish screenshots to Imgur after_success and overwrite current Imgur album
module.exports =
	screenshots:
		options:
			delay: 4
			dest: "<%= templates.yamlconfig.output_path %>/screenshots"
			# [WARNING] Viewport sizes is obsolete:
			# http://viewportsizes.com
			# I use 2 most popular screen resolutions for PC:
			# https://www.w3counter.com/globalstats.php
			###
			640x360
			1366x768
			###
			# And resolutions of supported mobile and tablet devices:
			###
			iPhone XS Max — 1242x2688
			iPad Pro 12.9.2018 — 2048x2732
			Samsung Galaxy S9+ — 1440x2960
			###
			sizes: [
					"1024x768"
					"1366x768"
					"1242x2688"
					"2048x2732"
					"1440x2960"
					]
			# [FIXME] Add cwd for templates, that no duplicate template:
			# https://github.com/sindresorhus/pageres/issues/352#issuecomment-464048880
			urls: ["<%= templates.yamlconfig.output_path %>/index.html"
					"<%= templates.yamlconfig.output_path %>/404.html"
					"<%= templates.yamlconfig.output_path %>/Sasha-Black.html"
					"<%= templates.yamlconfig.output_path %>/Pages/About-for-developers.html"
					"<%= templates.yamlconfig.output_path %>/Smert-svobode/Новые-недовольные-русские.html"
					"<%= templates.yamlconfig.output_path %>/Programs/KristinitaLuckyLink.html"
					"<%= templates.yamlconfig.output_path %>/IT-articles/typo-reporter.html"
					"<%= templates.yamlconfig.output_path %>/Gingerinas/Тао.html"
					"<%= templates.yamlconfig.output_path %>/Giologica/Nas-Izu.html"]

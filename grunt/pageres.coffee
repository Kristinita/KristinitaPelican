#################
# grunt-pageres #
#################
# Screenshots of site pages:
# https://www.npmjs.com/package/pageres
# https://www.npmjs.com/package/grunt-pageres
# [WARNING] PhantomJS make screenshots for old browser, that detect as Safari 4:
# "Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/538.1 (KHTML, like Gecko) PhantomJS/2.1.1 Safari/538.1"
# screenshots can differ a lot by real pages for modern browsers.
# [WARNING] pageres works bad with absolute paths,
# I use pageres use local server via grunt-http-server
# [BUG] Native scrollbars displayed:
# https://github.com/sindresorhus/pageres/issues/331
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
			1024x768
			1366x768
			###
			# And resolutions of supported mobile and tablet devices:
			###
			iPhone X — 1125x2436
			iPad 5th — 1536x2048
			Samsung Galaxy S8 — 1440x2960
			###
			sizes: [
					"1024x768"
					"1366x768"
					"1125x2436"
					"1536x2048"
					"1440x2960"
					]
			urls: ["https://127.0.0.1:8282/output/index.html"
					"https://127.0.0.1:8282/output/404.html"
					"https://127.0.0.1:8282/output/Sasha-Black.html"
					"https://127.0.0.1:8282/output/Pages/About-for-developers.html"
					"https://127.0.0.1:8282/output/Smert-svobode/\
					%D0%9D%D0%BE%D0%B2%D1%8B%D0%B5-%D0%BD%D0%B5%D0%B4%D0%BE%D0%B2%D0%BE%D0%BB%D1%8C%D0%BD%D1%8B%D0%B5\
					-%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B5.html"
					"https://127.0.0.1:8282/output/Programs/KristinitaLuckyLink.html"
					"https://127.0.0.1:8282/output/IT-articles/typo-reporter.html"
					"https://127.0.0.1:8282/output/Gingerinas/%D0%A2%D0%B0%D0%BE.html"
					"https://127.0.0.1:8282/output/Giologica/Nas-Izu.html"]

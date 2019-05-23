######################
# PageSpeed Insights #
######################
###
Check web page performance:
https://developers.google.com/speed/pagespeed/insights/
Grunt wrapper:
https://www.npmjs.com/package/grunt-pagespeed
Use PSI:
https://www.npmjs.com/package/psi

[NOTE] Requests quotas:
https://console.developers.google.com/apis/api/pagespeedonline.googleapis.com/quotas
https://i.imgur.com/fLQnWSW.png

[WARNING] I can't solve “Serve static assets with an efficient cache policy”
without buying custom domain.
https://webapps.stackexchange.com/a/119294/122122
https://webapps.stackexchange.com/a/51415/122122
Cloudflare require custom domain:
https://blog.cloudflare.com/secure-and-fast-github-pages-with-cloudflare/
https://www.google.com/search?client=firefox-b-d&q=cloudflare+github+pages

[NOTE] Remote site required for PSI running;
I can't fix “Serve static assets with an efficient cache policy” for localhost
###
module.exports =
	# Options:
	# https://www.npmjs.com/package/grunt-pagespeed#options
	options:
		# [INFO] That get a key, create a project → visit API page:
		# https://console.developers.google.com/apis
		# → API Library → Other (in page bottom) → PageSpeed Insights API:
		# https://console.developers.google.com/apis/library
		key: "<%= templates.tokens.api_key_pagespeed_insights_v5 %>"
		# [INFO] Template before paths; PageSpeed will check
		# “url/404.html”, “url/Sasha-Black.html” and so on:
		# https://www.npmjs.com/package/grunt-pagespeed#url
		url: "<%= templates.yamlconfig.SITEURL %>/"
	prod:
		options:
			paths: [
					# [INFO] index.html
					""
					"404"
					"Sasha-Black"
					"Gingerinas/Джинджерины"
					"IT-articles/How-to-publish-your-package-to-PyPI-2018"
					"Pages/About-for-developers"
					"Programs/KristinitaLuckyLink"
					"Sasha-Black/Sasha-Black-description"
					"Smert-svobode/Новые-недовольные-русские"
					"Sublime-Text/Sacagawea"
					]
			# [NOTE] Mandatory option:
			# https://www.npmjs.com/package/grunt-pagespeed#locale
			locale: "en_US"
			# [INFO] Mobile or desktop:
			# https://www.npmjs.com/package/grunt-pagespeed#strategy
			strategy: "mobile"
			# [INFO] If PageSpeed Insights value less than threshold value, build failed:
			# https://www.npmjs.com/package/grunt-pagespeed#threshold
			threshold: 50

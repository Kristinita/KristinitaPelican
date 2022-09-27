######################
# PageSpeed Insights #
######################
###
[OVERVIEW] Check web page performance:
https://developers.google.com/speed/pagespeed/insights/

[INFO] Grunt wrapper:
https://www.npmjs.com/package/grunt-pagespeed

[OPTIONS]
https://www.npmjs.com/package/grunt-pagespeed#options

[INFO] PSI — PageSpeed Insights CLI:
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

[WARNING] Remote site required for PSI running;
I can't fix “Serve static assets with an efficient cache policy” for localhost
###
module.exports =
	options:

		###
		[INFO] That get a key, create a project → visit API page:
		https://console.developers.google.com/apis
		→ API Library → Other (in page bottom) → PageSpeed Insights API:
		https://console.developers.google.com/apis/library
		###
		key: "<%= templates.tokens.api_key_pagespeed_insights_v5 %>"

		###
		[INFO] Template before paths; PageSpeed will check
		“url/404.html”, “url/Sasha-Black.html” and so on:
		https://www.npmjs.com/package/grunt-pagespeed#url
		###
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
					"Library-for-life/Библиотека-для-жизни"
					"Pages/About-for-developers"
					"Smert-svobode/Новые-недовольные-русские"
					"Sublime-Text/KristinitaLuckyLink"
					"Sublime-Text/Sacagawea"
					]
			###
			[REQUIRED] Mandatory option:
			https://www.npmjs.com/package/grunt-pagespeed#locale
			###
			locale: "en_US"

			###
			[INFO] Mobile or desktop:
			https://www.npmjs.com/package/grunt-pagespeed#strategy
			###
			strategy: "mobile"

			###
			[INFO] If PageSpeed Insights value less than threshold value, build failed:
			https://www.npmjs.com/package/grunt-pagespeed#threshold
			###
			threshold: 50

############
# critical #
############
###
[OVERVIEW] Inline critical CSS:
https://www.npmjs.com/package/critical
http://prgssr.ru/development/razbiraemsya-s-kritichnym-css.html
https://medium.com/web-standards/critical-and-progressive-css-d6611f034d7d
https://web.dev/preload-critical-assets/

[INFO] Grunt wrapper:
https://www.npmjs.com/package/grunt-critical

[INFO] Penthouse:
https://www.npmjs.com/package/penthouse
https://www.npmjs.com/package/grunt-penthouse

[NOTE] I don’t use special “mobile” critical CSS:
https://github.com/pocketjoso/penthouse/issues/171#issuecomment-320516807
I use default 1300/900 size.

[INFO] Options:
https://www.npmjs.com/package/critical#usage
https://www.npmjs.com/package/critical#options
[NOTE] Critical use Penthouse + Puppeteer, but I don’t use Penthouse direct, because Critical
automatically inject CSS to HTML:
https://www.npmjs.com/package/critical#when-should-i-just-use-penthouse-directly

[NOTE] CSS should be duplicated in external CSS document.

If the user navigates to another page on the site,
browser will cache the CSS file already loaded for the other page:
https://stackoverflow.com/a/34145199/5951529
###
module.exports =
	dist:
		options:
			###
			[INFO] Removing the critical CSS per page results in a unique async loaded CSS file for every page:
			https://www.npmjs.com/package/critical#options
			###
			extract: false
		files: [
			expand: true
			cwd: "."
			src: ["<%= templates.paths.html %>"
					# [BUG] Penthouse error for iframes:
					# https://github.com/pocketjoso/penthouse/issues/348
					# I delisted all my HTML files with iframes
					"!<%= templates.yamlconfig.OUTPUT_PATH %>/Gingerinas/Korvers.html"
					"!<%= templates.yamlconfig.OUTPUT_PATH %>/Gingerinas/КейДи.html"
					"!<%= templates.yamlconfig.OUTPUT_PATH %>/Nelias-Rooms/АльFAQ.html"
					"!<%= templates.yamlconfig.OUTPUT_PATH %>/Nelias-Rooms/Допустимые-способы-привлечения-средств.html"
					"!<%= templates.yamlconfig.OUTPUT_PATH %>/Nelias-Rooms/Комнаты-Нели.html"
					"!<%= templates.yamlconfig.OUTPUT_PATH %>/Nelias-Rooms/Поиск-книг-для-Комнат-Нели.html"
					"!<%= templates.yamlconfig.OUTPUT_PATH %>/Sublime-Text/KristinitaLuckyLink.html"
					"!<%= templates.yamlconfig.OUTPUT_PATH %>/Sublime-Text/Sacagawea.html"

					# [BUG][FIXME][ISSUE] “postcss:fixinlinecssinhtml” works incorrectly for this file after critical
					# I excluded this file from list, because the internal css in it is invalid
					"!<%= templates.yamlconfig.OUTPUT_PATH %>/Gingerinas/Пример-разбора-игры-СпортСИ.html"

					# [INFO] HTML for Bitcoin images
					"!<%= templates.yamlconfig.OUTPUT_PATH %>/images/**/*.html"
					]
			dest: "."
			]

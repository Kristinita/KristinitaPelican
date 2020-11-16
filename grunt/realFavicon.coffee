########################
## grunt-real-favicon ##
########################
###
[PURPOSE] Generate favicons for all browsers and devices:
https://realfavicongenerator.net/
[INFO] Grunt wrapper:
https://www.npmjs.com/package/grunt-real-favicon
[INFO] FAQ, documentation and supported icon types:
https://realfavicongenerator.net/faq

[INFO] I use default settings, if there are no comments to prove otherwise
###
module.exports =
	favicons:

		###
		[INFO] Path to source image

		[INFO] Image should be 260x260 or more for optimal results:
		https://realfavicongenerator.net/
		###
		src: "<%= templates.yamlconfig.THEME %>/<%= templates.yamlconfig.THEME_STATIC_PATHS %>\
				/images/icons/kristinita-favicon.png"

		###
		[REQUIRED] Put all files at the root of the site:
		https://realfavicongenerator.net/faq#why_icons_in_root
		###
		dest: "<%= templates.yamlconfig.OUTPUT_PATH %>"
		options:

			###
			[NOTE] If “<%= templates.yamlconfig.SITEURL %>”
			instead of “"/"”, “favicon.ico” will declared in your HTML files,
			that not recommended:
			https://realfavicongenerator.net/faq/#why_ico_not_declared
			https://github.com/RealFaviconGenerator/realfavicongenerator/issues/445

			[INFO] I use regular expressions so that use absolute paths
			without unexpected injections:
			[LINK] “string-replace.coffee”

			[INFO] “"/"” as value of “iconsPath” is a value of “dest” key

			[LEARN][HTML] Paths to icons as “href="/favicon-16x16.png"” is normal even if URL
			“/some/path/some_page.html”: leading slash is a root project folder:
			https://github.com/RealFaviconGenerator/realfavicongenerator/issues/29#issuecomment-37190102
			https://webmasters.stackexchange.com/a/56844/71131
			###
			iconsPath: "/"

			###
			[INFO] Links to icons must be on the each page, not just the homepage:
			https://github.com/RealFaviconGenerator/realfavicongenerator/issues/29#issuecomment-37190102
			https://stackoverflow.com/a/16979752/5951529
			###
			html: ["<%= templates.paths.html %>"]

			design:
				ios:
					pictureAspect: "noChange"
					assets:
						ios6AndPriorIcons: false
						ios7AndLaterIcons: false
						precomposedIcons: false
						declareOnlyDefaultIcon: true
					appName: "<%= templates.project_name %>"

				###
				[LEARN][COFFEESCRIPT][REQUIRED] {Curly braces} for empty object:
				https://www.tutorialspoint.com/coffeescript/coffeescript_objects.htm
				###
				desktopBrowser: {}

				windows:
					pictureAspect: "noChange"
					backgroundColor: "darkorange"
					onConflict: "override"
					assets:
						windows80Ie10Tile: false
						windows10Ie11EdgeTiles:
							small: false
							medium: true
							big: false
							rectangle: false
					appName: "<%= templates.project_name %>"

				androidChrome:
					pictureAspect: "noChange"
					themeColor: "#ffffff"
					manifest:
						name: "<%= templates.project_name %>"
						startUrl: "<%= templates.yamlconfig.SITEURL %>"
						display: "standalone"
						orientation: "notSet"
						onConflict: "override"
						declared: true
					assets:
						legacyIcon: false
						lowResolutionIcons: false

				safariPinnedTab:
					pictureAspect: "blackAndWhite"

					###
					[NOTE] Not good, but this is the best available:
					https://i.imgur.com/g3wBe7N.png
					###
					threshold: 70

					###
					[INFO] We can use X11 color names for Safari:
					https://bit.ly/safari-pinned-tab-icon
					###
					themeColor: "darkorange"

			settings:
				###
				[INFO] The highest compression doesn’t reduce image quality
				[COMPARE] https://i.imgur.com/9JyqUCe.png
				###
				compression: 5

				# [COMPARE] https://i.imgur.com/tkXuaxN.png
				scalingAlgorithm: "NearestNeighbor"

				errorOnImageTooSmall: false
				readmeFile: false
				htmlCodeFile: false
				usePathAsIs: false

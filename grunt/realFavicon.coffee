########################
## grunt-real-favicon ##
########################
# Generate favicons
# https://www.npmjs.com/package/grunt-real-favicon
module.exports =
	favicons:
		src: 'content/images/favicon/kristinita-favicon.png'
		dest: 'output'
		options:
			iconsPath: '.'
			html: ['output/index.html']
			design:
				ios:
					pictureAspect: 'noChange'
					assets:
						ios6AndPriorIcons: false
						ios7AndLaterIcons: false
						precomposedIcons: false
						declareOnlyDefaultIcon: true
					appName: "Kristinita\'s Search"
				# [NOTE] Needs {curly braces} for empty object
				# https://www.tutorialspoint.com/coffeescript/coffeescript_objects.htm
				desktopBrowser: {}
				windows:
					pictureAspect: 'noChange'
					backgroundColor: '#ffc40d'
					onConflict: 'override'
					assets:
						windows80Ie10Tile: false
						windows10Ie11EdgeTiles:
							small: false
							medium: true
							big: false
							rectangle: false
					appName: "Kristinita\'s Search"
				androidChrome:
					pictureAspect: 'noChange'
					themeColor: '#ffffff'
					manifest:
						name: "Kristinita\'s Search"
						startUrl: 'https://Kristinita.ru'
						display: 'standalone'
						orientation: 'notSet'
						onConflict: 'override'
						declared: true
					assets:
						legacyIcon: false
						lowResolutionIcons: false
				safariPinnedTab:
					pictureAspect: 'blackAndWhite'
					threshold: 50
					themeColor: '#d55b9a'
			settings:
				scalingAlgorithm: 'Mitchell'
				errorOnImageTooSmall: false
				readmeFile: false
				htmlCodeFile: false
				usePathAsIs: false

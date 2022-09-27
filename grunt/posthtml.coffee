####################
## grunt-posthtml ##
####################
###
[INFO] Framework to transform HTML/XML via JavaScript plugins:
https://posthtml.org/#/
https://www.npmjs.com/package/posthtml

[INFO] Plugins:
https://www.npmjs.com/package/posthtml#plugins

[INFO] Grunt wrapper:
https://www.npmjs.com/package/grunt-posthtml
###
module.exports =
	options:
		use: [
			#####################
			# posthtml-lazyload #
			#####################
			# [ACTION] Add “loading="lazy"” to all images and iframes:
			# https://www.npmjs.com/package/posthtml-lazyload

			# [NOTE] I couldn’t find any method for applying lazy loading for
			# all images and frames without adding “loading="lazy"” each time

			# [INFO] “loading="eager"” — load resources immediatly:
			# https://web.dev/browser-level-image-lazy-loading/

			# [INFO] For “picture” tag the “loading” attribute required solely for
			# the fallback “img” element:
			# https://web.dev/browser-level-image-lazy-loading/

			# [NOTE] CSS background images haven’t “loading” attribute:
			# https://web.dev/browser-level-image-lazy-loading/\
			#can-css-background-images-take-advantage-of-the-loading-attribute

			require('posthtml-lazyload')(loading: 'lazy')

			# [NOTE] This plugin removes both: blank and non-blank tags:
			# https://github.com/posthtml/posthtml-remove-tags
			# require('posthtml-remove-tags')(tags: ['p'])


			#########################
			# posthtml-img-autosize #
			#########################
			# [BUG] Plugin doesn’t work with for relative paths in HTML:
			# https://github.com/posthtml/posthtml-img-autosize/issues/26

			# [OVERVIEW] Plugin adds “height” and “width” attributes to all images:
			# https://www.npmjs.com/package/posthtml-img-autosize
			# [INFO] It required for 2020:
			# https://www.smashingmagazine.com/2020/03/setting-height-width-images-important-again/

			# require('posthtml-img-autosize')(
			# 		processEmptySize: true
			# 		root: "output/Programs"
			# 		)
		]
	target:
		files: [
			expand: true
			cwd: "."
			src: "<%= templates.paths.html %>"
			dest: "."
		]

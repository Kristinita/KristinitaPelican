#####################
## grunt-purgecss ##
#####################
# Remove unused CSS:
# https://www.purgecss.com/
# Grunt wrapper:
# https://www.purgecss.com/with-grunt
# Comparison with PurifyCSS and UnCSS:
# https://www.purgecss.com/comparison
# PurgeCSS was originally thought as the v2 of PurifyCSS:
# https://github.com/FullHuman/purgecss#acknowledgment
# PurifyCSS not maintained at March 2019:
# https://github.com/purifycss/purifycss/issues/213
# [BUG][FIXME] Whitelist options doesn't work, so still use PurifyCSS:
# https://github.com/FullHuman/grunt-purgecss/issues/9
module.exports =
	options:
		# [WARNING] PurifyCSS support elements, that include simply methods.
		# Example: <div class="SashaClass"></div> in HTML;
		# .SashaClass { color: black } in CSS;
		# If elements generated by JavaScript, PurifyCSS doesn"t work:
		# https://github.com/purifycss/purifycss/issues/194
		# whitelist: [".SashaGingerinasExample"]
		whitelistPatternsChildren: [/^\.tooltipster.+/]
	programs:
		options:
			content: ["<%= templates.yamlconfig.OUTPUT_PATH %>/Sublime-Text/*.html"
						"<%= templates.yamlconfig.OUTPUT_PATH %>/Programs/*.html"]
			# whitelist: [".SashaGingerinasExample"]
			# whitelistPatterns: [/^\.SashaGingerinasExample$/]
		files:
			"<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/sections/programs.css": \
			["<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/sections/programs.css"]
	gingerinas:
		options:
			content: ["<%= templates.yamlconfig.OUTPUT_PATH %>/Gingerinas/*.html"]
			files:
				"<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/sections/gingerinas.css": \
				["<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/sections/gingerinas.css"]
	itarticles:
		src: ["<%= templates.yamlconfig.OUTPUT_PATH %>/IT-articles/*.html"]
		css: ["<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/sections/it-articles.css"]
		dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/sections/it-articles.css"
	giologicablue:
		src: ["<%= templates.yamlconfig.OUTPUT_PATH %>/Giologica/Valerywork-Kiravel.html"]
		css: ["<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/sections/giologica-blue.css"]
		dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/sections/giologica-blue.css"
	giologica:
		options:
			content: ["<%= templates.yamlconfig.OUTPUT_PATH %>/Giologica/*.html"]
			files:
				"<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/sections/giologica.css": \
				["<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/sections/giologica.css"]
	sashablack:
		# Pages and Sasha Black
		src: [
				"<%= templates.yamlconfig.OUTPUT_PATH %>/Sasha-Black/*.html"
				"<%= templates.yamlconfig.OUTPUT_PATH %>/Pages/*.html"
				]
		css: ["<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/sections/sasha-black-description.css"]
		dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/sections/sasha-black-description.css"
	smertsvobode:
		src: ["<%= templates.yamlconfig.OUTPUT_PATH %>/Smert-svobode/*.html"]
		css: ["<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/sections/smert-svobode.css"]
		dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/sections/smert-svobode.css"

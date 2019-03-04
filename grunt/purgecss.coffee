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
			content: ["<%= templates.paths.output_path %>/Sublime-Text/*.html"
						"<%= templates.paths.output_path %>/Programs/*.html"]
			# whitelist: [".SashaGingerinasExample"]
			# whitelistPatterns: [/^\.SashaGingerinasExample$/]
		files:
			"<%= templates.paths.output_path %>/theme/css/sections/programs.css": \
			["<%= templates.paths.output_path %>/theme/css/sections/programs.css"]
	gingerinas:
		options:
			content: ["<%= templates.paths.output_path %>/Gingerinas/*.html"]
			files:
				"<%= templates.paths.output_path %>/theme/css/sections/gingerinas.css": \
				["<%= templates.paths.output_path %>/theme/css/sections/gingerinas.css"]
	itarticles:
		src: ["<%= templates.paths.output_path %>/IT-articles/*.html"]
		css: ["<%= templates.paths.output_path %>/theme/css/sections/it-articles.css"]
		dest: "<%= templates.paths.output_path %>/theme/css/sections/it-articles.css"
	giologicablue:
		src: ["<%= templates.paths.output_path %>/Giologica/Valerywork-Kiravel.html"]
		css: ["<%= templates.paths.output_path %>/theme/css/sections/giologica-blue.css"]
		dest: "<%= templates.paths.output_path %>/theme/css/sections/giologica-blue.css"
	giologica:
		options:
			content: ["<%= templates.paths.output_path %>/Giologica/*.html"]
			files:
				"<%= templates.paths.output_path %>/theme/css/sections/giologica.css": \
				["<%= templates.paths.output_path %>/theme/css/sections/giologica.css"]
	sashablack:
		# Pages and Sasha Black
		src: [
				"<%= templates.paths.output_path %>/Sasha-Black/*.html"
				"<%= templates.paths.output_path %>/Pages/*.html"
				]
		css: ["<%= templates.paths.output_path %>/theme/css/sections/sasha-black-description.css"]
		dest: "<%= templates.paths.output_path %>/theme/css/sections/sasha-black-description.css"
	smertsvobode:
		src: ["<%= templates.paths.output_path %>/Smert-svobode/*.html"]
		css: ["<%= templates.paths.output_path %>/theme/css/sections/smert-svobode.css"]
		dest: "<%= templates.paths.output_path %>/theme/css/sections/smert-svobode.css"
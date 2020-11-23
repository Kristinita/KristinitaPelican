##########################
## grunt-contrib-stylus ##
##########################
###
[OVERVIEW] Compile Stylus to CSS:
https://www.npmjs.com/package/grunt-contrib-stylus
###


##############
# PostStylus #
##############
###
[OVERVIEW] PostCSS adapter for Stylus:
https://www.npmjs.com/package/poststylus

[INFO] PostStylus Grunt usage:
https://www.npmjs.com/package/poststylus#grunt

[INFO] Passing plugins arguments:
https://www.npmjs.com/package/poststylus#passing-arguments-to-plugins
doiuse = require('doiuse')
###
postcss = ->
	require('poststylus') [
		################
		# AutoPrefixer #
		################
		# Automatically add browser prefixes:
		# https://www.npmjs.com/package/autoprefixer
		# [BUG] AutoPrefixer add duplicates, if one property for multiple selectors:
		# https://github.com/postcss/autoprefixer/issues/1196
		'autoprefixer'
		# [FIXME][SO] Build passed, if any warning; I need use PostCSS:
		# https://github.com/seaneking/poststylus/issues/26
		# doiuse
	]

module.exports =
	options:

		###
		[INFO] Don’t compress CSS:
		https://www.npmjs.com/package/grunt-contrib-stylus#compress
		[NOTE] Option required for doiuse just-in-place comments:
		https://www.npmjs.com/package/doiuse#ignoring-file-specific-rules
		###
		compress: false

		###
		[INFO] Preserve comments in Stylus:
		https://www.npmjs.com/package/grunt-contrib-stylus#linenos
		###
		linenos: false
		use: [postcss]

		###
		[INFO] Source map for compiled files:
		https://github.com/gruntjs/grunt-contrib-stylus/issues/118#issuecomment-98126180
		https://stylus-lang.com/docs/sourcemaps.html#javascript-api
		###
		sourcemap:

			###
			[INFO] Adds a comment with the “sourceMappingURL” to the generated CSS
			https://stylus-lang.com/docs/sourcemaps.html#options
			###
			comment: true

			###
			[REQUIRED] Inline; otherwise source maps will not generated

			[INFO] grunt-contrib-stylus can generate inline source map solely;
			but merge-source-maps move inline source map to an external file:
			https://www.npmjs.com/package/merge-source-maps
			###
			inline: true


	themecompile:
		files: [
			expand: true
			cwd: "<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/stylus/"
			src: '**/*.styl'
			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/css/"
			# [LEARN][GRUNT] Extensions in filepaths:
			# https://gruntjs.com/configuring-tasks#building-the-files-object-dynamically
			ext: '.css'
			]
	personalcompile:
		files: [
			expand: true
			cwd: "<%= templates.yamlconfig.OUTPUT_PATH %>/stylus"
			src: '**/*.styl'
			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/css"
			ext: '.css'
			]

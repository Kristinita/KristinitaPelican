########################
# grunt-contrib-stylus #
########################
###
[OVERVIEW] Compile Stylus to CSS:
https://www.npmjs.com/package/grunt-contrib-stylus
###
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
		[INFO] Enable import CSS files directly.
		“@import "path/to/KiraCSS.css"” will display content of “KiraCSS.css” in compiled CSS.
		Without this option a string “@import "path/to/KiraCSS.css"” will in compiled CSS:
		https://www.npmjs.com/package/grunt-contrib-stylus#include-css
		https://github.com/stylus/stylus/issues/448#issuecomment-3034754

		[INFO] Space in the option name:
		###
		'include css': true

		###
		[INFO] Preserve comments in Stylus:
		https://www.npmjs.com/package/grunt-contrib-stylus#linenos
		###
		linenos: false

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
			src: ["**/*.styl"
					# [INFO] Not compile deprecated CSS,
					# not to have additional unnecessary problems at the build and lint stages
					"!**/Deprecated/**/*.styl"]

			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/css/"
			# [LEARN][GRUNT] Extensions in filepaths:
			# https://gruntjs.com/configuring-tasks#building-the-files-object-dynamically
			ext: '.css'
			]

	personalcompile:
		files: [
			expand: true
			cwd: "<%= templates.yamlconfig.OUTPUT_PATH %>/stylus"
			src: ["**/*.styl"
					"!**/Deprecated/**/*.styl"]
			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/css"
			ext: '.css'
			]

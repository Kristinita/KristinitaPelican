#################
# grunt-postcss #
#################
###
[OVERVIEW] PostCSS — CSS operations:
https://postcss.org/

[INFO] Grunt adapter:
https://www.npmjs.com/package/@lodder/grunt-postcss

[OPTIONS]
https://www.npmjs.com/package/@lodder/grunt-postcss#plugin-options

[NOTE] Original repository is abandoned, use C-Lodder fork:
https://github.com/nDmitry/grunt-postcss/issues/121

[NOTE] PostCSS doesn’t support “<style>” HTML tag;
Don’t include HTML files to “src”.
###


######################
# postcss-preset-env #
######################
###
[OVERVIEW] Allows the use of CSS not supported by all browsers in browserslist.
postcss-preset-env create polyfills for not supported browsers:
https://preset-env.cssdb.org/
https://www.npmjs.com/package/postcss-preset-env

[OPTIONS]
https://github.com/csstools/postcss-plugins/tree/main/plugin-packs/postcss-preset-env#options

[INFO] Features:
https://preset-env.cssdb.org/features

[INFO] The staging process:
https://cssdb.org/#the-staging-process

[INFO] cssdb — “a database of staged CSS features”
https://cssdb.org/

[INFO] Stage 2 by default in postcss-preset-env:
https://github.com/csstools/postcss-plugins/tree/main/plugin-packs/postcss-preset-env#stage

[INFO] Grunt usage:
https://github.com/csstools/postcss-plugins/blob/main/plugin-packs/postcss-preset-env/INSTALL.md#grunt

[INFO] postcss-preset-env was previously known as cssnext:
https://cssnext.github.io/

[INFO] “minimumVendorImplementations” — allow the CSS feature
if the number of browsers specified in this option supports it.
“0” by default:
https://github.com/csstools/postcss-plugins/tree/main/plugin-packs/postcss-preset-env#minimumvendorimplementations
###
postcssPresetEnv = require('postcss-preset-env')


module.exports =
	options:

		###
		[INFO] I use PostCSS for doiuse linting solely, because I have unexpected behavior for PostStylus:
		https://github.com/seaneking/poststylus/issues/26

		For another actions I use PostStylus;
		I don’t need create source maps 2 times.

		[NOTE] merge-source-maps doesn’t work if we create a source map
		in a pipeline with PostStylus + PostCSS
		###
		map: false

		###
		[INFO] Build failed, if any warning or error of PostCSS plugin:
		https://www.npmjs.com/package/grunt-postcss#optionsfailonerror
		###
		failOnError: true


	################################
	# combine-duplicated-selectors #
	################################
	###
	[OVERVIEW] Combine duplicated selectors in generated CSS:
	https://www.npmjs.com/package/postcss-combine-duplicated-selectors

	[INFO] Stylus itself don’t combine correctly “.progress”, “.progress-bar” in my HTML

	[INFO] Remove duplicate properties option:
	https://github.com/ChristianMurphy/postcss-combine-duplicated-selectors#duplicated-properties
	###


	#######################
	# combine-media-query #
	#######################
	###
	[OVERVIEW] Combine media queries PostCSS plugin:
	https://www.npmjs.com/package/postcss-combine-media-query
	###


	################
	# AutoPrefixer #
	################
	###
	[OVERVIEW] Automatically add and remove browser prefixes:
	https://www.npmjs.com/package/autoprefixer
	###


	###########
	# cssnano #
	###########
	###
	[OVERVIEW] CSS minifier:
	http://cssnano.co/

	[OPTIONS] Optimisations:
	https://cssnano.co/docs/what-are-optimisations/

	[INFO] CSS minification benchmark:
	https://goalsmashers.github.io/css-minification-benchmark/

	[NOTE] postcss-merge-rules doesn’t work as a separate plugin,
	it works solely as a part of the cssnano:
	https://www.npmjs.com/package/postcss-merge-rules
	https://cssnano.co/docs/optimisations/mergerules/

	[NOTE] cssnano convert “.*.css” files as “.beautified.css” files to “.min.css”:
	Example: output/theme/css/components/basic.beautified.css, output/theme/css/components/basic.css ->
	output/theme/css/components/basic.min.css
	###


	###
	[FIXME] Add “postcss-purgefonts” processor for loading solely specific characters
	for “Material Icons” font:
	https://github.com/ericpaulbishop/postcss-purgefonts

	[FIXME] Add “postcss-preset-env” processor to be able to use new CSS features
	that aren’t yet supported by all browsers
	https://github.com/csstools/postcss-plugins/tree/main/plugin-packs/postcss-preset-env
	###

	# [INFO] Fix CSS problems and minify them
	fixandminifycss:
		options:
			map: true
			processors: [
				require('postcss-combine-duplicated-selectors') removeDuplicatedProperties: true
				require('postcss-combine-media-query')
				postcssPresetEnv
				require('autoprefixer')
				require("cssnano")
			]

		files: [
			expand: true
			cwd: "<%= templates.yamlconfig.OUTPUT_PATH %>"
			src: ["**/*.css"
					"!**/*.min.css"]
			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>"
			ext: '.min.css'
			]


	# [INFO] Fix and minify inline CSS, which critical adds to HTML
	fixinlinecssinhtml:
		options:
			###
			[INFO] The same processors as for “fixandminifycss” task
			###
			processors: [
				# [INFO] “postcss-combine-duplicated-selectors” and “postcss-combine-media-query”
				# needed because critical merge CSS properties from different sources
				# and many properties need to combine
				require('postcss-combine-duplicated-selectors') removeDuplicatedProperties: true
				require('postcss-combine-media-query')

				# [INFO] Create polyfills if third-party CSS contain non-stable features
				postcssPresetEnv

				# [INFO] Autoprefixer needed because critical adds code from
				# third-party sources, where there may be incorrect prefixes
				require('autoprefixer')

				# [INFO] Cssnano needed because critical merge to HTML insufficiently minified CSS
				# and also CSS rules need to be minified
				# https://cssnano.co/docs/optimisations/mergerules/
				require('cssnano')
			]

			syntax: require('postcss-html')

		###
		[INFO] Use “src”, not “files” key

		[BUG][FIXME][ISSUE] “require('postcss-combine-media-query')” works incorrectly for
		“Пример-разбора-игры-СпортСИ.html”.
		I temporarily excluded this file
		###
		src: ["<%= templates.paths.html %>"
				"!<%= templates.yamlconfig.OUTPUT_PATH %>/Gingerinas/Пример-разбора-игры-СпортСИ.html"]


	#############
	# stylelint #
	#############
	###
	[INFO] Stylelint — CSS linter:
	https://stylelint.io/

	[INFO] Configuration:
	https://stylelint.io/user-guide/configuration

	[NOTE] Not to be confused with stylint — stylus linter!
	https://simenb.github.io/stylint/

	[NOTE] Manual configuration and config file installation required:
	https://stackoverflow.com/a/55553735/5951529
	###


	##########
	# doiuse #
	##########
	###
	[OVERVIEW] A linter that checks that browsers from “browserslist” supports CSS features:
	https://www.npmjs.com/package/doiuse

	[NOTE][REQUIRED] “([])” syntax for get “browserslist”
	Otherwise all files valid

	[INFO] doiuse just-in-file comments for disabling specific checks:
	https://www.npmjs.com/package/doiuse#ignoring-file-specific-rules

	[WARNING] cssnano remove doiuse comments:
	“discardComments” option works only for comments, that begin to “/*!”:
	https://cssnano.co/optimisations/discardcomments
	but doiuse supports another format:
	https://www.npmjs.com/package/doiuse#ignoring-file-specific-rules

	[NOTE] Post “doiuse-disable” comments before “@media”.
	Otherwise, doiuse comments will be deleted and doiuse will show errors.
	###
	lintcss:
		options:
			###
			[NOTE] “map: false” remove the line
			“sourceMappingURL=<file>.min.<hash>.css.map” from file
			###
			map: true
			###
			[INFO] Post-processors usage:
			https://github.com/C-Lodder/grunt-postcss#post-processors-options
			###
			processors: [
				require('stylelint')
				require('doiuse')([])
			]

		###
		[LEARN][GRUNT] Use “files” multiple times:
		https://stackoverflow.com/q/23436631/5951529

		[INFO] Lint files from the last stage of the build.
		Raw “.css” files after Stylus compilation has errors

		[INFO] Use “files” key for “lintcss”
		###
		files: [
			expand: true
			cwd: "<%= templates.yamlconfig.OUTPUT_PATH %>"
			src: ['**/*.min.*.css']
			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>"
			]


	# [INFO] Lint CSS in HTML files
	lintcssinhtml:
		options:
			processors: [
				require('stylelint')
				require('doiuse')([])
			]

			################
			# postcss-html #
			################
			###
			[OVERVIEW] PostCSS syntax for parsing HTML:
			https://www.npmjs.com/package/postcss-html

			[INFO] grunt-postcss syntax for custom syntax:
			###

			###
			[INFO] Custom syntax for grunt-postcss:
			https://github.com/C-Lodder/grunt-postcss#optionssyntax-optionsparser-optionsstringifier
			###
			syntax: require('postcss-html')

		src: ["<%= templates.paths.html %>"]

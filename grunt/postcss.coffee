###################
## grunt-postcss ##
###################
# PostCSS — CSS operations:
# https://www.npmjs.com/package/postcss
# Grunt adapter:
# https://www.npmjs.com/package/grunt-postcss
module.exports =
	options:
		# [NOTE] Sourcemap already created by cssnano
		map: false
		# [INFO] Build failed, if any warning or error of PostCSS plugin:
		# https://www.npmjs.com/package/grunt-postcss#optionsfailonerror
		failOnError: true
		processors: [
			##########
			# doiuse #
			##########
			# Linter, check, that browsers from “browserslist” support CSS features:
			# https://www.npmjs.com/package/doiuse
			# [NOTE] “browserslist” file supported, but “[]” required;
			# Otherwise “TypeError: Cannot destructure property `browsers` of 'undefined' or 'null'.”
			require('doiuse')([])
		]
	dist:
		# [WARNING] PostCSS doesn't support “<style>” HTML tag;
		# Don't include HTML files to “src”.
		# [NOTE] Not use PostCSS for minified files. PostCSS, then minify.
		# Exclude all miified files.
		# [WARNING] cssnano remove doiuse comments:
		# “discardComments” option works only for comments, that begin to “/*!”:
		# https://cssnano.co/optimisations/discardcomments
		# but doiuse support another format:
		# https://www.npmjs.com/package/doiuse#ignoring-file-specific-rules
		# doiuse will show errors in minified files.
		src: ["<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/css/**/*.css"
				"<%= templates.yamlconfig.OUTPUT_PATH %>/css/personal/**/*.css"
				# [INFO] Ignore files: minified and with hash in name
				"!**/*.min.css"
				"!**/*.min.*.css"]

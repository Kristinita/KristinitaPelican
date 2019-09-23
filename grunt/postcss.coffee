###################
## grunt-postcss ##
###################
# PostCSS — CSS operations:
# https://www.npmjs.com/package/postcss
# Grunt adapter:
# https://www.npmjs.com/package/@lodder/grunt-postcss
# [NOTE] Original repository is abandoned, use C-Lodder fork:
# https://github.com/nDmitry/grunt-postcss/issues/121
# [WARNING] PostCSS doesn't support “<style>” HTML tag;
# Don't include HTML files to “src”.
module.exports =
	options:
		# [NOTE] Sourcemap already created by cssnano
		map: false
		# [INFO] Build failed, if any warning or error of PostCSS plugin:
		# https://www.npmjs.com/package/grunt-postcss#optionsfailonerror
		failOnError: true
	build:
		options:
			processors: [
				################################
				# combine-duplicated-selectors #
				################################
				# Combine duplicated selectors in generated CSS:
				# https://www.npmjs.com/package/postcss-combine-duplicated-selectors
				# Stylelint doesn't allow duplicated selectors:
				# https://stylelint.io/user-guide/rules/no-duplicate-selectors
				# [INFO] Stylus not combine correctly “.progress”, “progress-bar”
				require('postcss-combine-duplicated-selectors')
			]
		# [LEARN][GRUNT] Use “files” multiple times:
		# https://stackoverflow.com/q/23436631/5951529
		files: "<%= templates.paths.css %>"
	lint:
		options:
			processors: [
				##########
				# doiuse #
				##########
				# Linter, check, that browsers from “browserslist” support CSS features:
				# https://www.npmjs.com/package/doiuse
				# [NOTE] “browserslist” file supported, but “[]” required;
				# Otherwise “TypeError: Cannot destructure property `browsers` of 'undefined' or 'null'.”
				# [WARNING] cssnano remove doiuse comments:
				# “discardComments” option works only for comments, that begin to “/*!”:
				# https://cssnano.co/optimisations/discardcomments
				# but doiuse support another format:
				# https://www.npmjs.com/package/doiuse#ignoring-file-specific-rules
				# doiuse will show errors in minified files.
				require('doiuse')([])
			]
		files: "<%= templates.paths.css %>"

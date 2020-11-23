#################
# grunt-postcss #
#################
###
[OVERVIEW] PostCSS — CSS operations:
https://postcss.org/

[INFO] Grunt adapter:
https://www.npmjs.com/package/@lodder/grunt-postcss

[INFO] Options:
https://www.npmjs.com/package/@lodder/grunt-postcss#plugin-options

[NOTE] Original repository is abandoned, use C-Lodder fork:
https://github.com/nDmitry/grunt-postcss/issues/121

[NOTE] PostCSS doesn’t support “<style>” HTML tag;
Don’t include HTML files to “src”.
###
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
		###
		[LEARN][GRUNT] Use “files” multiple times:
		https://stackoverflow.com/q/23436631/5951529
		###
		files: "<%= templates.paths.css %>"

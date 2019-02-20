############
# htmllint #
############
###
Lint HTML:
http://htmllint.github.io/
https://www.npmjs.com/package/grunt-htmllint
Configuration:
https://github.com/htmllint/htmllint/wiki/Options
Inline options ignoring:
https://github.com/htmllint/htmllint/wiki/Inline-Configurations
[WARNING] 1 error — 1 toast. The number of toasts may be large!
https://github.com/htmllint/grunt-htmllint/issues/25
Run “htmllint” after “grunt” or “grunt publish” task, not after “pelican” command/
[BUG] “opts” argument erroneous:
https://github.com/htmllint/grunt-htmllint/pull/24
[NOTE] “attr-bans” modified, because Progressbar needs “style” attribute:
https://github.com/facelessuser/pymdown-extensions/issues/293
[NOTE] I enable “style” tag, because in needest for speed performance:
https://developers.google.com/web/tools/lighthouse/audits/blocking-resources
###
module.exports =
	options:
		# For correct exit codes for builds:
		# https://www.npmjs.com/package/grunt-htmllint#optionsforce
		force: false
		# Support configuration file “.htmllintrc”
		htmllintrc: true
	src: ["<%= templates.paths.output_path %>/**/*.html"]

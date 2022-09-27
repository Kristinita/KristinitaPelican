######################
# grunt-contrib-copy #
######################
###
[OVERVIEW] Copy files and folders:
https://www.npmjs.com/package/grunt-contrib-copy

[OPTIONS] https://github.com/gruntjs/grunt-contrib-copy#options
###
module.exports =

	options:
		###
		[INFO] Preserve timestamp attributes when copying files:
		https://www.unixtutorial.org/2008/04/atime-ctime-mtime-in-unix-filesystems/

		[WARNING] Option may works incorrect.
		###
		timestamp: true


	"code-of-conduct":
		###
		[INFO] If src or dest path not exist, exit code 1:
		https://www.npmjs.com/package/grunt-contrib-copy#troubleshooting

		[FIXME][ISSUE] It would be nice if would be possible use “nonull: true”
		one time in “options”. Not for each task.
		###
		nonull: true
		src: "CODE_OF_CONDUCT.md"
		dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/CODE_OF_CONDUCT.md"


	###
	[INFO] Move Stork “search-index.st” file to the output

	[PURPOSE] eclintfix modify “search-index.st” binary even if all values
	is “unset” for “.editorconfig” file:
	https://stackoverflow.com/a/40348831/5951529
	And "search-index.st" becomes invalid.

	[NOTE] Not possible ignore specific files for ECLint:
	https://github.com/jedmao/eclint/issues/80

	[FIXME][TEMP] Delete this task when migrating from unmaintained ECLint to Prettier:
	https://github.com/jedmao/eclint/issues/226#issuecomment-689193653
	###
	storkbase:
		nonull: true
		src: "<%= templates.yamlconfig.CONTENT_PATH %>/extra/search-index.st"

		###
		[NOTE][REQUIRED] Define filename. Otherwise:
		“Copying content/extra/search-index.st -> output\content\extra\search-index.st”
		###
		dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/search-index.st"

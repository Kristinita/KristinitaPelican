################
## grunt-move ##
################
###
[OVERVIEW] Move files to another folder
https://www.npmjs.com/package/grunt-move

[OPTIONS]
https://www.npmjs.com/package/grunt-move#options
###
module.exports =
	options:
		# [INFO] If incorrect src, task failed.
		ignoreMissing: false


	###############
	# Development #
	###############
	###
	[INFO] Move, not minify CSS and JavaScript in development process:
	https://stackoverflow.com/a/23670172/5951529
	###
	csstheme:
		files: [
			# [LEARN][GRUNT] If you use cwd options, be sure to turn “expand:true”.
			# If don’t set “expand:true”, cwd will not work properly:
			# https://stackoverflow.com/questions/18966485#comment38703354_23670172
			expand: true
			cwd: "<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/css"
			src: ['**/*.css'
					'!**/*.min.css']
			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/css"
			# [LEARN][GRUNT] Extensions in filepaths:
			# https://gruntjs.com/configuring-tasks#building-the-files-object-dynamically
			ext: '.min.css'
			]
	csspersonal:
		files: [
			expand: true
			cwd: "<%= templates.yamlconfig.OUTPUT_PATH %>/css/personal"
			src: ['**/*.css'
					'!**/*.min.css']
			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/css/personal"
			ext: '.min.css'
		]
	jspersonal:
		files: [
			expand: true
			cwd: "<%= templates.yamlconfig.OUTPUT_PATH %>/js/personal"
			# [LEARN][GRUNT] “!” symbol — exclude paths:
			# https://stackoverflow.com/a/28277841/5951529
			src: ['**/*.js'
					'!**/*.min.js']
			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/js/personal"
			ext: '.min.js'
		]
	jstheme:
		files: [
			expand: true
			cwd: "<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/js"
			src: ['**/*.js'
					'!**/*.min.js']
			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/js"
			ext: '.min.js'
		]


	##############
	# Production #
	##############
	# [INFO] Move licenses of all npm/Grunt and Python packages
	thirdpartylicenses:
		src: [
			"grunt-and-npm.csv"
			"python.md"
		]
		###
		[REQUIRED] Trailing slash — “/”.
		Use “licenses/”, not “licenses”, otherwise a file “licenses” will create

		[INFO] grunt-move create a needest folder, if no
		###
		dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/licenses/"

	###
	[INFO] Move license for output repository.

	[INFO] grunt-move support different file names like:
	“LICENSE” → “LICENSE.md”.

	[INFO] Need “LICENSE”, not “LICENSE.md”, because:
	1. license-generator doesn’t generate license in non-root folder,
	2. root folder already have “LICENSE.md” file for sources.
	###
	outputlicense:
		src: "LICENSE"
		dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/LICENSE.md"

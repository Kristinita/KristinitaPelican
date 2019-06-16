################
## grunt-move ##
################
# Move files to another folder
# https://www.npmjs.com/package/grunt-move
module.exports =
	# Options: https://www.npmjs.com/package/grunt-move#options
	options:
		# If incorrect src, task failed.
		ignoreMissing: false
	###############
	# Development #
	###############
	# Move, not minify CSS and JavaScript in development:
	# https://stackoverflow.com/a/23670172/5951529
	# [WARNING] “Move/csstheme/files” will doesn't work.
	# [WARNING] “expand:true” one time in options will doesn't work.
	csstheme:
		files: [
			# If you use cwd options, be sure to turn “expand:true”.
			# If you don't set “expand:true”, cwd will not work properly.
			# https://stackoverflow.com/questions/18966485#comment38703354_23670172
			expand: true
			cwd: "<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/css"
			src: ['**/*.css'
					'!**/*.min.css']
			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/css"
			# Extensions in filepaths:
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
	# Move licenses of all npm/Grunt and Python packages
	thirdpartylicenses:
		src: [
			"grunt-and-npm.csv"
			"python.md"
		]
		# [NOTE] Use “licenses/”, not “licenses”, otherwise a file “licenses” will create
		# [NOTE] grunt-move create a needest folder, if no
		dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/licenses/"
	# Move license for output repository.
	# [NOTE] grunt-move support different file names:
	# “LICENSE” → “LICENSE.md”.
	# Need “LICENSE”, not “LICENSE.md”, because:
	# 1. license-generator doesn't generate license in non-root folder,
	# 2. root folder already have “LICENSE.md” file for sources.
	outputlicense:
		src: "LICENSE"
		dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/LICENSE.md"

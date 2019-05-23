###############
# grunt-chmod #
###############
# Add read and write permissions for all output folders and files:
# https://www.npmjs.com/package/grunt-chmod
# About chmod:
# https://ss64.com/bash/chmod.html
# [DESCRIPTION]
# I open any files → I run “publishconf.py”, that delete “output” folder →
# I can get errors as:
# ERROR: Unable to delete directory D:\Kristinita\output\stylus; OSError: [WinError 145]
# The directory is not empty: 'D:\\Kristinita\\output\\stylus\\personal'
# chmod fix this problem.
# [WARNING] You need close BrowserSync before publishing,
# because it can create new permissions.
module.exports =
	options:
		# [NOTE] 444 and 666 modes works in Windows:
		# https://www.npmjs.com/package/grunt-chmod#warnings
		mode: '666'
	kiratarget:
		# All folders and files recursive, include current:
		# https://gruntjs.com/configuring-tasks#globbing-patterns
		src: ["<%= templates.yamlconfig.OUTPUT_PATH %>/**"]

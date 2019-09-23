##########
# flake8 #
##########
# flake8 — Python linter
# http://flake8.pycqa.org/en/latest/
# Grunt wrapper:
# https://www.npmjs.com/package/grunt-flake8
# Grunt options:
# https://www.npmjs.com/package/grunt-flake8#options
module.exports =
	dist:
		src: "<%= templates.paths.python %>"

#########################
## grunt-contrib-watch ##
#########################
# Run predefined tasks whenever watched file patterns added, changed or deleted:
# https://www.npmjs.com/package/grunt-contrib-watch
# Run in console “grunt watch” → change files → tasks will run
module.exports =
	# CoffeeScript compile and move
	coffee:
		files: "<%= templates.paths.coffee %>"
		# grunt-newes — compile changed files, not another:
		# https://stackoverflow.com/a/19722900/5951529
		tasks: ['newer:coffee'
				'newer:move:jstheme'
				'newer:move:jspersonal']
	# Stylus compile and move
	stylus:
		files: "<%= templates.paths.stylus %>"
		tasks: ['newer:stylus'
				'newer:move:csstheme'
				'newer:move:csspersonal']

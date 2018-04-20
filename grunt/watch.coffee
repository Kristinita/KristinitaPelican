#########################
## grunt-contrib-watch ##
#########################
# Run predefined tasks whenever watched file patterns are added, changed or deleted:
# https://www.npmjs.com/package/grunt-contrib-watch
# Run in console “grunt watch” → change files → tasks will run
module.exports =
	watch:
		scripts:
			files: ['**/*.styl']
			tasks: ['stylus']

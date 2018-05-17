#########################
## grunt-contrib-watch ##
#########################
# Run predefined tasks whenever watched file patterns added, changed or deleted:
# https://www.npmjs.com/package/grunt-contrib-watch
# Run in console “grunt watch” → change files → tasks will run
module.exports =
	# CoffeeScript compile and minify
	coffee:
		files: "<%= templates.yamlconfig.output_path %>/**/*.coffee"
		# grunt-newes — compile changed files, not another:
		# https://stackoverflow.com/a/19722900/5951529
		tasks: ['newer:coffee'
				'newer:uglify']
	# Stylus compile and minify
	stylus:
		files: "<%= templates.yamlconfig.output_path %>/**/*.styl"
		tasks: ['newer:stylus'
				'newer:cssnano']

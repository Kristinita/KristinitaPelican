###################
## gulp-htmltidy ##
###################
# Validate HTML
# https://www.npmjs.com/package/gulp-htmltidy

##########################
## grunt-gulp variables ##
##########################
# https://www.npmjs.com/package/grunt-gulp#examples
# CoffeeScript to JavaScript online — http://js2.coffee/

gulp = require('gulp')
htmltidy = require('gulp-htmltidy')

# For in-place dest needs «base: "."», see:
# https://stackoverflow.com/a/44337370/5951529
# [BUG] Doesn't work for multiple commands, see:
# https://github.com/shama/grunt-gulp/issues/13
module.exports =
	gulptidy:
		gulp.src('<%= templates.paths.html %>', base: ".")
		.pipe(htmltidy(
			doctype: 'html5'
			indent: true
			wrap: 0)).pipe gulp.dest('./')

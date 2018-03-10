##########################
## grunt-contrib-stylus ##
##########################
# Compile Stylus to CSS
# https://github.com/gruntjs/grunt-contrib-stylus
module.exports =
	options:
		compress: false
		# linenos not save comments, linenos add extra constructions as “/* line 479 : D:\Kristinita\output\theme\stylus\sections\core-design.styl */”. So false.
		linenos: false
	themecompile:
		files: [
			expand: true
			cwd: 'output/theme/stylus/'
			src: '**/*.styl'
			dest: 'output/theme/css'
			ext: '.css'
			]
	personalcompile:
		files: [
			expand: true
			cwd: 'output/stylus'
			src: '**/**/*.styl'
			dest: 'output/css'
			# Extensions in filepaths:
			# https://gruntjs.com/configuring-tasks#building-the-files-object-dynamically
			ext: '.css'
			]
##########################
## grunt-contrib-stylus ##
##########################
# Compile Stylus to CSS:
# https://www.npmjs.com/package/grunt-contrib-stylus
module.exports =
	options:
		compress: false
		# linenos not save comments, linenos add extra constructions as “/* line 479 :
		# D:\Kristinita\output\theme\stylus\sections\core-design.styl */”. So false.
		linenos: false
	themecompile:
		files: [
			expand: true
			cwd: "<%= templates.yamlconfig.output_path %>/<%= templates.paths.theme_static_dir %>/stylus/"
			src: '**/*.styl'
			dest: "<%= templates.yamlconfig.output_path %>/<%= templates.paths.theme_static_dir %>/css"
			ext: '.css'
			]
	personalcompile:
		files: [
			expand: true
			cwd: "<%= templates.paths.output_path %>/stylus"
			src: '**/**/*.styl'
			dest: "<%= templates.paths.output_path %>/css"
			# Extensions in filepaths:
			# https://gruntjs.com/configuring-tasks#building-the-files-object-dynamically
			ext: '.css'
			]

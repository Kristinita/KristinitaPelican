###########
# cssnano #
###########
# CSS minifier:
# http://cssnano.co/
# https://www.npmjs.com/package/grunt-cssnano
# Rules:
# http://cssnano.co/guides/optimisations/
module.exports =
	options:
		sourcemap: false
	nanopersonal:
		files: [
			expand: true
			cwd: "<%= templates.paths.output_path %>/css/personal"
			src: ['**/**/*.css'
					'!**/**/*.min.css']
			dest: "<%= templates.paths.output_path %>/css/personal"
			# Extensions in filepaths:
			# https://gruntjs.com/configuring-tasks#building-the-files-object-dynamically
			ext: '.min.css'
			]
	nanotheme:
		files: [
			expand: true
			cwd: "<%= templates.paths.output_path %>/<%= templates.yamlconfig.theme_static_dir %>/css"
			src: ['**/**/*.css'
					'!**/**/*.min.css']
			dest: "<%= templates.paths.output_path %>/<%= templates.yamlconfig.theme_static_dir %>/css"
			# Extensions in filepaths:
			# https://gruntjs.com/configuring-tasks#building-the-files-object-dynamically
			ext: '.min.css'
			]

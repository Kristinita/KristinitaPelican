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
		# [LEARN][CSS][JAVASCRIPT] Sourcemaps
		# make debugging simply, if styles and scripts combine and compress:
		# https://blog.teamtreehouse.com/introduction-source-maps
		sourcemap: true
	nanopersonal:
		files: [
			expand: true
			cwd: "<%= templates.paths.output_path %>/css/personal"
			src: ['**/*.css'
					'!**/*.min.css']
			dest: "<%= templates.paths.output_path %>/css/personal"
			# Extensions in filepaths:
			# https://gruntjs.com/configuring-tasks#building-the-files-object-dynamically
			ext: '.min.css'
			]
	nanotheme:
		files: [
			expand: true
			cwd: "<%= templates.paths.output_path %>/<%= templates.yamlconfig.theme_static_dir %>/css"
			src: ['!**/*.css'
					'**/*.min.css']
			dest: "<%= templates.paths.output_path %>/<%= templates.yamlconfig.theme_static_dir %>/css"
			# Extensions in filepaths:
			# https://gruntjs.com/configuring-tasks#building-the-files-object-dynamically
			ext: '.min.css'
			]

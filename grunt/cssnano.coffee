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
			cwd: "<%= templates.yamlconfig.OUTPUT_PATH %>/css/personal"
			src: ['**/*.css'
					'!**/*.min.css']
			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/css/personal"
			# Extensions in filepaths:
			# https://gruntjs.com/configuring-tasks#building-the-files-object-dynamically
			ext: '.min.css'
			]
	nanotheme:
		files: [
			expand: true
			cwd: "<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/css"
			src: ['**/*.css'
					'!**/*.min.css']
			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/css"
			# Extensions in filepaths:
			# https://gruntjs.com/configuring-tasks#building-the-files-object-dynamically
			ext: '.min.css'
			]

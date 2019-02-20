##########################
## grunt-contrib-stylus ##
##########################
# Compile Stylus to CSS:
# https://www.npmjs.com/package/grunt-contrib-stylus

##############
# PostStylus #
##############
# PostCSS adapter for Stylus:
# https://www.npmjs.com/package/poststylus

# [INFO] Passing plugins arguments:
# https://www.npmjs.com/package/poststylus#passing-arguments-to-plugins
doiuse = require('doiuse')

# [INFO] PostStylus Grunt usage:
# https://www.npmjs.com/package/poststylus#grunt
postcss = ->
	require('poststylus') [
		################
		# AutoPrefixer #
		################
		# Automatically add browser prefixes:
		# https://www.npmjs.com/package/autoprefixer
		'autoprefixer'
		# [FIXME][SO] Build passed, if any warning; I need use PostCSS:
		# https://github.com/seaneking/poststylus/issues/26
		# doiuse
	]

module.exports =
	options:
		# [INFO] Doesn't compress CSS:
		# https://www.npmjs.com/package/grunt-contrib-stylus#compress
		# [NOTE] Option required for doiuse just-in-place comments:
		# https://www.npmjs.com/package/doiuse#ignoring-file-specific-rules
		compress: false
		# [INFO] Preserve comments in Stylus:
		# https://www.npmjs.com/package/grunt-contrib-stylus#linenos
		linenos: false
		use: [postcss]
	themecompile:
		files: [
			expand: true
			cwd: "<%= templates.paths.output_path %>/<%= templates.paths.theme_static_dir %>/stylus/"
			src: '**/*.styl'
			dest: "<%= templates.paths.output_path %>/<%= templates.paths.theme_static_dir %>/css/"
			ext: '.css'
			]
	personalcompile:
		files: [
			expand: true
			cwd: "<%= templates.paths.output_path %>/stylus"
			src: '**/**/*.styl'
			dest: "<%= templates.paths.output_path %>/css"
			# [LEARN][GRUNT] Extensions in filepaths:
			# https://gruntjs.com/configuring-tasks#building-the-files-object-dynamically
			ext: '.css'
			]

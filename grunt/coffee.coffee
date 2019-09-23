########################
# grunt-contrib-coffee #
########################
# Compile CoffeeScript to JavaScript
# https://www.npmjs.com/package/grunt-contrib-coffee
module.exports =
	options:
		# [NOTE] If false, plugin wrap JavaScript file to
		# “(function() { ... }).call(this);”
		bare: true
		# Generate sourcemap
		sourceMap: false
	personalcompile:
		files: [
			expand: true
			cwd: "<%= templates.yamlconfig.OUTPUT_PATH %>/coffee"
			src: '**/*.coffee'
			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/js"
			ext: '.js'
			]
	themecompile:
		files: [
			expand: true
			cwd: "<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/coffee"
			src: '**/*.coffee'
			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/js"
			ext: '.js'
			]

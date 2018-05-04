########################
# grunt-contrib-coffee #
########################
# Compile CoffeeScript to JavaScript
# https://www.npmjs.com/package/grunt-contrib-coffee
module.exports =
	options:
		# If false, plugin wrap JavaScript file to
		# “(function() { ... }).call(this);”
		bare: true
		# Generate sourcemap
		sourceMap: true
	themecompile:
		files: [
			expand: true
			cwd: "<%= templates.yamlconfig.output_path %>/<%= templates.paths.theme_static_dir %>/coffee/"
			src: '**/*.coffee'
			dest: "<%= templates.yamlconfig.output_path %>/<%= templates.paths.theme_static_dir %>/js"
			ext: '.js'
			]

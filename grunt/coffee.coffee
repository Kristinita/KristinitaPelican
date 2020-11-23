########################
# grunt-contrib-coffee #
########################
###
[OVERVIEW] Compile CoffeeScript to JavaScript:
https://www.npmjs.com/package/grunt-contrib-coffee
###
module.exports =
	options:
		###
		[NOTE] If false, plugin wrap JavaScript file to
		“(function() { ... }).call(this);”
		###
		bare: true

		###
		[INFO] Generate sourcemap:
		https://stackoverflow.com/a/15254469/5951529
		https://gunnariauvinen.com/using-source-maps-with-coffeescript/

		[NOTE] Despite the fact that CoffeeScript supports inline source maps,
		grunt-contrib-coffee doesn’t support them:
		https://github.com/gruntjs/grunt-contrib-coffee/issues/132
		https://coffeescript.org/#cli
		###
		sourceMap: true

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

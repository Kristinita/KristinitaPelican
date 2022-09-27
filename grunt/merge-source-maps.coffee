#####################
# merge-source-maps #
#####################
###
[OVERVIEW] Combine source maps if we have separate source maps for each step of compilation;
e. g. CoffeeScript → JavaScript → minified JavaScript:
https://www.npmjs.com/package/merge-source-maps
https://blog.sentry.io/2018/10/18/4-reasons-why-your-source-maps-are-broken

[INFO] Grunt task example:
https://www.npmjs.com/package/merge-source-maps#usage-examples

[INFO] Options:
https://www.npmjs.com/package/merge-source-maps#options

[INFO] Caveats and limitations:
https://www.npmjs.com/package/merge-source-maps#caveats-and-limitations

[INFO] I use it for production solely (“grunt publish”), for development I already have required source maps
###
module.exports =
	options:

		###
		[INFO] Add original source code to the “sourcesContent” property of source map;
		original sources files will available in browser debug tools:
		https://www.npmjs.com/package/merge-source-maps#inlinesources---inline-sources
		https://blog.sentry.io/2018/10/18/4-reasons-why-your-source-maps-are-broken#missing-original-source-files
		###
		inlineSources: true

		###
		[INFO] Inline source map instead of source map in external file.
		It’s suitable for debug builds, but not for production, where bandwidth matters.
		Inlined source maps shouldn’t be used in production:
		https://www.npmjs.com/package/merge-source-maps#inlined-source-maps-and-sources
		https://www.npmjs.com/package/merge-source-maps#external-source-maps-with-inlined-sources
		https://stackoverflow.com/a/27712920/5951529
		###
		inlineSourceMap: false

		# [INFO] Fatal error if missing source maps and input files
		ignoreMissingSourceMaps: false

		# [BUG] PurgeCSS generates incorrect source maps:
		# https://github.com/FullHuman/purgecss/issues/995
		# I set “true” until the bug is fixed
		ignoreMissingSources: true

	target:
		###
		[INFO] Source files must be final step in the compilation process;
		for me it “KiraFile.min.<hash>.js”:
		https://www.npmjs.com/package/merge-source-maps#source-files

		[WARNING] Currently, I use merge-source-maps for CSS solely,
		in a pipeline Stylus → CSS → minified CSS → cache busted files.
		I couldn’t find how I can generate source maps use Closure Compiler:
		https://github.com/google/closure-compiler/issues/3729
		###
		files: [
			expand: true
			cwd: "<%= templates.yamlconfig.OUTPUT_PATH %>"
			src: ['**/*.min.*.css']
			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>"
			]

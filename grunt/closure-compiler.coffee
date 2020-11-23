###########
# Closure #
###########
###
[OVERVIEW] JavaScript compiler/minifier:
https://developers.google.com/closure/compiler/

[INFO] In benchmark Closure have better results than its alternatives:
https://evmar.github.io/js-min-bench/

[INFO] Google JavaScript style guide:
https://google.github.io/styleguide/jsguide

[INFO] FAQ:
https://github.com/google/closure-compiler/wiki/FAQ

[INFO] npm version:
https://www.npmjs.com/package/google-closure-compiler

[INFO] Grunt wrapper:
https://github.com/google/closure-compiler-npm/blob/master/packages/google-closure-compiler/docs/grunt.md

[INFO] This is Java package, JavaScript version deprecated:
https://github.com/google/closure-compiler-npm/blob/master/packages/google-closure-compiler-js/readme.md

[INFO] Options:
https://github.com/google/closure-compiler/wiki/Flags-and-Options

[NOTE] I didn’t find information about default Closure configuration file.

[INFO] Online compiler:
https://closure-compiler.appspot.com/

[WARNING] I can’t generate source maps for all compiled files:
https://github.com/google/closure-compiler/issues/3729
###
module.exports =
	options:
		###
		[INFO] Compilation levels:
		https://developers.google.com/closure/compiler/docs/compilation_levels

		[INFO] I select SIMPLE compilation level, because my scripts depend on other scripts;
		if “ADVANCED”, names will be reduced and I will get errors.
		https://developers.google.com/closure/compiler/docs/api-tutorial3
		###
		compilation_level: "SIMPLE"

		###

		https://blog.sentry.io/2018/10/18/4-reasons-why-your-source-maps-are-broken

		[LEARN][CSS][JAVASCRIPT] Sourcemaps.
		They make debugging simply, if styles and scripts combine and compress:
		https://blog.teamtreehouse.com/introduction-source-maps

		source_map_input: true
		###

		# [INFO] More detailed output
		debug: true


		###
		[INFO] “Externs are declarations that tell Closure Compiler the names of symbols
		that shouldn’t be renamed during advanced compilation.”:
		https://developers.google.com/closure/compiler/docs/externs-and-exports

		[NOTE] “externs” for Closure it a files with specific format like these:
		https://github.com/google/closure-compiler/wiki/Externs-For-Common-Libraries

		[NOTE] It’s not enough to specify required dependencies and
		“jscomp_off” will not need.

		[INFO] Instruction how to create externs:
		https://blogs.missouristate.edu/web/2013/09/12/how-to-write-closure-compiler-extern-files-part-1-the-basics/

		externs: ["https://browser-update.org/update.min.js"]
		###


		###
		[WARNING] This option doesn’t work in Grunt, if “jscomp_warning: "*"”:
		https://github.com/google/closure-compiler/issues/3727

		[INFO] Types of warnings that we need to ignore:
		https://github.com/google/closure-compiler/wiki/Flags-and-Options#warning-and-error-management

		[INFO] This option required, because some JavaScript files works solely with dependencies;
		but I couldn’t find a method, how we can pass it to Closure

		[INFO] Full properties list:
		https://github.com/google/closure-compiler/blob/6a2d09dffb78901591c3cd2614fa1100d461a9cc/src
		/com/google/javascript/jscomp/parsing/ParserConfig.properties#L151-L202
		https://github.com/google/closure-compiler/blob/66cb88323812ff03b5f5e0de09d7962c4ef25009/src
		/com/google/javascript/jscomp/DiagnosticGroups.java#L126-L172

		[INFO] Warning — property table:
		https://github.com/google/closure-compiler/wiki/@suppress-annotations#error-to-suppression-map

		[EXAMPLE] If Closure show “JSC_POSSIBLE_INEXISTENT_PROPERTY”,
		use “missingProperties” property.
		###
		jscomp_off: [

					# [FIXME][ISSUE] I can’t fix “[JSC_NOT_A_CONSTRUCTOR]” error for “Clipboard.js” file,
					# if “undefinedVars” enable:
					'checkTypes'

					# [INFO] Disable “[JSC_STRICT_INEXISTENT_PROPERTY]” error;
					# I don’t know, how I can fix it and “[JSC_UNDEFINED_VARIABLE]”, if I add JavaScript via “script” tag:
					# https://github.com/google/closure-compiler/issues/3727#issue-747633002
					'missingProperties'

					# [INFO] Disable “[JSC_UNDEFINED_VARIABLE]” error
					'undefinedVars'
				]


		###
		[WARNING] I can’t find, how I can disable specific errors/warnings:
		https://stackoverflow.com/q/64927683/5951529

		[INFO] Warning categories:
		https://github.com/google/closure-compiler/wiki/Warnings#warnings-categories

		[INFO] “[JSC_VAR] Using `var` (prefer `const` or `let`)”
		Prefer “const” over “let” and “var”:
		https://ardalis.com/javascript-let-const-and-var/
		https://google.github.io/styleguide/jsguide.html#features-use-const-and-let

		[WARNING] But CoffeeScript doesn’t support “let” and “const”:
		https://coffeescript.org/#unsupported-let-const
		https://github.com/jashkenas/coffeescript/issues/3571

		[INFO] Closure linter is deprecated, use this option instead:
		https://developers.google.com/closure/utilities
		https://github.com/google/closure-compiler/wiki/Lint-checks

		jscomp_warning: "*"
		###

		# [INFO] All latest JavaScript features supported
		language_in: "ECMASCRIPT_NEXT"

		###
		[NOTE] No “ECMASCRIPT_NEXT” in list of available values, but it works for me:
		https://github.com/google/closure-compiler/wiki/Flags-and-Options#basic-usage
		###
		language_out: "ECMASCRIPT_NEXT"

		###
		[INFO] Show all warnings:
		https://github.com/google/closure-compiler/wiki/Warnings
		###
		warning_level: "VERBOSE"


	target:
		files: [
			expand: true
			cwd: "<%= templates.yamlconfig.OUTPUT_PATH %>"

			# [LEARN][GRUNT] “!” symbol — exclude paths:
			# https://stackoverflow.com/a/28277841/5951529
			src: ['**/*.js'
					'!**/*.min*js']
			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>"

			# [LEARN][GRUNT] Extensions in filepaths:
			# https://gruntjs.com/configuring-tasks#building-the-files-object-dynamically
			ext: '.min.js'
			]

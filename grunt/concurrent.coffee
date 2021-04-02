####################
# grunt-concurrent #
####################
###
[ACTION] Run multiple tasks:
https://www.npmjs.com/package/grunt-concurrent
###


###############
# grunt-newer #
###############
###
[ACTION] Run task, if src files change:
https://www.npmjs.com/package/grunt-newer
https://www.html5rocks.com/en/tutorials/tooling/supercharging-your-gruntfile/#toc-buildtime
###
module.exports =

	options:
		###
		[INFO] This option is best used with tasks that
		don’t exit like watch and nodemon to monitor the output of long-running concurrent tasks:
		https://www.npmjs.com/package/grunt-concurrent#logconcurrentoutput
		https://github.com/sindresorhus/grunt-concurrent/issues/43#issue-37014351
		###
		logConcurrentOutput: false

		###
		[INFO] Max number of concurrent tasks:
		https://stackoverflow.com/a/20963687/5951529
		https://www.npmjs.com/package/grunt-concurrent#limit

		[INFO] Default value — twice the number of CPU cores with a minimum of 2
		https://www.npmjs.com/package/grunt-concurrent#limit
		https://stackoverflow.com/a/20963687/5951529
		I use default value

		limit: require('os').cpus().length
		###


	###
	For development, “target build”.

	[NOTE] Don't use “newer:” for shell tasks!
	grunt-newer check, that your source (src) not change and doesn't run build process.
	###
	tarb1: ['shell:generate']
	tarb2: [
			# [NOTE] newer doesn't work for cwebp
			'cwebp'
			'modernizr'
			]
	tarb3: ['newer:coffee'
			'newer:stylus']
	tarb4: ['clean']
	# [FIXME] grunt-newer doesn't work with purgecss:
	# Warning: Cannot read property 'forEach' of undefined Use --force to continue.
	# https://github.com/purgecss/grunt-purgecss/issues/26
	tarb5: ['curl'
			'newer:string-replace'
			'newer:purgecss']
	tarb6: ['shell:tidymodify']
	tarb7: ['newer:postcss']
	tarb8: ['shell:eclintfix']
	tarb9: ['newer:jsbeautifier']
	tarb10: ['notify:default']


	###
	For screenshots, “target screenshot”.

	Grunt-pageres works incorrect with absolute URLs. I use local URLs with “grunt-http-server”:
	I need build site with localhost URLs → make screenshots → build site with absolute URLs.
	###
	tarsc1: ['pageres']


	###
	For publishing, “target publish”.

	[NOTE] Don't use “newer” for publishing, because output directory deleted →
	all src files will newer.
	###


	#####################
	# grunt-checkbranch #
	#####################
	# Check, that you in right branch:
	# https://www.npmjs.com/package/grunt-checkbranch
	tarp1: ['checkbranch:master']
	tarp2: ['shell:deploy']
	# Don't use “newer” for “move”! Files from “root-html” doesn't move.
	# Don't use “newer” with “realFavicon”! “index.html” will not changed!
	# [FIXME] Split tasks, because max number of concurrent tasks — 4;
	# “tarp3” currently have 7 tasks.
	# https://travis-ci.com/github/Kristinita/KristinitaPelican/jobs/488737915#L1268-L1270
	tarp3: ['license_finder'
			'realFavicon'
			'humans_txt'
			'robotstxt'
			'shell:licensegenerator'
			'shell:covgen'
			'shell:piplicenses']
	tarp4: ['cwebp'
			'modernizr'
			'move:thirdpartylicenses'
			'move:outputlicense']
	tarp5: ['stylus'
			'coffee'
			'unused'
			'copy']
	tarp6: ['string-replace']
	tarp7: ['clean'
			'curl'
			# [FIXME] Warning: Error: The system cannot find the path specified.
			# 'imagemin'
			'purgecss']
	tarp8: ['shell:tidymodify'
			'closure-compiler']
	tarp9: ['cssnano']
	tarp10: ['cacheBust']
	tarp11: ['critical']
	tarp12: ['htmlmin'
			'merge-source-maps']
	tarp13: ['shell:eclintfix']
	tarp14: ['notify:publish']


	###
	For updating dependencies, “target update”.
	###
	taru1: [
			# [DONE]
			# [PATCH] https://github.com/seaneking/poststylus/pull/28

			# [FIXME] PostStylus doesn’t work after
			# Autoprefixer update to version 10:
			# https://github.com/postcss/autoprefixer/issues/1358
			# https://github.com/postcss/autoprefixer/releases/tag/10.0.0

			# [FIXME] grunt-critical works too slow after upgrade to 2.0.0;
			# 1.1.3 — 1m42s
			# 2.0.0 — 21m31s
			# I downgraded it, because AppVeyor hangs:
			# https://ci.appveyor.com/project/Kristinita/kristinitapelican/build/job/9pr390t692pr65oa#L2999
			# [NOTE] grunt-critical + grunt-pageres + grunt-load-config issue:
			# https://github.com/bezoerb/grunt-critical/issues/65

			# [DONE]
			# [FIXME] grunt-cwebp doesn’t convert images to webp in 3.0.1;
			# I downgraded it:
			# https://github.com/1000ch/grunt-cwebp/issues/14
			# 'devUpdate'
			'shell:gitreflog']
	taru2: ['projectUpdate'
			'shell:pipenvupdateall'
			'shell:gitgarbagecollector']
	taru3: ['shell:pipenvcleanunused']
	taru4: ['shell:pipenvupdatepipfilelock']


	###
	For validating sources, “target sources”.
	###
	tars1: ['coffeelint:configs'
			'markdownlint'
			'remark'
			'shell:bashate']


	###
	For validating output, “target validate”.
	###
	tarv1: ['coffeelint:site'
			'html-nu'
			'path_validator'
			'postcss'
			'shell:tidyvalidate'
			'stylelint'
			'stylint']
	tarv2: [
			# [DEPRECATED] CSSLint is abandoned;
			# I can’t ignore CSS parts with variables.
			# https://github.com/CSSLint/csslint/issues/720
			# https://github.com/CSSLint/csslint/issues/682
			# 'csslint'
			'shell:eclintcheck']
	tarv3: ['notify:validate']


	###
	For validating solely in development mode, “target validate development”.

	[INFO] I haven’t combined the tasks, because “clean-console” and “pageres” is multiprocessor
	and can take up a lot of CPU.

	[NOTE] clean-console solely for development:
	Site developer can create new files → absolute links will not works in production →
	clean-console will shown errors. Therefore, solely for development.
	[NOTE] clean-console works with http-server — “grunt http-server clean-console”.
	See “clean-console.coffee” for details.
	###
	tard1: ['clean-console']

	###
	[FIXME] I get “Fatal error: Maximum call stack size exceeded”
	when CheckPages checks the file “Библиотека-непрерывного-обучения.html”

	tard2: ['checkPages']
	###

	###
	[FIXME] pageres doesn’t work with grunt-critical:
	https://github.com/bezoerb/grunt-critical/issues/65

	tard3: ['pageres']
	###
	tard2: ['notify:validate']


	###
	For Continuous Integration tasks, “target remote”.
	Use, if big dependencies needest for task running.

	[NOTE] At April 2018 exists Ruby version of Travis Client, not versions for another languages →
	user need to install Ruby virtual environment locally:
	lint “.travis.yml” — small improvement, that install Ruby virtual environment.
	ShellCheck needs extra dependency scoop for Windows:
	https://github.com/koalaman/shellcheck#installing
	###
	tarr1: ['shell:localappveyor'
			'shell:shellcheck']
	tarr2: ['notify:validate']


	###
	[BUG] “travis lint -x” successfully works for me,
	but after “shell:travislint” command prompt hangs:
	https://github.com/sindresorhus/grunt-shell/issues/121
	###
	###
	[DONE]
	https://github.com/travis-ci/travis.rb/issues/422
	https://github.com/travis-ci/travis.rb/issues/376#issuecomment-693209274
	[BUG] Travis Client doesn't recognized APT addon:
	https://github.com/travis-ci/travis-yaml/issues/58
	https://github.com/travis-ci/travis.rb/issues/422
	[BUG] “matrix.include” warnings:
	https://github.com/travis-ci/travis.rb/issues/376
	###
	# tarr2: ['shell:travislint']


	###
	For Travis CI specific tasks, not for local or another CI — “target travis”.
	If task in this section, please, give reasons, why not local or another CI:
	[NOTE] Doesn't need in local, because commitlint+husky lints commit,
	when I make it locally:
	http://marionebl.github.io/commitlint/#/guides-local-setup
	Doesn't work in AppVeyor or another CI, Travis-specific:
	https://github.com/marionebl/commitlint/blob/master/%40commitlint/travis-cli/src/cli.js
	###
	tart1: ['shell:commitlint']
	tart2: ['notify:validate']


	###
	For validating tasks, that doesn't work in AppVeyor from behind AppVeyor bugs — “target not appveyor”:
	[BUG] HTML Tidy doesn't modify files with Cyrillic names in AppVeyor →
	files still contains errors:
	https://ci.appveyor.com/project/Kristinita/kristinitapelican/build/1.0.37/job/vjjwi959rqgfm6da
	https://github.com/appveyor/ci/issues/2107
	[BUG] pylint compare:
	https://ci.appveyor.com/project/Kristinita/sashagruntdebugging/builds/24778420
	https://travis-ci.org/Kristinita/SashaGruntDebugging/builds/536620396
	###
	tarna1: ['htmlhint'
			'htmllint'
			'pylint'
			]
	tarna2: ['notify:validate']


	###
	For tasks after site deploy — “target after deploy”:
	[INFO] PageSpeed require remote site;
	I can’t fix “Serve static assets with an efficient cache policy” for localhost
	###
	tarad1: [
			# [PATCH] https://github.com/jrcryer/grunt-pagespeed/pull/36
			'pagespeed'
			]
	tarad2: ['notify:validate']

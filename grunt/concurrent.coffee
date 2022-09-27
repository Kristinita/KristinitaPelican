####################
# grunt-concurrent #
####################
###
[OVERVIEW] Run multiple tasks:
https://www.npmjs.com/package/grunt-concurrent
###


###############
# grunt-newer #
###############
###
[OVERVIEW] Run task, if src files change:
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
	For updating dependencies, “target update”.
	###
	taru1: ['devUpdate'
			'shell:gitreflog']
	taru2: ['projectUpdate'
			'shell:pipenvupdateall'
			'shell:gitgarbagecollector']
	taru3: ['shell:pipenvcleanunused']
	taru4: ['shell:pipenvupdatepipfilelock']


	###
	For quick development, “target build”.

	[NOTE] Don't use “newer:” for shell tasks!
	grunt-newer check, that your source (src) not change and doesn't run build process.
	###
	tarb1: ['shell:generate']
	tarb2: ['newer:posthtml'
			# [NOTE] newer doesn't work for cwebp
			'cwebp'
			'realFavicon'
			]
	tarb3: ['newer:coffee'
			'newer:stylus']
	tarb4: ['clean']

	###
	[FIXME] grunt-newer doesn’t work with purgecss:
	Warning: Cannot read property 'forEach' of undefined Use --force to continue.
	https://github.com/purgecss/grunt-purgecss/issues/26
	###
	tarb5: ['newer:string-replace:html'
			'newer:purgecss']
	tarb6: ['shell:tidymodify']
	tarb7: ['newer:postcss']
	tarb8: ['shell:eclintfix']
	tarb9: ['newer:jsbeautifier']
	tarb10: ['notify:default']


	###
	For real site publishing, “target publish”.

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
	###
	[NOTE] Don't use “newer” for “move”! Files from “root-html” doesn't move.
	[NOTE] Don't use “newer” with “realFavicon”! “index.html” will not changed!
	###
	tarp3: ['license_finder'
			'realFavicon'
			'humans_txt'
			'robotstxt']
	tarp4: ['shell:licensegenerator'
			# [FIXME] 2 lines in the end of the “CODE_OF_CONDUCT.md” file:
			# https://app.travis-ci.com/github/Kristinita/KristinitaPelican/jobs/579322285#L1602
			'shell:covgen'
			'shell:piplicenses']
	tarp5: ['posthtml'
			'cwebp'
			'move:thirdpartylicenses'
			'move:outputlicense']
	tarp6: ['stylus'
			'coffee'
			'unused'
			'copy:code-of-conduct']
	tarp7: ['string-replace:html'
			'string-replace:css']
	tarp8: ['clean'
			'imagemin'
			'purgecss']
	tarp9: ['shell:tidymodify'
			'closure-compiler']
	tarp10: ['string-replace:htmlaftertidy'
			'postcss:fixandminifycss']
	tarp11: ['cacheBust']
	tarp12: ['critical']
	tarp13: ['htmlmin'
			'merge-source-maps']
	tarp14: ['postcss:fixinlinecssinhtml']
	tarp15: ['shell:eclintfix']
	# [FIXME][TEMP] Before migrating from eclintfix to Prettier
	tarp16: ['copy:storkbase']
	tarp17: ['notify:publish']


	###
	For validating sources, “target sources”.
	###
	tars1: ['coffeelint:configs'
			'markdownlint'
			'shell:remark'
			'shell:bashate']

	tars2: ['shell:djlint'
			'stylint'
			'shell:localappveyor'
			'shell:shellcheck']

	###
	For Continuous Integration tasks, “target remote”.
	Use, if big dependencies needest for task running.

	[NOTE] At April 2018 exists Ruby version of Travis Client, not versions for another languages →
	user need to install Ruby virtual environment locally:
	lint “.travis.yml” — small improvement, that install Ruby virtual environment.

	[BUG] “travis lint -x” successfully works for me,
	but after “shell:travislint” command prompt hangs:
	https://github.com/sindresorhus/grunt-shell/issues/121

	tars3: ['shell:travislint']
	###


	###
	For validating output, “target output”.
	###
	taro1: ['coffeelint:site'
			'html-nu'
			'path_validator']
	taro2: ['shell:tidyvalidate'
			'postcss:lintcss'
			'postcss:lintcssinhtml']
	###
	[FIXME][BUG][ISSUE] PostCSS always modify files include for lint tasks
	PostCSS delete blank end line in the end of CSS files.

	I need to create issue, how to not modify files using PostCSS
	###
	taro3: ['shell:eclintfix']
	# [FIXME][TEMP] Before migrating from eclintfix to Prettier
	taro4: ['copy:storkbase']
	taro5: ['shell:eclintcheck']
	taro6: ['notify:validate']


	###
	[FIXME][NOTE] “grunt validatelocalhost” from “aliases.yaml” doesn’t work.
	Use “grunt http-server checkPages” directly in “.travis.yml” and “appveyor.yml”.

	For example, this configuration doesn’t work:
	tarl1: ['http-server'
			'checkPages']


	[PATCH] https://github.com/divhide/node-grunt-http-server/pull/27


	[BUG][FIXME][SO] clean-console incompatible with “bulma-navbar.coffee”,
	which I use in almost all my html files.
	Need to ask on Stack Overflow about replacing clean-console that uses unmantained PhantomJS

	[INFO] I can’t combine asks, because “clean-console” and “pageres” is multiprocessor
	and can take up a lot of CPU.

	[NOTE] clean-console solely for development:
	Site developer can create new files → absolute links will not works in production →
	clean-console will shown errors. Therefore, solely for development.
	[NOTE] clean-console works solely with http-server — “grunt http-server clean-console”.
	See “clean-console.coffee” for details.

	tarl2: ['clean-console']


	[FIXME] pageres doesn’t work with grunt-critical:
	https://github.com/bezoerb/grunt-critical/issues/65
	tarl3: ['pageres']

	tarl4: ['notify:validate']
	###


	###
	[INFO] For Travis CI specific tasks, not for local or another CI — “target travis”.
	If task in this section, please, give reasons, why not local or another CI:

	[NOTE] Doesn't need in local, because commitlint+husky lints commit,
	when I make it locally:
	http://marionebl.github.io/commitlint/#/guides-local-setup
	Doesn’t work in AppVeyor or another CI, Travis-specific:
	https://github.com/marionebl/commitlint/blob/master/%40commitlint/travis-cli/src/cli.js
	###
	tart1: ['shell:commitlint']
	tart2: ['notify:validate']


	###
	[INFO] For validating tasks, that doesn't work in AppVeyor from behind AppVeyor bugs — “target not appveyor”:

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
	[INFO] For tasks after successful completion of tests — “target after tests”

	[INFO] Relative paths required for some tasks as “checkPages”.
	In “targetaftertests” I replace relative paths to absolute after successful tests.
	###
	tarat1: ['string-replace:html-relative-to-absolute-paths']
	tarat2: ['notify:publish']


	###
	[INFO] For tasks after site deploy — “target after deploy”:

	[INFO] PageSpeed require remote site;
	I can’t fix “Serve static assets with an efficient cache policy” for localhost
	###
	tarad1: [
			# [PATCH] https://github.com/jrcryer/grunt-pagespeed/pull/36
			'pagespeed'
			]
	tarad2: ['notify:validate']

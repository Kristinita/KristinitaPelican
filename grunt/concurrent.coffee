######################
## grunt-concurrent ##
######################
# Run multiple tasks:
# https://www.npmjs.com/package/grunt-concurrent
#################
## grunt-newer ##
#################
# grunt-newer
# Run task, if src files change.
# https://www.npmjs.com/package/grunt-newer
# https://www.html5rocks.com/en/tutorials/tooling/supercharging-your-gruntfile/#toc-buildtime
module.exports =

	options:
		# [NOTE] Useless option:
		# https://www.npmjs.com/package/grunt-concurrent#logconcurrentoutput
		# https://github.com/sindresorhus/grunt-concurrent/issues/43#issue-37014351
		logConcurrentOutput: false
		# Improve max concurrent tasks:
		# https://stackoverflow.com/a/20963687/5951529
		# https://www.npmjs.com/package/grunt-concurrent#limit
		limit: 7

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
	# [FIXME] grunt-newer doesn't work with purifycss:
	# Warning: Cannot read property 'forEach' of undefined Use --force to continue.
	# https://github.com/purifycss/grunt-purifycss/issues/26
	tarb5: ['curl'
			'newer:string-replace'
			'purifycss']
	tarb6: ['shell:tidymodify']
	tarb7: ['newer:postcss:build']
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
	#######################
	## grunt-checkbranch ##
	#######################
	# Check, that you in right branch:
	# https://www.npmjs.com/package/grunt-checkbranch
	tarp1: ['checkbranch:master']
	tarp2: ['shell:deploy']
	# Don't use “newer” for “move”! Files from “root-html” doesn't move.
	# Don't use “newer” with “realFavicon”! “index.html” will not changed!
	tarp3: ['license_finder'
			# [FIXME] realFavicon doesn't work after upgrade to Node.js 12:
			# https://github.com/RealFaviconGenerator/grunt-real-favicon/issues/46
			# 'realFavicon'
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
			'imagemin'
			'purifycss']
	tarp8: ['shell:tidymodify'
			'postcss:build'
			'uglify']
	tarp9: ['cssnano'
			'critical']
	tarp10: ['cacheBust']
	tarp11: ['htmlmin']
	tarp12: ['shell:eclintfix']
	tarp13: ['notify:publish']

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
	For validating sources, “target sources”.
	###
	tars1: ['coffeelint:configs'
			'markdownlint'
			'remark'
			'shell:bashate']

	###
	For validating output, “target validate”.

	[DONE]
	[FIXME] “html-nu” temporary disabled, because footnotes obsolete syntax:
	https://github.com/Python-Markdown/markdown/issues/768
	https://travis-ci.org/Kristinita/KristinitaPelican/jobs/471091236#L1220
	###
	tarv1: ['coffeelint:site'
			# 'html-nu'
			'path_validator'
			# [DONE]
			# Update dependencies fix it:
			# [FIXME] “No source files were found” error
			'postcss:lint'
			'shell:tidyvalidate'
			'stylelint'
			'stylint']
	# [DONE]
	# [FIXME] eclint doesn't fix leading spaces:
	# https://github.com/jedmao/eclint/issues/155
	tarv2: ['csslint'
			'shell:eclintcheck']
	tarv3: ['notify:validate']

	###
	For validating only in development mode, “target validate development”.

	[NOTE] clean-console only for development:
	Site developer can create new files → absolute links will not works in production →
	clean-console will shown errors. So only for development.
	[NOTE] clean-console works with http-server — “grunt http-server clean-console”.
	See “clean-console.coffee” for details.
	###
	tard1: ['clean-console'
			# [NOTE] Files by absolute paths may not exists
			'pageres']
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
	# [BUG] Travis Client doesn't recognized APT addon:
	# https://github.com/travis-ci/travis-yaml/issues/58
	# https://github.com/travis-ci/travis.rb/issues/422
	# [BUG] “matrix.include” warnings:
	# https://github.com/travis-ci/travis.rb/issues/376
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
			# [DONE]
			# https://github.com/whiskyechobravo/pelican-open_graph/pull/19#issuecomment-514927638
			# [FIXME] E006 htmllint error:
			# https://travis-ci.org/Kristinita/KristinitaPelican/jobs/560507427#L2046-L2085
			'htmllint'
			'pylint']
	tarna2: ['notify:validate']

	###
	For tasks after site deploy — “target after deploy”:
	[INFO] PageSpeed require remote site;
	I can't fix “Serve static assets with an efficient cache policy” for localhost
	###
	tarad1: ['pagespeed']

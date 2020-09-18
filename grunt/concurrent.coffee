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
			# [DONE]
			# [FIXME] realFavicon doesn't work after upgrade to Node.js 12:
			# https://github.com/RealFaviconGenerator/grunt-real-favicon/issues/46
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
	taru1: [
			# [FIXME] PostStylus doesn’t work after
			# Autoprefixer update to version 10:
			# https://github.com/postcss/autoprefixer/issues/1358
			# https://github.com/postcss/autoprefixer/releases/tag/10.0.0
			# [FIXME] grunt-critical works too slow after upgrade to 2.0.0;
			# 1.1.3 — 1m42s
			# 2.0.0 — 21m31s
			# I downgraded it, because AppVeyor hangs:
			# https://ci.appveyor.com/project/Kristinita/kristinitapelican/build/job/9pr390t692pr65oa#L2999
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
			# [DONE]
			# [FIXME]
			# content.trimEnd is not a function
			# https://travis-ci.org/github/Kristinita/KristinitaPelican/jobs/702631558#L1948-L1950
			'markdownlint'
			# [DONE]
			# [FIXME] “.remarkrc.yaml” doesn't work
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
			# [DONE]
			# [FIXME] “space: none”
			'html-nu'
			'path_validator'
			'postcss:lint'
			'shell:tidyvalidate'
			'stylelint'
			'stylint']
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

	###
	[FIXME] “travis lint -x” successfully works for me,
	but after “shell:travislint” command prompt hangs
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
			# [FIXME] AttributeError: module 'isort' has no attribute 'SortImports'
			# 'pylint'
			]
	tarna2: ['notify:validate']

	###
	For tasks after site deploy — “target after deploy”:
	[INFO] PageSpeed require remote site;
	I can't fix “Serve static assets with an efficient cache policy” for localhost
	###
	tarad1: [
			# [NOTE] “shell:shellcheck” not needed here!
			# Delete it after pagespeed will fixed!
			'shell:shellcheck'
			# [FIXME] Bug “Warning: Expected a string”
			# 'pagespeed'
			]
	tarad2: ['notify:validate']

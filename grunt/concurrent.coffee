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

	#
	# For development, “target build”.
	#
	# [NOTE] Don't use “newer:” for shell tasks!
	# grunt-newer check, that your source (src) not change and doesn't run build process.
	tarb1: ['shell:generate']
	tarb2: ['newer:move']
	tarb3: ['newer:coffee'
			'newer:stylus']
	# [BUG] grunt-newer doesn't work with purifycss:
	# Warning: Cannot read property 'forEach' of undefined Use --force to continue.
	# https://github.com/purifycss/grunt-purifycss/issues/26
	tarb4: ['newer:string-replace:all'
			'newer:string-replace:dev'
			'newer:uglify'
			'purifycss']
	tarb5: ['newer:cssnano'
			'shell:tidymodify']
	tarb6: ['newer:jsbeautifier']
	tarb7: ['shell:eclintfix']
	tarb8: ['notify:default']
	#
	# For screenshots, “target screenshot”.
	#
	# Grunt-pageres works incorrect with absolute URLs. I use local URLs with “grunt-http-server”:
	# I need build site with localhost URLs → make screenshots → build site with absolute URLs.
	tarsc1: ['pageres']
	#
	# For publishing, “target publish”.
	#
	# Don't use “newer” for publishing, because output directory deleted →
	# all src files will newer.
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
			'realFavicon'
			'humans_txt'
			'robotstxt'
			'shell:licensegenerator'
			'shell:covgen'
			'shell:piplicenses']
	tarp4: ['move']
	tarp5: ['stylus'
			'coffee'
			'unused'
			'copy']
	tarp6: ['clean'
			'imagemin'
			'purifycss'
			'uglify']
	tarp7: ['postcss'
			'string-replace:all'
			'string-replace:absoluteinsidehtmlimages'
			'string-replace:asideimages'
			'string-replace:backgroundimages']
	tarp8: ['cssnano'
			'shell:tidymodify']
	tarp9: ['minifyHtml']
	tarp10: ['shell:eclintfix']
	tarp11: ['notify:publish']
	#
	# For updating dependencies, “target update”.
	#
	taru1: ['devUpdate'
			'shell:gitreflog']
	taru2: ['projectUpdate'
			'shell:pipenvupdateall'
			'shell:gitgarbagecollector']
	taru3: ['shell:pipenvcleanunused']
	taru4: ['shell:pipenvupdatepipfilelock']
	#
	# For validating sources, “target sources”.
	#
	#
	tars1: ['coffeelint:source'
			'markdownlint'
			'shell:bashate']
	# For validating output, “target validate”.
	#
	tarv1: ['coffeelint:personal'
			'coffeelint:theme'
			'html-nu'
			'path_validator'
			'shell:tidyvalidate'
			'stylint']
	tarv2: ['shell:eclintcheck']
	tarv3: ['notify:validate']
	#
	# For Continuous Integration tasks, “target remote”.
	# If task in this secton, please, give reasons, why not local:
	#
	# [NOTE] At April 2018 exists Ruby version of Travis Client, not versions for another languages →
	# user need to install Ruby virtual environment locally:
	# lint “.travis.yml” — small improvement, that install Ruby virtual environment.
	# ShellCheck needs extra dependency scoop for Windows:
	# https://github.com/koalaman/shellcheck#installing
	tarr1: ['shell:shellcheck']
	tarr2: ['notify:validate']
	# [BUG] Travis Client doesn't recognized APT addon:
	# https://github.com/travis-ci/travis-yaml/issues/58
	# https://github.com/travis-ci/travis.rb/issues/422
	# [BUG] “matrix.include” warnings:
	# https://github.com/travis-ci/travis.rb/issues/376
	# tarr2: ['shell:travislint']
	#
	# For Travis CI specific tasks, not for local or another CI — “target travis”.
	# If task in this section, please, give reasons, why not local or another CI:
	#
	# Doesn't need in local, because commitlint+husky lints commit,
	# when I make it locally:
	# http://marionebl.github.io/commitlint/#/guides-local-setup
	tart1: ['shell:commitlint'
			# [BUG] HTML Tidy doesn't modify files with Cyrillic names in AppVeyor →
			# files still contains errors:
			# https://ci.appveyor.com/project/Kristinita/kristinitapelican/build/1.0.37/job/vjjwi959rqgfm6da
			# https://github.com/appveyor/ci/issues/2107
			'htmllint']
	# Doesn't work in AppVeyor or another CI, Travis-specific:
	# https://github.com/marionebl/commitlint/blob/master/%40commitlint/travis-cli/src/cli.js
	tart2: ['notify:validate']

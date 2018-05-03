######################
## grunt-concurrent ##
######################
# Run multiple tasks:
# https://www.npmjs.com/package/grunt-concurrent
#################
## grunt-newer ##
#################
# grunt-newer
# Run task, only if src files change.
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
	tarb3: ['newer:stylus']
	# [BUG] grunt-newer doesn't work with purifycss:
	# Warning: Cannot read property 'forEach' of undefined Use --force to continue.
	# https://github.com/purifycss/grunt-purifycss/issues/26
	tarb4: ['newer:string-replace'
			'purifycss']
	tarb5: ['shell:tidymodify']
	tarb6: ['shell:eclintfix']
	tarb7: ['notify:default']
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
			'unused'
			'copy']
	tarp6: ['clean'
			'purifycss'
			'imagemin']
	tarp7: ['postcss'
			'string-replace']
	tarp8: ['shell:tidymodify']
	tarp9: ['jsbeautifier']
	tarp10: ['shell:eclintfix']
	tarp11: ['notify:deploy']
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
	tars1: ['coffeelint'
			'markdownlint']
	# For validating output, “target validate”.
	#
	tarv1: ['shell:tidyvalidate'
			'path_validator']
	tarv2: ['shell:eclintcheck']
	#
	# For Continuous Integration tasks, “target remote”.
	# If task in this secton, please, give reasons, why not local:
	#
	# [NOTE] At April 2018 exists only Ruby version of Travis Client, →
	# user need to install Ruby virtual environment locally:
	# lint “.travis.yml” — small improvement, that install Ruby virtual environment.
	# ShellCheck needs additional dependency scoop for Windows:
	# https://github.com/koalaman/shellcheck#installing
	tarr1: ['shell:shellcheck']
	# [BUG] Travis Client doesn't recognized APT addon:
	# https://github.com/travis-ci/travis-yaml/issues/58
	# https://github.com/travis-ci/travis.rb/issues/422
	# tarr2: ['shell:travislint']
	#
	# For Travis CI specific tasks, not for local or another CI — “target travis”.
	# If task in this section, please, give reasons, why not local or another CI:
	#
	# 1. Doesn't need in local, because commitlint+husky lints commit,
	# when I make it locally:
	# http://marionebl.github.io/commitlint/#/guides-local-setup
	# 2. Doesn't work in AppVeyor or another CI, Travis-specific:
	# https://github.com/marionebl/commitlint/blob/master/%40commitlint/travis-cli/src/cli.js
	tart1: ['shell:commitlint']

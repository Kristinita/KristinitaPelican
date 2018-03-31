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
	#
	# For development, “target build”
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
	tarb6: ['notify:default']
	#
	# For publishing, “target publish”
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
			'shell:lice'
			'shell:covgen']
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
	tarp10: ['notify:deploy']
	#
	# For updating dependencies, “target update”
	#
	taru1: ['devUpdate'
			'shell:gitreflog']
	taru2: ['projectUpdate'
			'shell:pipenvupdateall'
			'shell:gitgarbagecollector']
	taru3: ['shell:pipenvcleanunused']

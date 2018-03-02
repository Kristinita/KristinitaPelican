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
	# For development, “target build”
	# [NOTE] Don't use “newer:” for pelican buildings tasks!
	# grunt-newer check, that your source (src) not change and doesn't run build process.
	tarb1: ['shell:generate']
	tarb2: ['newer:stylus']
	# [BUG] grunt-newer doesn't work with purifycss:
	# Warning: Cannot read property 'forEach' of undefined Use --force to continue.
	# https://github.com/purifycss/grunt-purifycss/issues/26
	tarb3: ['newer:string-replace', 'purifycss']
	# For publishing, “target publish”
	tarp1: ['shell:deploy']
	tarp2: ['newer:move']
	tarp3: ['newer:clean', 'newer:stylus', 'newer:unused']
	tarp4: ['purifycss', 'newer:imagemin']
	tarp5: ['newer:postcss', 'newer:string-replace']
	tarp6: ['newer:jsbeautifier']
	# For updating dependencies, “target update”
	taru1: ['devUpdate', 'shell:pipenvupdate', 'shell:gitreflog']
	taru2: ['projectUpdate', 'shell:pipenvupdateall', 'shell:gitgarbagecollector']
	taru3: ['shell:pipenvcleanunused']
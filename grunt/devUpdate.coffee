######################
## grunt-dev-update ##
######################
# Automatic update local dev dependencies
# https://www.npmjs.com/package/grunt-dev-update
# https://stackoverflow.com/a/48952098/5951529
module.exports =
	main:
		options:
			# “semver: false” That dependencies update to latest version in any case
			# https://www.npmjs.com/package/grunt-dev-update#optionssemver
			semver: false
			updateType: 'force'

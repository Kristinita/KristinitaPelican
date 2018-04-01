##########################
## grunt-license-finder ##
##########################
# Output all local Grunt and npm dependencies to csv file:
# https://www.npmjs.com/package/grunt-license-finder
# https://stackoverflow.com/a/17677951/5951529
module.exports =
	gruntandnpm:
		options:
			out: 'grunt-and-npm.csv'
			csv: true

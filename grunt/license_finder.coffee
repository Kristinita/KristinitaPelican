##########################
## grunt-license-finder ##
##########################
# Output all local Grunt and npm dependencies to csv file:
# https://www.npmjs.com/package/grunt-license-finder
module.exports =
	gruntandnpm:
		options:
			out: 'grunt-and-npm.csv'
			csv: true

##########################
## grunt-project-update ##
##########################
# Remove unused packages, use “npm prune”:
# https://www.npmjs.com/package/grunt-project-update
# https://stackoverflow.com/a/21417098/5951529
# For example, you don't want use grunt-image → you remove grunt-image from package.json →
# you run “npm prune” → grunt-image delete with dependencies
module.exports =
	update:
		cmd: 'npm'
		args: ['prune']

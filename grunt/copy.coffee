########################
## grunt-contrib-copy ##
########################
# Copy files and folders:
# https://www.npmjs.com/package/grunt-contrib-copy
module.exports =

	options:
		# https://www.unixtutorial.org/2008/04/atime-ctime-mtime-in-unix-filesystems/
		# [WARNING] Option may works incorrect.
		timestamp: true
	main:
		# If src or dest path not exist, exit code 1:
		# https://www.npmjs.com/package/grunt-contrib-copy#troubleshooting
		nonull: true
		src: 'CODE_OF_CONDUCT.md'
		dest: 'output/CODE_OF_CONDUCT.md'

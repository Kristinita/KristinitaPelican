################
## grunt-move ##
################
# Move files to another folder
# https://www.npmjs.com/package/grunt-move
module.exports =
	# Options: https://www.npmjs.com/package/grunt-move#options
	options:
		# If incorrect src, task failed.
		ignoreMissing: false
	# HTML, which I need to move in root folder
	roothtml:
		src: 'output/root-html/*'
		dest: 'output/'
	# Different file types
	extra:
		src: 'output/extra/*'
		dest: 'output/'
	# Move licenses of all npm/Grunt and Python packages
	licenses:
		src: [
			'grunt-and-npm.csv'
			'python.md'
		]
		# [NOTE] Use “licenses/”, not “license”, otherwise a file “licenses” will create
		# [NOTE] grunt-move create a needest folder, if no
		dest: 'output/licenses/'

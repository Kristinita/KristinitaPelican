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
		src: "<%= templates.paths.output_path %>/root-html/*"
		dest: "<%= templates.paths.output_path %>/"
	# Different file types
	extra:
		src: [
			"<%= templates.paths.output_path %>/extra/opensearch.xml"
			"<%= templates.paths.output_path %>/extra/README.md"
		]
		dest: "<%= templates.paths.output_path %>/"
	# Move licenses of all npm/Grunt and Python packages
	licenses:
		src: [
			"grunt-and-npm.csv"
			"python.md"
		]
		# [NOTE] Use “licenses/”, not “licenses”, otherwise a file “licenses” will create
		# [NOTE] grunt-move create a needest folder, if no
		dest: "<%= templates.paths.output_path %>/licenses/"
	# Move license for output repository.
	# [NOTE] grunt-move support different file names:
	# “LICENSE” → “LICENSE.md”.
	# Need “LICENSE”, not “LICENSE.md”, because:
	# 1. license-generator doesn't generate license in non-root folder,
	# 2. root folder already have “LICENSE.md” file for sources.
	outputlicense:
		src: "LICENSE"
		dest: "<%= templates.paths.output_path %>/LICENSE.md"

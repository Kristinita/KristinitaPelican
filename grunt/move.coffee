################
## grunt-move ##
################
# Move files to another folder
# https://www.npmjs.com/package/grunt-move
module.exports =
	options:
		ignoreMissing: true
		moveAcrossVolumes: true
	# Favicons
	favicons:
		src: 'output/favicons/*'
		dest: 'output/'
	# HTML, which I need to move in root folder
	roothtml:
		src: 'output/root-html/*'
		dest: 'output/'
	# Different file types
	extra:
		src: 'output/extra/*'
		dest: 'output/'
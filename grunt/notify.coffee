##################
## grunt-notify ##
##################
# Notify, if Grunt task failed:
# https://www.npmjs.com/package/grunt-notify
module.exports =
	options:
		enabled: true
		success: true
		duration: 7
		message: 'Success!'
	# For “grunt” command
	default:
		options:
			title: 'grunt'
	# “grunt publish”
	publish:
		options:
			title: 'grunt publish'
	# “grunt validatesource, validateoutput, remote, travis”
	validate:
		options:
			title: 'grunt validate'

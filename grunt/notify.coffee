##################
## grunt-notify ##
##################
###
[OVERVIEW] Notify, if Grunt task passed or failed:
https://www.npmjs.com/package/grunt-notify
###
module.exports =
	options:
		enabled: true
		success: true
		duration: 7
		message: 'Success!'

	# [INFO] For “grunt” command
	default:
		options:
			title: 'grunt'

	# [INFO] “grunt publish”
	publish:
		options:
			title: 'grunt publish'

	# [INFO] “grunt validatesource, validateoutput, remote, travis”
	validate:
		options:
			title: 'grunt validate'

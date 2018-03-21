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
	default:
		options:
			title: 'grunt'
	deploy:
		options:
			title: 'grunt deploy'

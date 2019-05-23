###############
# grunt-cwebp #
###############
# Convert images to webp:
# https://www.npmjs.com/package/grunt-cwebp
module.exports =
	dynamic:
		options:
			# [NOTE] If “true”:
			# 1. src file will overwrite
			# 2. extenssion will the former, not “.webp”
			# Not recommend it.
			sameExt: false
		files: [
			expand: true
			cwd: '.'
			src: ["<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>\
					/images/**/*.{png,jpg,jpeg}", "<%= templates.yamlconfig.OUTPUT_PATH %>/images/**/*.{png,jpg,jpeg}"]
			dest: '.'
			]

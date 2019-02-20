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
			src: ["<%= templates.paths.output_path %>/<%= templates.paths.theme_static_dir %>\
					/images/**/*.{png,jpg,jpeg,gif}", "<%= templates.paths.output_path %>/images/**/*.{png,jpg,jpeg,gif}"]
			dest: '.'
			]

###############
# grunt-cwebp #
###############
# Convert images to webp:
# https://www.npmjs.com/package/grunt-cwebp
module.exports =
	dynamic:
		options:
			###
			# [NOTE] If “true”:
			# 1. src file will overwrite
			# 2. extension will the former, not “.webp”
			# I don’t recommend it.
			###
			sameExt: false
		###
		[NOTE] Don't use "<%= templates.paths.images %>", because it includes svg and gif, that
		not convert to webp
		###
		files: [
			expand: true
			cwd: '.'
			# [LEARN][GLOB] Use “/**/”, that include “output/images/**” and “output/theme/images/**”
			src: ["<%= templates.yamlconfig.OUTPUT_PATH %>/**/images/**/*.{png,jpg,jpeg}"]
			dest: '.'
		]

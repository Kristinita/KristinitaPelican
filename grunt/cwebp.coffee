###############
# grunt-cwebp #
###############
# [PURPOSE] Convert images to webp:
# https://www.npmjs.com/package/grunt-cwebp
# Options (grunt-cwebp supports cwebp options):
# https://developers.google.com/speed/webp/docs/cwebp#options
module.exports =
	dynamic:
		###
		[NOTE] Don’t use "<%= templates.paths.images %>", because it includes svg and gif, that
		not convert to webp
		###
		files: [
			expand: true
			cwd: '.'
			# [LEARN][GLOB] Use “/**/”, that include “output/images/**” and “output/theme/images/**”
			src: ["<%= templates.yamlconfig.OUTPUT_PATH %>/**/images/**/*.{png,jpg,jpeg}"]
			dest: '.'
		]

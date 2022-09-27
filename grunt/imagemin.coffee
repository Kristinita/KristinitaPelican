###########################
## grunt-contrb-imagemin ##
###########################
###
[INFO] Plugin for minify images:
https://www.npmjs.com/package/grunt-contrib-imagemin
Minify all images in output folder

[NOTE] Non-documented behavior!
“gulp-htmltidy” task run, if I run “imagemin” task, see:
https://github.com/shama/grunt-gulp/issues/14

[BUG] Don't use grunt-image:
https://github.com/1000ch/grunt-image/issues/34

[WARNING] Squoosh — replacement for imagemin — doesn’t work with Node.js 18+:
https://github.com/GoogleChromeLabs/squoosh/issues/1033#issuecomment-1219431200
###
module.exports =
	###
	[INFO] By default use gifsicle, jpegtran, optipng, svgo:
	https://www.npmjs.com/package/grunt-contrib-imagemin#use
	###
	dynamic:
		options:
			###
			[INFO] Maximum optimization:
			https://www.npmjs.com/package/grunt-contrib-imagemin#optimizationlevel-png
			###
			optimizationLevel: 7
		files: "<%= templates.paths.images %>"
	webp:
		options:
			#################
			# imagemin-webp #
			#################
			###
			Minify webp images:
			https://www.npmjs.com/package/imagemin-webp
			[LEARN][GRUNT] Use specific imagemin plugins:
			https://www.npmjs.com/package/grunt-contrib-imagemin#usage
			https://github.com/andreysgra/pink/blob/0c9a46fe2221010909eb10a16557e945a2deea25/Gruntfile.js#L111-113
			###
			use: [require('imagemin-webp')()]
		files: [
			expand: true
			cwd: '.'
			src: ["<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>\
					/images/**/*.webp"]
			dest: '.'
			]

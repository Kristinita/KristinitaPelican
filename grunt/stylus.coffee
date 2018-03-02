##########################
## grunt-contrib-stylus ##
##########################
# Automatic compile Stylus to CSS
# https://github.com/gruntjs/grunt-contrib-stylus
# [WARNING] Possibly, behavior 'output/theme/stylus/sections/*.styl' → 'output/theme/css/sections/*.css' not possible
# relativeDest joined all CSS
# https://github.com/gruntjs/grunt-contrib-stylus#relativedest
module.exports =
	options:
		compress: false
		# linenos not save comments, linenos add extra constructions as “/* line 479 : D:\Kristinita\output\theme\stylus\sections\core-design.styl */”. So false.
		linenos: false
	compile:
		files:
			'output/theme/css/sections/sublime-text.css': 'output/theme/stylus/sections/sublime-text.styl'
			'output/theme/css/sections/gingerinas.css': 'output/theme/stylus/sections/gingerinas.styl'
			'output/theme/css/sections/it-articles.css': 'output/theme/stylus/sections/it-articles.styl'
			'output/theme/css/sections/kristinita-temp.css': 'output/theme/stylus/sections/kristinita-temp.styl'
			'output/theme/css/script-colors/Admonition/admonition.css': 'output/theme/stylus/script-colors/Admonition/admonition.styl'
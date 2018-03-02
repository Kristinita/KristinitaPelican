#####################
## grunt-purifycss ##
#####################
# Remove unused CSS for Kristinita.ru design
# https://github.com/purifycss/purifycss
# https://github.com/purifycss/grunt-purifycss
# [NOTE] Needs separate task for each style. Because different styles in Kristinita.ru
module.exports =
	options:
		whitelist: ['.tooltipster-punk-purple .tooltipster-box', '.tooltipster-punk-aquamarine .tooltipster-box']
	sublimetexttarget:
		src: ['output/Sublime-Text/*.html']
		css: ['output/theme/css/sections/sublime-text.css']
		dest: 'output/theme/css/sections/sublime-text.css'
	gingerinastarget:
		src: ['output/Gingerinas/*.html']
		css: ['output/theme/css/sections/gingerinas.css']
		dest: 'output/theme/css/sections/gingerinas.css'
	kristinitatemptarget:
		src: ['output/Programs/*.html']
		css: ['output/theme/css/sections/kristinita-temp.css']
		dest: 'output/theme/css/sections/kristinita-temp.css'
	itarticlestarget:
		src: ['output/IT-articles/*.html']
		css: ['output/theme/css/sections/it-articles.css']
		dest: 'output/theme/css/sections/it-articles.css'
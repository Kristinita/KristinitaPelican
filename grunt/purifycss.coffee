#####################
## grunt-purifycss ##
#####################
# Remove unused CSS for Kristinita.ru design
# https://www.npmjs.com/package/purify-css
# https://www.npmjs.com/package/grunt-purifycss
# [NOTE] Needs separate task for each style. Because different styles in Kristinita.ru
# [BUG] Doesn't work with grunt-newer:
# https://github.com/purifycss/grunt-purifycss/issues/30
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
	giologicabluetarget:
		src: ['output/Giologica/Valerywork-Kiravel.html']
		css: ['output/theme/css/sections/giologica-blue.css']
		dest: 'output/theme/css/sections/giologica-blue.css'
	giologicatarget:
		src: ['output/Giologica/*.html']
		css: ['output/theme/css/sections/giologica.css']
		dest: 'output/theme/css/sections/giologica.css'
	sashablacktarget:
		# Pages and Sasha Black
		src: ['output/Sasha-Black/*.html', 'output/Pages/*.html']
		css: ['output/theme/css/sections/sasha-black-description.css']
		dest: 'output/theme/css/sections/sasha-black-description.css'
	smertsvobodetarget:
		src: ['output/Smert-svobode/*.html']
		css: ['output/theme/css/sections/smert-svobode.css']
		dest: 'output/theme/css/sections/smert-svobode.css'

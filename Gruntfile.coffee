# @Author: Kristinita
# @Date:   2017-04-05 20:11:18
# @Last Modified time: 2017-04-11 08:20:09

# [BUG] In ConEmu background color = Grunt output color
# https://github.com/gruntjs/grunt/issues/1589
# Temporarily solution — using --no-color argument
# https://stackoverflow.com/a/23550493/5951529

##########################
## grunt-gulp variables ##
##########################
# https://www.npmjs.com/package/grunt-gulp#examples
# CoffeeScript to JavaScript online — http://js2.coffee/

gulp = require('gulp')
htmltidy = require('gulp-htmltidy')

###########################
## Loading Grunt plugins ##
###########################

module.exports = (grunt) ->
	grunt.loadNpmTasks 'grunt-shell'
	grunt.loadNpmTasks 'grunt-move'
	grunt.loadNpmTasks 'grunt-contrib-clean'
	grunt.loadNpmTasks 'grunt-text-replace'
	grunt.loadNpmTasks 'grunt-postcss'
	grunt.loadNpmTasks 'grunt-htmltidy'
	grunt.loadNpmTasks 'grunt-html5-validate'
	grunt.loadNpmTasks 'grunt-gulp'
	grunt.loadNpmTasks 'grunt-jsbeautifier'
	grunt.loadNpmTasks 'grunt-contrib-imagemin'
	grunt.loadNpmTasks 'grunt-image'
	grunt.loadNpmTasks 'grunt-contrib-stylus'
	grunt.loadNpmTasks 'grunt-purifycss'
	grunt.loadNpmTasks 'grunt-unused'
	grunt.loadNpmTasks 'grunt-browser-sync'

	################
	## grunt-time ##
	################
	# Show time for Grunt tasks:
	# https://github.com/sindresorhus/time-grunt
	require('time-grunt')(grunt)

	grunt.initConfig

		#################
		## grunt-shell ##
		#################
		# Grunt plugin to run non-Grunt CLI commands.
		# Build Pelican site:
		# http://manos.im/blog/static-site-pelican-grunt-travis-github-pages/
		# https://github.com/sindresorhus/grunt-shell
		shell:
			generate: command: 'pelican content -s pelicanconf.py'
			deploy: command: 'pelican content -s publishconf.py'

		################
		## grunt-move ##
		################
		# Move files to another folder
		# https://www.npmjs.com/package/grunt-move
		move:
			options:
				ignoreMissing: true
				moveAcrossVolumes: true
			## Favicons
			favicons:
				src: 'output/favicons/*'
				dest: 'output/'
			## HTML, which I need to move in root folder
			roothtml:
				src: 'output/root-html/*'
				dest: 'output/'
			## Different file types
			extra:
				src: 'output/extra/*'
				dest: 'output/'

		#########################
		## grunt-contrib-clean ##
		#########################
		# Delete blank folders and files
		# https://github.com/gruntjs/grunt-contrib-clean
		# Remove parent css file for design sections
		clean: [
			'output/extra'
			'output/favicons'
			'output/root-html'
			'output/theme/css/sections/core-design.css'
		]

		########################
		## grunt-text-replace ##
		########################
		# Replace text, using regex
		# https://github.com/yoniholmes/grunt-text-replace
		replace:
				replacehtml:
					src: [ 'output/**/*.html' ]
					overwrite: true
					replacements: [
							## [NOTE] {Curly braces} are required for replaces
							## [NOTE] Use (.|\n|\r) for any symbol, not (.|\n)
							## [DEPRECATED] Cllipboard.js + Tooltipster for Rainbow
							## http://ru.stackoverflow.com/a/582520/199934
							## http://stackoverflow.com/a/33758293/5951529
							# {
							#   from: /<pre><code class="(.+?)">((.|\n|\r)+?)<\/code><\/pre>/g
							#   to: '<pre><code data-language="$1">$2</code><button class="SashaButton SashaTooltip"><img class="SashaNotModify" src="../images/interface_images/clippy.svg" alt="Clipboard button" width="13"></button></pre>'
							# }
							## Clipboard.js + Tooltipster for SuperFences
							## http://ru.stackoverflow.com/a/582520/199934
							## https://stackoverflow.com/a/33758435/5951529
							# <button> and <img> tags must be in one line;
							# no line breaks between them!
							{
								from: /(<pre>)((.|\n|\r)+?)(<\/pre><\/div>)/g
								to: '$1<button class="SashaButton SashaTooltip"><img class="SashaNotModify" src="//gitcdn.xyz/repo/Kristinita/Kristinita.github.io/master/images/interface_images/clippy.svg" alt="Clipboard button" width="13"></button>$2$4'
							}
							## Fancybox and JQueryLazy images,
							## With regex: https://github.com/yoniholmes/grunt-text-replace#usage
							{
								from: /<img alt="([^"]+?)" src="(.+?)"( \/)?>/g
								to: '<a class="fancybox" href="$2"><img class="SashaLazy" src="//gitcdn.xyz/repo/Kristinita/Kristinita.github.io/master/images/interface_images/transparent-one-pixel.png" data-src="$2" alt="$1"></a>'
							}
							## GitCDN
							## https://github.com/schme16/gitcdn.xyz
							{
								from: /http:\/\/kristinita.ru\/(.+?)\.(js|css|ico)/g
								to: '//gitcdn.xyz/repo/Kristinita/Kristinita.github.io/master/$1.$2'
							}
							## Header permalink
							{
								from: /(<p>\s*?<a name="(.+?)"><\/a>\s*?<\/p>\s+?<h\d+?>.+?)(<\/h\d+?>)/g
								to: '$1 <a class="headerlink" href="#$2" title="Permanent link">¶</a>$3'
							}
							]

		################################
		## grunt-postcss Autoprefixer ##
		################################
		# https://github.com/nDmitry/grunt-postcss
		postcss:
			options:
				map: true
				processors: [
					require('autoprefixer')()
				]
			dist:
				src: [ 'themes/sashapelican/static/css/**/*.css', 'output/personal/**/*.css' ]

		####################
		## grunt-htmltidy ##
		####################
		# Fix HTML markup errors
		# https://github.com/gavinballard/grunt-htmltidy
		# [BUG] I don't use, because bug:
		# https://github.com/gavinballard/grunt-htmltidy/issues/6
		htmltidy:
			options:
				# indent: no
				# Disable line breaks
				# https://stackoverflow.com/a/7681425/5951529
				wrap: 0
				# 'vertical-space': no
			gingerinas:
				files: [
					expand: true
					cwd: 'output/Gingerinas'
					src: '**/*.html'
					dest: 'output/Gingerinas'
				]
			debug:
				files: [
					expand: true
					cwd: 'output/Debug'
					src: '**/*.html'
					dest: 'output/Debug'
				]
			programs:
				files: [
					expand: true
					cwd: 'output/Programs'
					src: '**/*.html'
					dest: 'output/Programs'
				]

		##########################
		## grunt-html5-validate ##
		##########################
		# Validate HTML — https://github.com/rgladwell/grunt-html5-validate
		# [BUG] Plugin doesn't work:
		# https://github.com/rgladwell/grunt-html5-validate/issues/1
		# html5validate:
		    # src: 'output/IT-articles/*.html'

		###################
		## gulp-htmltidy ##
		###################
		# Validate HTML
		# https://www.npmjs.com/package/gulp-htmltidy
		# For in-place dest needs «base: "."», see:
		# https://stackoverflow.com/a/44337370/5951529
		# [BUG] Doesn't work for multiple commands, see:
		# https://github.com/shama/grunt-gulp/issues/13
		gulp:
			gulptidy:
				gulp.src('output/**/*.html', base: ".")
				.pipe(htmltidy(
					doctype: 'html5'
					indent: true
					wrap: 0)).pipe gulp.dest('./')

		########################
		## grunt-jsbeautifier ##
		########################
		## https://github.com/vkadam/grunt-jsbeautifier
		jsbeautifier:
			files: [ 'output/**/*.html', 'output/**/*.css' ]

		#################
		## grunt-image ##
		#################
		# Compress images:
		# https://github.com/1000ch/grunt-image
		# [BUG] Doesn't work with multiple images:
		# https://github.com/1000ch/grunt-image/issues/29
		image:
			static:
				options:
					pngquant: true
					optipng: true
					zopflipng: true
					jpegRecompress: true
					jpegoptim: true
					mozjpeg: true
					gifsicle: true
					svgo: true
				files:
					src: ['output/**/*.jpg']

		###########################
		## grunt-contrb-imagemin ##
		###########################
		# Plugin for minify images:
		# https://github.com/gruntjs/grunt-contrib-imagemin
		# Minify all images in
		imagemin:
			dynamic:
				options:
					optimizationLevel: 7
				files: [
					expand: true
					cwd: '.'
					src: ['output/images/**/*.{png,jpg,jpeg,gif,svg}']
					dest: '.'
					]

		##########################
		## grunt-contrib-stylus ##
		##########################
		# Automatic compile Stylus to CSS
		# https://github.com/gruntjs/grunt-contrib-stylus
		stylus:
			compile:
				files:
					'output/theme/css/sections/sublime-text.css': 'output/theme/stylus/sections/sublime-text.styl'
					'output/theme/css/sections/gingerinas.css': 'output/theme/stylus/sections/gingerinas.styl'
					'output/theme/css/sections/it-articles.css': 'output/theme/stylus/sections/it-articles.styl'
					'output/theme/css/sections/kristinita-temp.css': 'output/theme/stylus/sections/kristinita-temp.styl'
					'output/theme/css/script-colors/Admonition/admonition.css': 'output/theme/stylus/script-colors/Admonition/admonition.styl'

		#####################
		## grunt-purifycss ##
		#####################
		# Remove unused CSS for kristinita.ru design
		# https://github.com/purifycss/purifycss
		# https://github.com/purifycss/grunt-purifycss
		purifycss:
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

		##################
		## grunt-unused ##
		##################
		# Remove unused images
		# https://www.npmjs.com/package/grunt-unused
		# [BUG] — doesn't work with multiple reference folders
		# https://github.com/ryanburgess/grunt-unused/issues/10
		# If fail: true, and unused files, exit code 1;
		# If fail: false and unused files, Grunt continue to work.
		unused:
			options:
				reference: 'output/images/'
				directory: ['output/**/*.html']
				days: false
				remove: true
				reportOutput: false
				fail: false

		########################
		## grunt-browser-sync ##
		########################
		# Live Reloading
		# https://github.com/BrowserSync/grunt-browser-sync
		browserSync:
			bsFiles:
				src : ['output/theme/css/**/*.css', 'output/theme/css/**/**/*.css', 'output/theme/js/**/*.js']
			options:
				server:
					baseDir: "../"
				plugins: [
					####################
					##  html-injector ##
					####################
					## That HTML don't refresh, if I change HTML file:
					## https://github.com/shakyshane/html-injector
					## JavaScript needs refresh, see
					## https://stackoverflow.com/q/30762114/5951529
					module: "bs-html-injector"
					options:
						files: "output/**/*.html"
					]


	##################
	## registerTask ##
	##################
	# Run Grunt commands
	# test — for testing new features
	# bro — Browsersync
	# build — reviewing with relative paths
	# publish — before publishing with absolute paths

	grunt.registerTask 'test', [
		# 'shell:generate'
		# 'postcss'
		# 'move'
		# 'clean'
		# 'replace'
		# 'htmltidy'
		# 'jsbeautifier'
		# 'purifycss'
		# 'stylus'
		# 'unused'
		# 'browserSync'
		# 'html5validate'
		# 'gulp:gulptidy'
		'imagemin'
	]

	grunt.registerTask 'bro', [
		'browserSync'
	]

	grunt.registerTask 'build', [
		'shell:generate'
		'move'
		# 'clean'
		'replace'
		'stylus'
		'purifycss'
	]

	grunt.registerTask 'publish', [
		'shell:deploy'
		'move'
		'clean'
		'replace'
		'unused'
		'imagemin'
		'stylus'
		'purifycss'
		'postcss'
		'jsbeautifier'
	]
	return

# @Author: Kristinita
# @Date:   2017-04-05 20:11:18
# @Last Modified time: 2017-04-11 08:20:09

# [BUG] In ConEmu background color = Grunt output color
# https://github.com/gruntjs/grunt/issues/1589
# Temporarily solution — using --no-color argument
# https://stackoverflow.com/a/23550493/5951529

# Grunt apply for files dinamically
# https://gruntjs.com/configuring-tasks#building-the-files-object-dynamically

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

	######################
	## load-grunt-tasks ##
	######################
	# https://github.com/sindresorhus/load-grunt-tasks
	# doesn't write “grunt.loadNpmTasks 'task'” each time
	# [WARNING] Do not use grunt-lazyload! It conflicting plugin
	# https://www.npmjs.com/package/grunt-lazyload
	require('load-grunt-tasks')(grunt)

	################
	## grunt-time ##
	################
	# Show time for Grunt tasks:
	# https://github.com/sindresorhus/time-grunt
	require('time-grunt')(grunt)

	grunt.initConfig

		# notify_hooks:
		# 	options:
		# 		enabled: true
		# 		title: "Kristinita's Search"
		# 		success: true
		# 		duration: 7
		# 		message: 'Compiled Successfully'

		######################
		## grunt-dev-update ##
		######################
		# Automatic update local dev dependencies
		# https://www.npmjs.com/package/grunt-dev-update
		# https://stackoverflow.com/a/48952098/5951529
		devUpdate:
			main:
				options:
					# “semver: false” That dependencies update to latest version in any case
					# https://www.npmjs.com/package/grunt-dev-update#optionssemver
					semver: false
					updateType: 'force'

		##########################
		## grunt-project-update ##
		##########################
		# Remove unused packages, use “npm prune”:
		# https://www.npmjs.com/package/grunt-project-update
		# https://stackoverflow.com/a/21417098/5951529
		projectUpdate:
			update:
				cmd: 'npm'
				args: ['prune']

		# ###################
		# ## grunt-pelican ##
		# ###################
		# # Pelican tasks from Grunt
		# # https://www.npmjs.com/package/grunt-pelican
		# # [WARNING] Pipenv doesn't work in Grunt Pelican
		# # https://github.com/chuwy/grunt-pelican/issues/4
		# pelican:
		# 	options:
		# 		contentDir: 'content'
		# 		outputDir: 'output'
		# 	build:
		# 		configFile: 'pelicanconf.py'
		# 	publish:
		# 		configFile: 'publishconf.py'

		#################
		## grunt-shell ##
		#################
		# Grunt plugin to run non-Grunt CLI commands.
		# Build Pelican site:
		# http://manos.im/blog/static-site-pelican-grunt-travis-github-pages/
		# https://github.com/sindresorhus/grunt-shell
		# Needs “pipenv run”, that scripts from pipenv virtual environment successful run;
		# for example, “pipenv run pelican --help”, not “pelican --help”.
		# https://robots.thoughtbot.com/how-to-manage-your-python-projects-with-pipenv
		# exit(1), if any warning
		shell:
			generate:
				command: 'pipenv run pelican content -s pelicanconf.py --fatal warnings'
			deploy:
				command: 'pipenv run pelican content -s publishconf.py --fatal warnings'
			# Update Pip and Pipenv
			pipenvupdate:
				command: 'pipenv --update'
			# Update all Python Pipenv packages:
			# https://stackoverflow.com/a/16269635/5951529
			# https://github.com/jgonggrijp/pip-review#pip-review
			pipenvupdateall:
				command: 'pipenv run pip-review --auto'
			# Clean unused packages
			pipenvcleanunused:
				command: 'pipenv clean --verbose'

		################
		## grunt-move ##
		################
		# Move files to another folder
		# https://www.npmjs.com/package/grunt-move
		move:
			options:
				ignoreMissing: true
				moveAcrossVolumes: true
			# Favicons
			favicons:
				src: 'output/favicons/*'
				dest: 'output/'
			# HTML, which I need to move in root folder
			roothtml:
				src: 'output/root-html/*'
				dest: 'output/'
			# Different file types
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

		##########################
		## grunt-contrib-stylus ##
		##########################
		# Automatic compile Stylus to CSS
		# https://github.com/gruntjs/grunt-contrib-stylus
		# [WARNING] Possibly, behavior 'output/theme/stylus/sections/*.styl' → 'output/theme/css/sections/*.css' not possible
		# relativeDest joined all CSS
		# https://github.com/gruntjs/grunt-contrib-stylus#relativedest
		stylus:
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

		#####################
		## grunt-purifycss ##
		#####################
		# Remove unused CSS for kristinita.ru design
		# https://github.com/purifycss/purifycss
		# https://github.com/purifycss/grunt-purifycss
		# [NOTE] Needs separate task for each style. Because different styles in Kristinita.ru
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

		###########################
		## grunt-contrb-imagemin ##
		###########################
		# Plugin for minify images:
		# https://github.com/gruntjs/grunt-contrib-imagemin
		# Minify all images in output folder
		# [NOTE] Non-documented behavior!
		# “gulp-htmltidy” task run, if I run “imagemin” task, see:
		# https://github.com/shama/grunt-gulp/issues/14
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

		################################
		## grunt-postcss Autoprefixer ##
		################################
		# https://github.com/nDmitry/grunt-postcss
		postcss:
			options:
				# Disable sourcemapping, because I don't minify CSS
				# https://stackoverflow.com/a/28993441/5951529
				map: false
				processors: [
					require('autoprefixer')()
				]
			dist:
				src: ['output/theme/css/**/*.css', 'output/css/personal/**/*.css']

		##########################
		## grunt-string-replace ##
		##########################
		# Replace text, regex support
		# https://www.npmjs.com/package/grunt-string-replace
		'string-replace':
			dist:
				files: [
					expand: true
					cwd: 'output'
					src: '**/*.html'
					dest: 'output'
				]
			options:
				# [NOTE] Use (.|\n|\r) for any symbol, not (.|\n)
				# [NOTE] {Curly Braces} needs for delimite patterns
				replacements: [
					# Clipboard.js + Tooltipster for SuperFences
					# http://ru.stackoverflow.com/a/582520/199934
					# https://stackoverflow.com/a/33758435/5951529
					# <button> and <img> tags must be in one line;
					# no line breaks between them!
					{
					pattern: /(<pre>)(((.|\n|\r)+?)?)(<\/pre>((\s+?)?)<\/div>)/g
					replacement: '$1<button class="SashaButton SashaTooltip"><img class="SashaNotModify" src="//gitcdn.xyz/repo/Kristinita/Kristinita.github.io/master/theme/images/interface-images/clippy.svg" alt="Clipboard button" width="13"></button>$2$5'
					}
					# Fancybox and JQueryLazy images
					{
					pattern: /<img alt="([^"]+?)" src="(.+?)"( \/)?>/g
					replacement: '<a class="fancybox" href="$2"><img class="SashaLazy" src="//gitcdn.xyz/repo/Kristinita/Kristinita.github.io/master/theme/images/interface-images/transparent-one-pixel.png" data-src="$2" alt="$1"></a>'
					}
					# GitCDN
					# https://github.com/schme16/gitcdn.xyz
					{
					pattern: /https:\/\/kristinita.ru\/(.+?)\.(js|css|ico|xml)/g
					replacement: '//gitcdn.xyz/repo/Kristinita/Kristinita.github.io/master/$1.$2'
					}
					# Header permalink
					{
					pattern: /(<p>\s*?<a id="(.+?)"><\/a>\s*?<\/p>\s+?<h\d+?>((.|\n|\r)+?))(<\/h\d+?>)/g
					replacement: '$1 <a class="headerlink" href="#$2" title="Permanent link">¶</a>$5'
					}
				]

		##############################
		## grunt-http-convert-https ##
		##############################
		# Convert http to https
		# https://www.npmjs.com/package/grunt-http-convert-https
		# [BUG] plugin doesn't work, “Warning: Task "converthttps" not found”.
		# Author long time inactive on GitHub, so no issue:
		# https://github.com/sina-mfe
		# converthttps:
		# 	config:
		# 		expand: true
		# 		cwd: 'output'
		# 		src: '**/*.html'
		# 		dest: 'output'
		# 		httpsJson:
		# 			"imgur": [
		# 				"http": "i.imgur.com"
		# 				"https": "i.imgur.com"
		# 			]

		########################
		## grunt-jsbeautifier ##
		########################
		## https://github.com/vkadam/grunt-jsbeautifier
		jsbeautifier:
			files: [ 'output/**/*.html', 'output/**/*.css' ]

		########################
		## grunt-text-replace ##
		########################
		# [DEPRECATED] grunt-string-replace active maintained
		# https://www.npmjs.com/package/grunt-string-replace
		# Replace text, using regex
		# https://github.com/yoniholmes/grunt-text-replace
		# replace:
		# 	replacehtml:
		# 		src: [ 'output/**/*.html' ]
		# 		overwrite: true
		# 		replacements: [
		# 		## [NOTE] Use (.|\n|\r) for any symbol, not (.|\n)
		# 		## [DEPRECATED] Cllipboard.js + Tooltipster for Rainbow
		# 		## http://ru.stackoverflow.com/a/582520/199934
		# 		## http://stackoverflow.com/a/33758293/5951529
		# 		# {
		# 		#   from: /<pre><code class="(.+?)">((.|\n|\r)+?)<\/code><\/pre>/g
		# 		#   to: '<pre><code data-language="$1">$2</code><button class="SashaButton SashaTooltip"><img class="SashaNotModify" src="../images/interface_images/clippy.svg" alt="Clipboard button" width="13"></button></pre>'
		# 		# }
		# 		# Clipboard.js + Tooltipster for SuperFences
		# 		# http://ru.stackoverflow.com/a/582520/199934
		# 		# https://stackoverflow.com/a/33758435/5951529
		# 		# <button> and <img> tags must be in one line;
		# 		# no line breaks between them!
		# 			from: /(<pre>)((.|\n|\r)+?)(<\/pre>(\s+?)<\/div>)/g
		# 			to: '$1<button class="SashaButton SashaTooltip"><img class="SashaNotModify" src="//gitcdn.xyz/repo/Kristinita/Kristinita.github.io/master/images/interface-images/clippy.svg" alt="Clipboard button" width="13"></button>$2$4'
		# 		# Fancybox and JQueryLazy images,
		# 			from: /<img alt="([^"]+?)" src="(.+?)"( \/)?>/g
		# 			to: '<a class="fancybox" href="$2"><img class="SashaLazy" src="//gitcdn.xyz/repo/Kristinita/Kristinita.github.io/master/images/interface-images/transparent-one-pixel.png" data-src="$2" alt="$1"></a>'
		# 		# GitCDN
		# 		# https://github.com/schme16/gitcdn.xyz
		# 			from: /http:\/\/kristinita.ru\/(.+?)\.(js|css|ico|xml)/g
		# 			to: '//gitcdn.xyz/repo/Kristinita/Kristinita.github.io/master/$1.$2'
		# 		# Header permalink
		# 			from: /(<p>\s*?<a name="(.+?)" id="(.+?)"><\/a>\s*?<\/p>\s+?<h\d+?>((.|\n|\r)+?))(<\/h\d+?>)/g
		# 			to: '$1 <a class="headerlink" href="#$2" title="Permanent link">¶</a>$6'
		# 		]


		# ####################
		# ## grunt-posthtml ##
		# ####################
		# # PostHTML wrapper for Grunt:
		# # https://www.npmjs.com/package/grunt-posthtml
		# # https://www.npmjs.com/package/posthtml
		# # [BUG] Any PostHTML plugin doesn't work for me, details:
		# # https://github.com/TCotton/grunt-posthtml/issues/3
		# posthtml:
		# 	options:
		# 		use: [
		# 			require('posthtml-aria-tabs')()
		# 			require('posthtml-doctype')(doctype : 'HTML 4.01 Frameset')
		# 			require('posthtml-alt-always')()
		# 		]
		# 	build:
		# 		files: [
		# 			expand: true
		# 			cwd: 'output/Sublime-Text'
		# 			src: '**/*.html'
		# 			dest: 'output/Sublime-Text/tmp'
		# 		]

		# ####################
		# ## grunt-htmltidy ##
		# ####################
		# # Fix HTML markup errors
		# # https://github.com/gavinballard/grunt-htmltidy
		# # [BUG] I don't use, because bug:
		# # https://github.com/gavinballard/grunt-htmltidy/issues/6
		# htmltidy:
		# 	options:
		# 		# indent: no
		# 		# Disable line breaks
		# 		# https://stackoverflow.com/a/7681425/5951529
		# 		wrap: 0
		# 		# 'vertical-space': no
		# 	gingerinas:
		# 		files: [
		# 			expand: true
		# 			cwd: 'output'
		# 			src: '**/*.html'
		# 			dest: 'output'
		# 		]

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

		# #################
		# ## grunt-image ##
		# #################
		# # Compress images:
		# # https://github.com/1000ch/grunt-image
		# # [BUG] Doesn't work with multiple images:
		# # https://github.com/1000ch/grunt-image/issues/29
		# image:
		# 	static:
		# 		options:
		# 			pngquant: true
		# 			optipng: true
		# 			zopflipng: true
		# 			jpegRecompress: true
		# 			jpegoptim: true
		# 			mozjpeg: true
		# 			gifsicle: true
		# 			svgo: true
		# 		files:
		# 			src: ['output/**/*.jpg']

		# #################
		# ## grunt-ngrok ##
		# #################
		# # ngrok implementation for Grunt
		# # https://www.npmjs.com/package/grunt-ngrok
		# # [BUG] Doesn't work:
		# # https://github.com/bazilio91/grunt-ngrok/issues/7
		# ngrok:
		# 	options:
		# 		authToken: '6FAzTiHpA7FhKkLKjUoQi_4TJMoSofsewziHE3XFC5J'
		# 	server:
		# 		proto: 'https'

		#########################
		## grunt-contrib-watch ##
		#########################
		# https://www.npmjs.com/package/grunt-contrib-watch
		# Run in console “grunt watch” → change files → tasks will run
		watch:
			scripts:
				files: ['**/*.styl']
				tasks: ['stylus']

		######################
		## grunt-concurrent ##
		######################
		# Run multiple tasks
		# https://www.npmjs.com/package/grunt-concurrent
		concurrent:
			# For publishing
			target1: ['devUpdate', 'shell:pipenvupdate']
			target2: ['projectUpdate', 'shell:pipenvupdateall']
			target3: ['shell:pipenvcleanunused']
			target4: ['shell:deploy']
			target5: ['move']
			target6: ['clean', 'stylus', 'unused']
			target7: ['purifycss', 'imagemin']
			target8: ['postcss', 'string-replace']
			target9: ['jsbeautifier']
			# For development
			target10: ['shell:generate']
			target11: ['stylus']
			target12: ['string-replace', 'purifycss']

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
				# localtunnel doesn't work, see:
				# https://github.com/BrowserSync/browser-sync/issues/1513
				tunnel: false
				plugins: [
					###################
					## html-injector ##
					###################
					# That HTML don't refresh, if I change HTML file:
					# https://github.com/shakyshane/html-injector
					# JavaScript needs refresh, see
					# https://stackoverflow.com/q/30762114/5951529
					module: "bs-html-injector"
					options:
						files: "output/**/*.html"
					]

		# ########################
		# ## grunt-nice-package ##
		# ########################
		# # package.json validator
		# # https://www.npmjs.com/package/grunt-nice-package
		# # [BUG] Some features works incorrect:
		# # https://github.com/bahmutov/grunt-nice-package/issues/25
		# # https://github.com/bahmutov/grunt-nice-package/issues/26
		# # nicePackage shortcut:
		# # https://www.npmjs.com/package/grunt-nice-package#alternative-default-options
		# # "generate-package" generate package.json:
		# # https://www.npmjs.com/package/generate-package
		# nicePackage:
		# 	all:
		# 		options:
		# 			blankLine: false

	##################
	## registerTask ##
	##################
	# Run chains Grunt commands
	# build — reviewing with relative paths
	# publish — before publishing with absolute paths

	grunt.registerTask 'build', [
		'concurrent:target10'
		'concurrent:target11'
		'concurrent:target12'
	]

	grunt.registerTask 'publish', [
		'concurrent:target1'
		'concurrent:target2'
		# [BUG] Clean real mdx_cite package
		# 'concurrent:target3'
		'concurrent:target4'
		'concurrent:target5'
		'concurrent:target6'
		'concurrent:target7'
		'concurrent:target8'
		'concurrent:target9'
	]
	return

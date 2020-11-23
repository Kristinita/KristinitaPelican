######################
## Deprecated tasks ##
######################
# All buggy, obsolete and/or unneedable plugins.
# Save, because possibly I can use them again.


# [FIXME] Re-install grunt-eslint, when I will have a time:
# ################
# # grunt-eslint #
# ################
# module.exports =
# 	options:
# 		maxWarnings: 40
# 	lint:
# 		files: "<%= templates.paths.js %>"


# ###################
# ## grunt-pelican ##
# ###################
# # Pelican tasks from Grunt
# # https://www.npmjs.com/package/grunt-pelican
# # [WARNING] Pipenv doesn’t work in Grunt Pelican:
# # https://github.com/chuwy/grunt-pelican/issues/4
# pelican:
# 	options:
# 		contentDir: 'content'
# 		outputDir: 'output'
# 	build:
# 		configFile: 'pelicanconf.py'
# 	publish:
# 		configFile: 'publishconf.py'


##############################
## grunt-http-convert-https ##
##############################
# # Convert http to https
# # https://www.npmjs.com/package/grunt-http-convert-https
# # [BUG] plugin doesn't work, “Warning: Task "converthttps" not found”.
# # Author long time inactive on GitHub, so no issue:
# # https://github.com/sina-mfe
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
## grunt-text-replace ##
########################
# # [DECLINED] grunt-string-replace active maintained
# # https://www.npmjs.com/package/grunt-string-replace
# # Replace text, using regex
# # https://github.com/yoniholmes/grunt-text-replace
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
# 		#   to: '<pre><code data-language="$1">$2</code><button class="SashaButton SashaTooltip">\
# 		<img class="SashaNotModify" src="../images/interface_images/clippy.svg" \
# 		alt="Clipboard button" width="13"></button></pre>'
# 		# }
# 		# Clipboard.js + Tooltipster for SuperFences
# 		# http://ru.stackoverflow.com/a/582520/199934
# 		# https://stackoverflow.com/a/33758435/5951529
# 		# <button> and <img> tags must be in one line;
# 		# no line breaks between them!
# 			from: /(<pre>)((.|\n|\r)+?)(<\/pre>(\s+?)<\/div>)/g
# 			to: '$1<button class="SashaButton SashaTooltip"><img class="SashaNotModify" \
# 			src="//gitcdn.xyz/repo/Kristinita/Kristinita.netlify.com/master/images/interface-images/clippy.svg" \
# 			alt="Clipboard button" width="13"></button>$2$4'
# 		# Fancybox and JQueryLazy images,
# 			from: /<img alt="([^"]+?)" src="(.+?)"( \/)?>/g
# 			to: '<a class="fancybox" href="$2"><img class="SashaLazy" \
# 			src="//gitcdn.xyz/repo/Kristinita/Kristinita.netlify.com\
# 			/master/images/interface-images/transparent-one-pixel.png" \
# 			data-src="$2" alt="$1"></a>'
# 		# GitCDN
# 		# https://github.com/schme16/gitcdn.xyz
# 			from: /http:\/\/kristinita.netlify.app\/(.+?)\.(js|css|ico|xml)/g
# 			to: '//gitcdn.xyz/repo/Kristinita/Kristinita.netlify.com/master/$1.$2'
# 		# Header permalink
# 			from: /(<p>\s*?<a name="(.+?)" id="(.+?)"><\/a>\s*?<\/p>\s+?<h\d+?>((.|\n|\r)+?))(<\/h\d+?>)/g
# 			to: '$1 <a class="headerlink" href="#$2" title="Permanent link">¶</a>$6'
# 		]


# [DECLINED] Currently, I don’t need posthtml plugins
# ####################
# ## grunt-posthtml ##
# ####################
# # PostHTML wrapper for Grunt:
# # https://www.npmjs.com/package/grunt-posthtml
# # https://www.npmjs.com/package/posthtml
# # [NOTE] Any default PostHTML plugin doesn't work for me, details:
# # https://github.com/TCotton/grunt-posthtml/issues/3
# # [INFO] Use grunt-juwain-posthtml, it fix this problem:
# # https://github.com/posthtml/grunt-posthtml/issues/3
# # https://www.npmjs.com/package/grunt-juwain-posthtml
# posthtml:
# 	options:
# 		use: [
# 			require('posthtml-aria-tabs')()
# 			require('posthtml-doctype')(doctype : 'HTML 4.01 Frameset')
# 			require('posthtml-alt-always')()
# 		]
# 	single:
# 		files: [
# 				src: '<%= templates.yamlconfig.OUTPUT_PATH %>/Programs/KristinitaLuckyLink.html'
# 				dest: '<%= templates.yamlconfig.OUTPUT_PATH %>/Programs/KristinitaLuckyLink.html'
# 			]


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
# # Validate HTML — https://github.com/rgladwell/grunt-html5-validate
# # [BUG] Plugin doesn't work:
# # https://github.com/rgladwell/grunt-html5-validate/issues/1
# html5validate:
	# src: 'output/IT-articles/*.html'


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
# # https://stackoverflow.com/a/49053110/5951529
# nicePackage:
# 	all:
# 		options:
# 			blankLine: false


# ###################
# ## gulp-htmltidy ##
# ###################
# # Validate HTML
# # https://www.npmjs.com/package/gulp-htmltidy

# ##########################
# ## grunt-gulp variables ##
# ##########################
# # https://www.npmjs.com/package/grunt-gulp#examples
# # CoffeeScript to JavaScript online — http://js2.coffee/

# gulp = require('gulp')
# htmltidy = require('gulp-htmltidy')

# # For in-place dest needs «base: "."», see:
# # https://stackoverflow.com/a/44337370/5951529
# # [BUG] Doesn't work for multiple commands, see:
# # https://github.com/shama/grunt-gulp/issues/13
# module.exports =
# 	gulptidy:
# 		gulp.src('<%= templates.paths.html %>', base: ".")
# 		.pipe(htmltidy(
# 			doctype: 'html5'
# 			indent: true
# 			wrap: 0)).pipe gulp.dest('./')


# [DECLINED] pip-licenses more customisable
# ############
# ## yolk3k ##
# ############
# # Generate licenses for all Python packages:
# # https://stackoverflow.com/a/26718306/5951529
# # https://pypi.org/project/yolk3k/
# yolk:
# 	command: 'pipenv run yolk -l -f license > python.txt'


# [DECLINED] SuperFences now preserve tabs:
# https://github.com/facelessuser/pymdown-extensions/issues/276
# ######################
# ## grunt-indentator ##
# ######################
# # Indent 4 spaces to tab:
# # https://www.npmjs.com/package/grunt-indentator
# # [WARNING]: Replace tabs to spaces only if first indentation — spaces:
# # Needs run before “eslint fix”:
# # https://github.com/gespinha/grunt-indentator/issues/1
# module.exports =
# 	options:
# 		type: 'tab'
# 		size: 1
# 		debug: true
# 	files:
# 		[
# 			"<%= templates.paths.html %>"
# 		]


# [DEPRECATED] Generate invalid license files:
# https://github.com/licenses/lice/issues/50
# I can't file Grunt package for this task;
# license-generator output error in installation process:
# https://pypi.org/project/license-generator/
# ##########
# ## lice ##
# ##########
# # Generate license for project:
# # https://pypi.org/project/lice/
# lice:
# 	# [BUG] lice doesn't work in AppVeyor:
# 	# https://github.com/appveyor/ci/issues/2226
# 	if process.platform == "win32"
# 		command: 'echo "Sorry, lice doesn\'t work in AppVeyor — https://github.com/appveyor/ci/issues/2226"'
# 	else
# 		command: 'pipenv run lice mit -o "Sasha Chernykh" --file output/LICENSE.md'


# [DEPRECATED] Doesn't work for CSS paths
# #########################
# # grunt-path-absolutely #
# #########################
# # https://www.npmjs.com/package/grunt-path-absolutely
# module.exports =
# 	cssimages:
# 		options:
# 			devRoot: "."
# 			releaseRoot: "https://kristinita.netlify.app"
# 			resourceFilter: ["*.css"]
# 		files: [
# 			expand: true
# 			cwd: "."
# 			src: ["<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/css/aside/*.css"]
# 			dest: "."
# 		]


# [DEPRECATED] Doesn't allow to have comments in JSON configuration files:
# #############################
# # grunt-strip-json-comments #
# #############################
# # Delete comments in JSON files
# # https://www.npmjs.com/package/strip-json-comments
# # https://www.npmjs.com/package/grunt-strip-json-comments
# stripJsonComments:
# 	dist:
# 		options:
# 			whitespace: false
# 		files:
# 			'.jsbeautifyrc': '.jsbeautifyrc'


# [DEPRECATED] I don't see plugins, that can come in handy
# ####################
# ## grunt-posthtml ##
# ####################
# # PostHTML support for Grunt:
# # https://github.com/posthtml/posthtml
# # https://www.npmjs.com/package/grunt-juwain-posthtml
# # [WARNING] Use “juwain-posthtml”, not native “posthtml” version:
# # https://github.com/TCotton/grunt-posthtml/issues/3
# module.exports =
# 	options:
# 		use: [
# 			#############
# 			# ARIA Tabs #
# 			#############
# 			# Add WAI-ARIA attributes:
# 			# http://prgssr.ru/development/ispolzovanie-aria-v-html5.html
# 			# http://jonathantneal.github.io/posthtml-aria-tabs/
# 			# [WARNING] Disable, because I use “ul/li” for progressive enhancements:
# 			# http://jonathantneal.github.io/posthtml-aria-tabs/#caveats
# 			# require('posthtml-aria-tabs')()
# 		]
# 	build:
# 		files: [
# 			expand: true
# 			cwd: "<%= templates.yamlconfig.OUTPUT_PATH %>"
# 			src: ['**/*.html']
# 			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>"
# 			]


# [DEPRECATED][BUG] grunt-coffee-format make files wrong:
# https://github.com/NotBobTheBuilder/grunt-coffee-format/issues/3
# #######################
# # grunt-coffee-format #
# #######################
# # Formatter for CoffeeScript files:
# # https://www.npmjs.com/package/coffee-fmt
# # Grunt adapter:
# # https://www.npmjs.com/package/grunt-coffee-format
# module.exports =
# 	options:
# 		# [INFO] Use tabs, not spaces:
# 		# https://www.npmjs.com/package/grunt-coffee-format#optionstab
# 		tab: '\t'
# 	theme:
# 		files:
# 			src: ["<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/coffee/**/*.coffee"]
# 	personal:
# 		files:
# 			src: ["<%= templates.yamlconfig.OUTPUT_PATH %>/coffee/**/*.coffee"]


# [DEPRECATED] I migrate to HTML-minifier, arguments:
# [LINK] “htmlmin.coffee”
# ############
# # minimize #
# ############
# # Minify HTML:
# # https://www.npmjs.com/package/minimize
# # https://www.npmjs.com/package/grunt-minify-html
# # [NOTE] Use HTML parser, grunt-contrib-htmlmin use regexes.
# # grunt-htmlclean simply than grunt-minify-html:
# # https://github.com/anseki/htmlclean/issues/11#issuecomment-389386676
# module.exports =
# 	# https://github.com/Swaagie/minimize#options-1
# 	# All set false by default:
# 	# https://github.com/Swaagie/minimize#options
# 	options:
# 		# [INFO] I'm not support spare attirbutes for older browsers:
# 		# https://github.com/Swaagie/minimize#spare
# 		spare: false
# 		# [INFO] W3C recommends quotes:
# 		# https://www.w3schools.com/html/html_attributes.asp
# 		quotes: true
# 	minimize:
# 		files: [
# 			expand: true
# 			cwd: "."
# 			src: ["<%= templates.yamlconfig.OUTPUT_PATH %>/**/*.html"]
# 			dest: "."
# 			]


# [DECLINED] I hate private discussions
# #########
# # ROT13 #
# #########
# # ROT13 algorithm for e-mail obfuscation:
# # https://en.wikipedia.org/wiki/ROT13
# # https://superuser.com/a/235965/572069
# # Generated by:
# # http://rot13.florianbersier.com/
# # [NOTE] In this script fixed «eo is not defined» bug:
# # https://github.com/xpressyoo/Email-Obfuscator/issues/1
# document.getElementById('obf').innerHTML = \
# '<n uers="znvygb:FnfunPurealxuRzcerffBsHavirefr@xevfgvavgn.eh?fhowrpg=R-znvy gb Fnfun Purealxu" \
# gnetrg="_oynax">r-znvy</n>'.replace(/[a-zA-Z]/g, (c) ->
# 	String.fromCharCode if (if c <= 'Z' then 90 else 122) >= (c = c.charCodeAt(0) + 13) then c else c - 26
# )


# [DEPRECATED] Compress files as cssnano; don't remove duplicates
#############
# css-purge #
#############
# Compress CSS:
# http://rbtech.github.io/css-purge/
# Grunt wrapper:
# https://github.com/dominikwilkowski/grunt-css-purge
# Options:
# https://www.npmjs.com/package/css-purge#config-options
# module.exports =
# 	task:
# 		files: [
# 			expand: true
# 			cwd: "<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/css"
# 			src: ['!**/**/*.css'
# 					'**/**/*.min.css']
# 			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/css"
# 			ext: '.min.css'
# 			]


# [DEPRECATED] UNCSS build all CSS files to single;
# behavior not similar as PurgeCSS and PurifyCSS
###############
# grunt-uncss #
###############
# module.exports =
# 	options:
# 		uncssrc: ".uncssrc"
# 	sublimetexttarget:
# 		src: [
# 				"<%= templates.yamlconfig.OUTPUT_PATH %>/Sublime-Text/*.html"
# 				"<%= templates.yamlconfig.OUTPUT_PATH %>/Programs/*.html"
# 				]
# 		css: ["<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/sections/programs.css"]
# 		dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/sections/programs.css"


# [DEPRECATED]
# Virtual environment and Pipenv doesn't support:
# https://github.com/btholt/grunt-flake8/issues/1
# [WARNING] All linting passed, if flake8 no installed:
# https://github.com/btholt/grunt-flake8/issues/3#issuecomment-473383610
# ##########
# # flake8 #
# ##########
# module.exports =
# 	dist:
# 		src: ["*.py"
# 				"personal-plugins/**/*.py"]


# [DEPRECATED]
# Google Fonts support “font-display: swap” from May 2019:
# https://www.zachleat.com/web/google-fonts-display/
# ###
# Load Google Fonts

# [NOTE] Script required, because Google Fonts doesn't support “font-display”:
# https://css-tricks.com/google-fonts-and-font-display/
# https://github.com/google/fonts/issues/358

# [INFO] “font-display: swap”, that:
# 1. Default font will show to site visitors before Google font
# 2. Fix “Ensure text remains visible during webfont load” of PageSpeed Insights
# https://web.dev/fast/avoid-invisible-text
# https://developers.google.com/web/updates/2016/02/font-display
# [INFO] If “font-display: swap”, sit visitor see text without any delay:
# https://font-display.glitch.me/

# [LEARN][COFFEESCRIPT] For converting EcmaScript 6 to CoffeeScript:
# 1. Convert EcmaScript 6 to JavaScript. Online converter — https://babeljs.io/en/repl .
# 2. Convert JavaScript to CoffeeScript via js2coffee.
# https://github.com/js2coffee/js2coffee/issues/449#issuecomment-470128539
# ###
# loadFont = (url) ->
# 	# [LEARN][COFFEESCRIPT] Wrap constructor to parens (parentheses, round brackets),
# 	# if CoffeeLint warnings:
# 	# https://github.com/clutchski/coffeelint/blob/master/src/rules/non_empty_constructor_needs_parens.coffee
# 	# https://github.com/clutchski/coffeelint/blob/master/src/rules/empty_constructor_needs_parens.coffee
# 	xhr = new (XMLHttpRequest)
# 	xhr.open 'GET', url, true

# 	xhr.onreadystatechange = ->
# 		if xhr.readyState is 4 and xhr.status is 200
# 			css = xhr.responseText
# 			css = css.replace(/}/g, 'font-display: swap; }')
# 			head = document.getElementsByTagName('head')[0]
# 			style = document.createElement('style')
# 			style.appendChild document.createTextNode(css)
# 			head.appendChild style
# 		return

# 	xhr.send()
# 	return

# loadFont 'https://fonts.googleapis.com/css?family=Play:700\
# |El+Messiri|Scada:700i|Fira+Mono|Marck+Script&amp;subset=cyrillic&display=swap'


# [DEPRECATED]
# Linux — it not needed; Linux doesn't lock opened files and folders$
# see “You Can Delete or Modify Open Files”:
# https://www.howtogeek.com/137096/6-ways-the-linux-file-system-is-different-from-the-windows-file-system/
# Windows — it not unlock files or folders as any another program:
# https://superuser.com/q/1485406/572069
###############
# grunt-chmod #
###############
# # Add read and write permissions for all output folders and files:
# # https://www.npmjs.com/package/grunt-chmod
# # About chmod:
# # https://ss64.com/bash/chmod.html
# # [DESCRIPTION]
# # I open any files → I run “publishconf.py”, that delete “output” folder →
# # I can get errors as:
# # ERROR: Unable to delete directory D:\Kristinita\output\stylus; OSError: [WinError 145]
# # The directory is not empty: 'D:\\Kristinita\\output\\stylus\\personal'
# # chmod fix this problem.
# # [WARNING] You need close BrowserSync before publishing,
# # because it can create new permissions.
# module.exports =
#   options:
#     # [NOTE] 444 and 666 modes works in Windows:
#     # https://www.npmjs.com/package/grunt-chmod#warnings
#     mode: '666'
#   kiratarget:
#     # [LEARN][GRUNT] All folders and files recursive, include current:
#     # https://gruntjs.com/configuring-tasks#globbing-patterns
#     src: "<%= templates.yamlconfig.OUTPUT_PATH %>/**"


# [DECLINED]
# 1. JSBeautifier is more powerful tool
# 2. JSBeautifier has many options; Prettier — minimal set, see options philosophy:
# https://prettier.io/docs/en/option-philosophy.html
# 3. Strange HTML prettifying for Prettier
# 4. Bug for grunt-prettier:
# https://github.com/poalrom/grunt-prettier/issues/20
# ############
# # Prettier #
# ############
# # Prettifier for many formats, include css, javascript:
# # https://prettier.io/
# # Grunt wrapper:
# # https://www.npmjs.com/package/grunt-prettier
# # Options:
# # https://prettier.io/docs/en/options.html
# module.exports =
# 	cssdebug:
# 		# [NOTE] “ext: '.min.{css,js}'” will not work;
# 		# Grunt will generate file “kirafile.min.{css,js}”
# 		files: [
# 			expand: true
# 			cwd: "<%= templates.yamlconfig.OUTPUT_PATH %>"
# 			src: ['**/*.css'
# 					'!**/*.min.css']
# 			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>"
# 			]
# 	jsdebug:
# 		files: [
# 			expand: true
# 			cwd: "<%= templates.yamlconfig.OUTPUT_PATH %>"
# 			src: ['**/*.js'
# 					'!**/*.min.js']
# 			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>"
# 			]
# 	# htmldebug:
# 	# 	files: [
# 	# 		expand: true
# 	# 		cwd: "."
# 	# 		src: "<%= templates.yamlconfig.OUTPUT_PATH %>/Books-Reviews/Как-читать-архитектуру.html"
# 	# 		dest: "."
# 	# 		]


# [DEPRECATED]
# [BUG] Checker works incorectly with encoded URLs, see examples:
# Another users:
# https://github.com/ChrisWren/grunt-link-checker/issues/28
# Me:
# “>> Resource not found linked from https://kristinita.netlify.app/opensearch.xml
# to https://kristinita.netlify.app/favicon16%C3%9716.ico”
# ################
# # link-checker #
# ################
# ###
# [PURPOSE] Check links via node-simplecrawler:
# https://github.com/chriswren/grunt-link-checker
# https://www.npmjs.com/package/simplecrawler
# ###
# module.exports =
# 	development:
# 		site: "kristinita.netlify.app"
# 		options:
# 			checkRedirect: true
# 			noFragment: false


# [DEPRECATED] grunt-crawl doesn’t support the newest Node.js and Grunt versions:
# https://github.com/mradcliffe/grunt-crawl/pull/15
# ###############
# # grunt-crawl #
# ###############
# ###
# [INFO] Grunt crawler; possibly, check URLs:
# https://www.npmjs.com/package/grunt-crawl
#
# [NOTE] markdown-link-check tool doesn’t support internal links:
# https://github.com/tcort/markdown-link-check
# Example:
#	[✖] ../Special/Полная-библиография#Открытость → Status: 400
# ###
# module.exports =
# 	myapp:
# 		options:
# 			baseUrl: "http://localhost:4147/"
# 			contentDir: "output"


# [FIXME][ISSUE] 2 problems:
# 1. grunt-blank audit failed, but manually with (TreeSize Free) review shows,
# that I haven’t files < 2 bytes
# 2. grunt-blank doesn’t show, which files lower that 2 bytes.
# ###############
# # grunt-blank #
# ###############
# # [PURPOSE] Check files with size lower than “minBytes”:
# # https://www.npmjs.com/package/grunt-blank
# module.exports =
# 	options:
# 		minBytes: 2
# 	task:
# 		src: [
# 				"<%= templates.yamlconfig.CONTENT_PATH %>"
# 				"<%= templates.yamlconfig.THEME_STATIC_DIR %>"
# 			]


# [DECLINED] The project no longer maintained since 2018:
# https://github.com/purifycss/purifycss/issues/213
# I migrate to PurgeCSS.
# #####################
# ## grunt-purifycss ##
# #####################
# ###

# [OVERVIEW] Remove unused CSS for kristinita.netlify.app design:
# https://www.npmjs.com/package/purify-css
# https://www.npmjs.com/package/grunt-purifycss

# [NOTE] Needs separate task for each style. Because theme use different styles:

# [BUG] Doesn’t work with grunt-newer:
# https://github.com/purifycss/grunt-purifycss/issues/30
# ###
# module.exports =
# 	options:
# 		###
# 		[WARNING] PurifyCSS support elements, that include simply methods.
# 		Example: <div class="SashaClass"></div> in HTML;
# 		.SashaClass { color: black } in CSS;
# 		If elements generated by JavaScript, PurifyCSS doesn’t work:
# 		https://github.com/purifycss/purifycss/issues/194
# 		###
# 		whitelist: [
# 					# [WARNING] Don't use multiline comments inside list!
# 					# Coffeelint will show “unexpected newline” error:
# 					# No issue, because coffeelint not maintained at March, 2019:
# 					# https://github.com/clutchski/coffeelint/issues
# 					# [INFO] Wildfire classes
# 					# [INFO] “div” for parent classes not required.
# 					# [FIXME] Migrate to PurgeCSS, that not add each Wildfire class separately:
# 					# https://github.com/FullHuman/grunt-purgecss/issues/9
# 					".animate-flicker"
# 					".ivu-modal-body"
# 					".ivu-btn"
# 					".ivu-tabs-tabpane"
# 					# [NOTE] Adjoining classes required in this case.
# 					".wf.wf-theme-dark"
# 					".ivu-btn-primary"
# 					".wf-separator"
# 					".wf-no-content-tip"
# 					":not(.v-transfer-dom)"
# 					".ivu-menu-submenu-title-icon"
# 					".ivu-input-wrapper"
# 					".wf-post-btn"
# 					".ivu-menu-horizontal"
# 					".ivu-menu-light"
# 					".ivu-icon-heart-broken"
# 					".ivu-icon-heart"
# 					".wf-inactive"
# 					".ivu-icon-at"
# 					".ivu-menu-item-selected"
# 					".ivu-menu"
# 					"svg"
# 					# [INFO] Tooltipster classes.
# 					# [NOTE] Use parent classes:
# 					# For:
# 					# 	.tooltipster-punk-aquamarine .tooltipster-box
# 					# 	.tooltipster-punk-purple .tooltipster-box
# 					# “.tooltipster-box” in “whitelist” option will not works
# 					".tooltipster-punk-purple .tooltipster-box"
# 					".tooltipster-punk-aquamarine .tooltipster-box"
# 					]
# 	indextarget:
# 		src: ["<%= templates.yamlconfig.OUTPUT_PATH %>/index.html"]
# 		css: ["<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/sections/kristinita.css"]
# 		dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/sections/kristinita.css"
# 	sublimetexttarget:
# 		src: [
# 				"<%= templates.yamlconfig.OUTPUT_PATH %>/Erics-Rooms/*.html"
# 				"<%= templates.yamlconfig.OUTPUT_PATH %>/Programs/*.html"
# 				"<%= templates.yamlconfig.OUTPUT_PATH %>/Sublime-Text/*.html"
# 				]
# 		css: ["<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/sections/programs.css"]
# 		dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/sections/programs.css"
# 	gingerinastarget:
# 		src: [
# 				"<%= templates.yamlconfig.OUTPUT_PATH %>/Erics-Rooms/*.html"
# 				"<%= templates.yamlconfig.OUTPUT_PATH %>/Gingerinas/*.html"
# 				]
# 		css: ["<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/sections/gingerinas.css"]
# 		dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/sections/gingerinas.css"
# 	itarticlestarget:
# 		src: [
# 				"<%= templates.yamlconfig.OUTPUT_PATH %>/Erics-Rooms/*.html"
# 				"<%= templates.yamlconfig.OUTPUT_PATH %>/IT-articles/*.html"
# 				]
# 		css: ["<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/sections/it-articles.css"]
# 		dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/sections/it-articles.css"
# 	giologicabluetarget:
# 		src: ["<%= templates.yamlconfig.OUTPUT_PATH %>/Giologica/Valerywork-Kiravel.html"]
# 		css: ["<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/sections/giologica-blue.css"]
# 		dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/sections/giologica-blue.css"
# 	giologicatarget:
# 		src: [
# 				"<%= templates.yamlconfig.OUTPUT_PATH %>/Books-Reviews/*.html"
# 				"<%= templates.yamlconfig.OUTPUT_PATH %>/Giologica/*.html"
# 				"<%= templates.yamlconfig.OUTPUT_PATH %>/G-Rights/*.html"
# 				"<%= templates.yamlconfig.OUTPUT_PATH %>/Special/*.html"
# 				]
# 		css: ["<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/sections/giologica.css"]
# 		dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/sections/giologica.css"
# 	sashablacktarget:
# 		# Pages and Sasha Black
# 		src: [
# 				"<%= templates.yamlconfig.OUTPUT_PATH %>/Sasha-Black/*.html"
# 				"<%= templates.yamlconfig.OUTPUT_PATH %>/Pages/*.html"
# 				]
# 		css: ["<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/sections/sasha-black-description.css"]
# 		dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/sections/sasha-black-description.css"
# 	smertsvobodetarget:
# 		src: ["<%= templates.yamlconfig.OUTPUT_PATH %>/Smert-svobode/*.html"]
# 		css: ["<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/sections/smert-svobode.css"]
# 		dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/sections/smert-svobode.css"


# [DECLINED]
# 1. posthtml-img-autosize doesn’t work for relative paths:
# https://github.com/posthtml/grunt-posthtml/issues/4
# 2. lazysizes plugin required for my environment,
# I don’t add native lazy loading via posthtml-lazyload
# ####################
# ## grunt-posthtml ##
# ####################
# ###
# [INFO] Framework to transform HTML/XML via JavaScript plugins:
# https://posthtml.org/#/
# https://www.npmjs.com/package/posthtml

# [INFO] Plugins:
# https://www.npmjs.com/package/posthtml#plugins

# [INFO] Grunt wrapper:
# https://www.npmjs.com/package/grunt-juwain-posthtml

# [FIXED] https://github.com/posthtml/grunt-posthtml/issues/4
# [NOTE] Default version — “https://www.npmjs.com/package/grunt-posthtml” —
# doesn’t work for me. I use grunt-juwain-posthtml version:
# https://github.com/posthtml/grunt-posthtml/issues/3
# ###
# module.exports =
# 	options:
# 		use: [
# 			#####################
# 			# posthtml-lazyload #
# 			#####################
# 			# [SOON] Currently, I still use JQuery Lazy for lazy loading images and iframes.
# 			# We have polyfill for browsers that not supported loading="lazy":
# 			# https://github.com/mfranzke/loading-attribute-polyfill
# 			# Polyfill problems:
# 			# 1. It not valid:
# 			# https://github.com/mfranzke/loading-attribute-polyfill/issues/90
# 			# 2. Additional syntax required:
# 			# https://github.com/mfranzke/loading-attribute-polyfill#simple-image


# 			# [ACTION] Add “loading="lazy"” to all images and iframes:
# 			# https://www.npmjs.com/package/posthtml-lazyload

# 			# [NOTE] I couldn’t find any method for applying lazy loading for
# 			# all images and frames without adding “loading="lazy"” each time

# 			# [INFO] “loading="eager"” — load resources immediatly:
# 			# https://web.dev/browser-level-image-lazy-loading/

# 			# [INFO] For “picture” tag the “loading” attribute required solely for
# 			# the fallback “img” element:
# 			# https://web.dev/browser-level-image-lazy-loading/

# 			# [NOTE] CSS background images haven’t “loading” attribute:
# 			# https://web.dev/browser-level-image-lazy-loading/\
# 			#can-css-background-images-take-advantage-of-the-loading-attribute

# 			# require('posthtml-lazyload')(loading: 'lazy')


# 			#########################
# 			# posthtml-img-autosize #
# 			#########################
# 			# [BUG] Plugin doesn’t work with relative paths:
# 			# https://github.com/posthtml/posthtml-img-autosize/issues/17#issuecomment-706592803

# 			# [OVERVIEW] Plugin adds “height” and “width” attributes to all images:
# 			# https://www.npmjs.com/package/posthtml-img-autosize
# 			# [INFO] It required for 2020:
# 			# https://www.smashingmagazine.com/2020/03/setting-height-width-images-important-again/

# 			# require('posthtml-img-autosize')(
# 			# 		processEmptySize: true
# 			# 		root: "output/Programs"
# 			# 		)
# 		]
# 	target:
# 		files: [
# 			expand: true
# 			cwd: "."
# 			src: "output/Programs/*.html"
# 			dest: "."
# 		]


# [DECLINED] UglifyJS doesn’t support EcmaScript 2015 and above:
# https://www.npmjs.com/package/uglify-js#note
# #############
# # Uglify JS #
# #############
# # JavaScript minifier:
# # http://lisperator.net/uglifyjs/
# # https://www.npmjs.com/package/grunt-contrib-uglify
# # Options:
# # http://lisperator.net/uglifyjs/compress
# # [INFO] I selected Uglify JS, not alternatives, because they obsolete:
# # Esmangle:
# # https://github.com/estools/esmangle
# # Closure-compiler:
# # https://github.com/gmarty/grunt-closure-compiler
# # [INFO] Benchmark:
# # https://evmar.github.io/js-min-bench/
# module.exports =
# 	options:
# 		# [LEARN][CSS][JAVASCRIPT] Sourcemaps
# 		# make debugging simply, if styles and scripts combine and compress:
# 		# https://blog.teamtreehouse.com/introduction-source-maps
# 		sourceMap: true
# 	uglifypersonal:
# 		files: [
# 			expand: true
# 			cwd: "<%= templates.yamlconfig.OUTPUT_PATH %>/js/personal"
# 			# [LEARN][GRUNT] “!” symbol — exclude paths:
# 			# https://stackoverflow.com/a/28277841/5951529
# 			src: ['**/*.js'
# 					'!**/*.min*js']
# 			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/js/personal"
# 			# [LEARN][GRUNT] Extensions in filepaths:
# 			# https://gruntjs.com/configuring-tasks#building-the-files-object-dynamically
# 			ext: '.min.js'
# 			]
# 	uglifytheme:
# 		files: [
# 			expand: true
# 			cwd: "<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/js"
# 			src: ['**/*.js'
# 					'!**/*.min*js']
# 			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/js"
# 			ext: '.min.js'
# 			]


# [DECLINED] Closure Compiler have best result in the benchmark:
# https://evmar.github.io/js-min-bench/
# [INFO] I don’t exclude that I will use terser if Closure Compiler problems will not be fixed:
# https://github.com/google/closure-compiler/issues/3729
# https://github.com/google/closure-compiler/issues/3727
# https://stackoverflow.com/q/64927683/5951529
# ##########
# # Terser #
# ##########
# ###
# JavaScript minifier:
# http://lisperator.net/uglifyjs/
# https://www.npmjs.com/package/grunt-contrib-uglify
# Options:
# http://lisperator.net/uglifyjs/compress
# [INFO] I selected Uglify JS, not alternatives, because they obsolete:
# Esmangle:
# https://github.com/estools/esmangle
# Closure-compiler:
# https://github.com/gmarty/grunt-closure-compiler
# ###
# module.exports =
# 	options:
# 		# [LEARN][CSS][JAVASCRIPT] Sourcemaps
# 		# make debugging simply, if styles and scripts combine and compress:
# 		# https://blog.teamtreehouse.com/introduction-source-maps
# 		sourceMap: true
# 	terserpersonal:
# 		files: [
# 			expand: true
# 			cwd: "<%= templates.yamlconfig.OUTPUT_PATH %>/js/personal"
# 			# [LEARN][GRUNT] “!” symbol — exclude paths:
# 			# https://stackoverflow.com/a/28277841/5951529
# 			src: ['**/*.js'
# 					'!**/*.min*js']
# 			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/js/personal"
# 			# [LEARN][GRUNT] Extensions in filepaths:
# 			# https://gruntjs.com/configuring-tasks#building-the-files-object-dynamically
# 			ext: '.min.js'
# 			]
# 	tersertheme:
# 		files: [
# 			expand: true
# 			cwd: "<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/js"
# 			src: ['**/*.js'
# 					'!**/*.min*js']
# 			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/js"
# 			ext: '.min.js'
# 			]

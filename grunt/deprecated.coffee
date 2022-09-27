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
# 			to: '$1 <a class="KiraAnchorPermanentLink" href="#$2" title="Permanent link">¶</a>$6'
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
# 				src: '<%= templates.yamlconfig.OUTPUT_PATH %>/Sublime-Text/KristinitaLuckyLink.html'
# 				dest: '<%= templates.yamlconfig.OUTPUT_PATH %>/Sublime-Text/KristinitaLuckyLink.html'
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
# 				"<%= templates.yamlconfig.OUTPUT_PATH %>/Sublime-Text/*.html"
# 				]
# 		css: ["<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/nelican-themes/programs.css"]
# 		dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/nelican-themes/programs.css"


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
# 		css: ["<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/nelican-themes-specific/kristinita.css"]
# 		dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/nelican-themes-specific/kristinita.css"
# 	sublimetexttarget:
# 		src: [
# 				"<%= templates.yamlconfig.OUTPUT_PATH %>/Nelias-Rooms/*.html"
# 				"<%= templates.yamlconfig.OUTPUT_PATH %>/Sublime-Text/*.html"
# 				"<%= templates.yamlconfig.OUTPUT_PATH %>/Sublime-Text/*.html"
# 				]
# 		css: ["<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/nelican-themes/programs.css"]
# 		dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/nelican-themes/programs.css"
# 	gingerinastarget:
# 		src: [
# 				"<%= templates.yamlconfig.OUTPUT_PATH %>/Nelias-Rooms/*.html"
# 				"<%= templates.yamlconfig.OUTPUT_PATH %>/Gingerinas/*.html"
# 				]
# 		css: ["<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/nelican-themes/gingerinas.css"]
# 		dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/nelican-themes/gingerinas.css"
# 	itarticlestarget:
# 		src: [
# 				"<%= templates.yamlconfig.OUTPUT_PATH %>/Nelias-Rooms/*.html"
# 				"<%= templates.yamlconfig.OUTPUT_PATH %>/IT-articles/*.html"
# 				]
# 		css: ["<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/nelican-themes/it-articles.css"]
# 		dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/nelican-themes/it-articles.css"
# 	giologicabluetarget:
# 		src: ["<%= templates.yamlconfig.OUTPUT_PATH %>/Giologica/Valerywork-Kiravel.html"]
# 		css: ["<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/nelican-themes/giologica-blue.css"]
# 		dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/nelican-themes/giologica-blue.css"
# 	giologicatarget:
# 		src: [
# 				"<%= templates.yamlconfig.OUTPUT_PATH %>/Books-Reviews/*.html"
# 				"<%= templates.yamlconfig.OUTPUT_PATH %>/Giologica/*.html"
# 				"<%= templates.yamlconfig.OUTPUT_PATH %>/G-Rights/*.html"
# 				"<%= templates.yamlconfig.OUTPUT_PATH %>/Special/*.html"
# 				]
# 		css: ["<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/nelican-themes/giologica.css"]
# 		dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/nelican-themes/giologica.css"
# 	sashablacktarget:
# 		# Pages and Sasha Black
# 		src: [
# 				"<%= templates.yamlconfig.OUTPUT_PATH %>/Sasha-Black/*.html"
# 				"<%= templates.yamlconfig.OUTPUT_PATH %>/Pages/*.html"
# 				]
# 		css: ["<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/nelican-themes-specific/sasha-black-description.css"]
# 		dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/nelican-themes-specific/sasha-black-description.css"
# 	smertsvobodetarget:
# 		src: ["<%= templates.yamlconfig.OUTPUT_PATH %>/Smert-svobode/*.html"]
# 		css: ["<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/nelican-themes/smert-svobode.css"]
# 		dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/theme/css/nelican-themes/smert-svobode.css"


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


# [DECLINED] I migrated from Visualize to Mermaid,
# I don’t need grunt-curl for now
#
# ##############
# # grunt-curl #
# ##############
# ###
# [INFO] Download remote files:
# https://www.npmjs.com/package/grunt-curl
# I use grunt-curl, that then minify non-minified remote scripts or stylesheets
# ###
#
#
# ###
# module.exports =
#
# 	[NOTE] gemini-scrollbar files exists in JSDelivr, despite the fact that they not exists in GitHub
# 	https://github.com/noeldelgado/gemini-scrollbar/pull/61
# 	[NOTE] AddToAny — https://static.addtoany.com/menu/page.js —
# 	and Wildfire scripts — https://cdn.jsdelivr.net/npm/wildfire/dist/wildfire.auto.js — already minified
#
# 	[INFO] Visualize:
# 	https://github.com/kellyk/visualize/pull/1
# 	[NOTE] Use GitHub Raw, not GitCDN or another GitHub CDN,
# 	because CDN — additional resource, that may not work:
# 	https://github.com/schme16/gitcdn.xyz/issues/49#issuecomment-493354294
#
# 	visualize:
# 		src: "https://raw.githubusercontent.com/kellyk/visualize/master/visualize.js"
# 		dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/js/visualize.js"
# ###


# [DECLINED] linthtml (as commitlint) doesn’t have the “right” configuration;
# users set own configurations.
# This is unacceptable logic for me.
# ############
# # linthtml #
# ############
# ###
# [INFO] Lint HTML files:
# https://linthtml.vercel.app/
#
# [NOTE] linthtml ignores “.gitignore” files,
# “.linthtmlignore” overwrite “.gitignore” rules:
# https://linthtml.vercel.app/user-guide/ignore-code
#
# [NOTE] linthtml requires "double quotes", not 'single quotes'
# https://github.com/linthtml/linthtml/issues/411#issuecomment-1219056343
# ###
# linthtml:
# 	command: 'npx linthtml "<%= templates.paths.html %>"'


# [DEPRECATED] I used Modernizr fallback for browsers that don’t support webp image format.
# But as of August 2022, all modern browsers support this format:
# https://caniuse.com/?search=webp
#
# I don’t use Modernizr for other purposes, so I disable it
#
# ###################
# # grunt-modernizr #
# ###################
# ###
# [OVERVIEW] Modernizr fix flaws of non-compatible browsers:
# https://modernizr.com/
#
# [INFO] grunt-modernizr generate Modernizr custom file for needed features:
# https://www.npmjs.com/package/grunt-modernizr
#
# [INFO] Get Grunt configuration from online tool; I select “WebP” solely:
# https://modernizr.com/download
#
# [INFO] Options:
# https://github.com/modernizr/customizr#config-file
# ###
# module.exports =
# 	dist:
# 		dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>\
# 				/js/Modernizr/modernizr-custom.min.js"
# 		# [INFO] Don’t crawl a project
# 		crawl: false
# 		###
# 		[INFO] I use Modernizr for jpg fallback for browsers doesn’t support webp format:
# 		https://css-tricks.com/using-webp-images/#article-header-id-4
# 		###
# 		tests: ["webp"]
# 		# [INFO] Uglify Modernizr JavaScript
# 		uglify: true


# [DEPRECATED] grunt-remark no longer maintained:
# https://github.com/remarkjs/grunt-remark
# I migrated to remark-cli.
# ################
# # grunt-remark #
# ################
#
# [OVERVIEW] Markdown linter:
# https://remark.js.org/
#
# [INFO] Grunt implementation:
# https://www.npmjs.com/package/grunt-remark
#
# [OPTIONS] https://github.com/unifiedjs/unified-engine-gulp#options
#
# [INFO] You need to install remark plugins separately:
# “npm install remark-preset-lint-markdown-style-guide remark-preset-lint-recommended --save-dev”
#
# [INFO] Disabling specific rules:
# https://github.com/remarkjs/remark-lint#configuring-remark-lint
#
# module.exports =
# 	src: "<%= templates.paths.markdown_remark %>"
# 	options:
# 		###
# 		[INFO] Build failed, if any warning:
# 		https://github.com/unifiedjs/unified-engine-gulp#optionsfrail
# 		###
# 		frail: true


# [DECLINED] I don’t understand, how to make it work for my environment
# I use “string-replace” expressions for convert relative paths to absolute
# ##########################
# # grunt-path-absolutely #
# #########################
# [OVERVIEW] Convert relative paths to absolute:
# https://github.com/nonjene/grunt-path-absolutely
# module.exports =
# 	dist:
# 		options:
# 			devRoot: "."
# 			releaseRoot: "https://kristinita.netlify.app"
# 			resourceFilter: ['*.{jpg,jpeg,png,webp,css,js}']
# 		files: [
# 			expand: true
# 			cwd: "."
# 			src: "<%= templates.paths.html %>"
# 			dest: "."
# 			]


# [DECLINED] I migrated to the PostCSS stylelint.
# #############
# # stylelint #
# #############
# ###
# [INFO] Stylelint — CSS linter:
# https://stylelint.io/
#
# [INFO] Grunt wrapper:
# https://www.npmjs.com/package/grunt-stylelint
#
# [INFO] Configuration:
# https://stylelint.io/user-guide/configuration
#
# [INFO] Grunt options:
# https://www.npmjs.com/package/grunt-stylelint#options
#
# [NOTE] Not to be confused with stylint — stylus linter!
# https://simenb.github.io/stylint/
#
# [INFO] manual stylelint installation required:
# “npm install stylelint --save-dev”:
# https://www.npmjs.com/package/grunt-stylelint#getting-started
#
# [NOTE] Manual configuration and config file installation required:
# https://stackoverflow.com/a/55553735/5951529
#
# [INFO] stylelint-config-recommended:
# https://www.npmjs.com/package/stylelint-config-recommended
# ###
# module.exports =
# 	lint:
# 		files: "<%= templates.paths.css %>"


# [DEPRECATED] Plugin no longer maintained:
# https://github.com/sindresorhus/grunt-cssnano
# I migrated to PostCSS cssnano
# ###########
# # cssnano #
# ###########
# ###
# [OVERVIEW] CSS minifier:
# http://cssnano.co/
#
# [INFO] Grunt wrapper:
# https://www.npmjs.com/package/grunt-cssnano
#
# [NOTE] Optimisations:
# https://cssnano.co/docs/what-are-optimisations/
#
# [INFO] CSS minification benchmark:
# https://goalsmashers.github.io/css-minification-benchmark/
#
# [NOTE] Delete “.beautified.css” files! cssnano incorrectly minify “.css” files, example:
# Files: output/theme/css/components/basic.beautified.css, output/theme/css/components/basic.css ->
# output/theme/css/components/basic.min.css
# ###
# module.exports =
# 	options:
#
# 		###
# 		[LEARN][CSS][JAVASCRIPT] Sourcemaps
# 		make debugging simply, if styles and scripts combine and compress:
# 		https://blog.teamtreehouse.com/introduction-source-maps
# 		###
# 		sourcemap: true
# 	nanopersonal:
# 		files: [
# 			expand: true
# 			cwd: "<%= templates.yamlconfig.OUTPUT_PATH %>/css/personal"
# 			src: ['**/*.css'
# 					'!**/*.min.css']
# 			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/css/personal"
# 			# [INFO] Extensions in filepaths:
# 			# https://gruntjs.com/configuring-tasks#building-the-files-object-dynamically
# 			ext: '.min.css'
# 			]
# 	nanotheme:
# 		files: [
# 			expand: true
# 			cwd: "<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/css"
# 			src: ['**/*.css'
# 					'!**/*.min.css']
# 			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>/css"
# 			ext: '.min.css'
# 			]


# [DEPRECATED] I migrated to grunt-postcss
# [INFO] The PostStylus code was contained in the file “stylus.coffee”
# 1. PostStylus no longer maintained
# 2. Possible conflicts between PostCSS versions in PostStylus and grunt-postcss
# 3. If sourcemap generated by PostStylus, and then grunt-postcss,
# I get errors from “merge-source-maps”
# 4. Bug — PostStylus builds passed if any warning:
# https://github.com/seaneking/poststylus/issues/26
# 5. I didn’t understand how to add options to processors,
# how to do similar for PostStylus:
# require('postcss-combine-duplicated-selectors') removeDuplicatedProperties: true
# ##############
# # PostStylus #
# ##############
# ###
# [OVERVIEW] PostCSS adapter for Stylus:
# https://www.npmjs.com/package/poststylus
#
# [INFO] PostStylus Grunt usage:
# https://www.npmjs.com/package/poststylus#grunt
#
# [INFO] Passing plugins arguments:
# https://www.npmjs.com/package/poststylus#passing-arguments-to-plugins
# doiuse = require('doiuse')
# ###
# postcss = ->
# 	require('poststylus') [
# 		################
# 		# AutoPrefixer #
# 		################
#
# 		# [OVERVIEW] Automatically add browser prefixes:
# 		# https://www.npmjs.com/package/autoprefixer
# 		'autoprefixer'
#
# 		# [BUG][SO] Build passed, if any warning
# 		# https://github.com/seaneking/poststylus/issues/26
# 		#
# 		# I use PostCSS instead of PostStylus for doiuse
# 		# doiuse
#
# 		################################
# 		# combine-duplicated-selectors #
# 		################################
# 		# [OVERVIEW] Combine duplicated selectors in generated CSS:
# 		# https://www.npmjs.com/package/postcss-combine-duplicated-selectors
# 		#
# 		# [INFO] Stylus itself don’t combine correctly “.progress”, “.progress-bar” in my HTML
# 		#
# 		# [FIXME] Add option “removeDuplicatedProperties: true” when migrate from PostStylus to PostCSS
# 		'postcss-combine-duplicated-selectors'
#
# 		#######################
# 		# combine-media-query #
# 		#######################
# 		# [OVERVIEW] Combine media queries PostCSS plugin:
# 		# https://www.npmjs.com/package/postcss-combine-media-query
# 		'postcss-combine-media-query'
#
# 		# [NOTE] postcss-merge-rules doesn’t work as a separate plugin,
# 		# it works solely as a part of the cssnano:
# 		# https://www.npmjs.com/package/postcss-merge-rules
# 		# https://cssnano.co/docs/optimisations/mergerules/
# 		# 'postcss-merge-rules'
#
# 		# [FIXME] Add “postcss-purgefonts” for adding solely specific characters
# 		# from “Material Icons” font:
# 		# https://github.com/ericpaulbishop/postcss-purgefonts
# 	]


# [DEPRECATED] CSSLint no longer maintained:
# https://github.com/CSSLint/csslint/issues/754
#
# If I use CSS3 syntax, I will get CSSLint error in any case.
# I can’t ignore parts of CSS files that contains CSS3 variables
# https://github.com/CSSLint/csslint/issues/720#issuecomment-376566968
# https://github.com/CSSLint/csslint/issues/720#issue-271707857
# ###########
# # csslint #
# ###########
# ###
# [OVERVIEW] Linter for CSS:
# http://csslint.net/
#
# [INFO] Grunt wrapper:
# https://www.npmjs.com/package/grunt-contrib-csslint
#
# [INFO] Rules:
# https://github.com/CSSLint/csslint/wiki/Rules
#
# [INFO] Grunt options:
# https://www.npmjs.com/package/grunt-contrib-csslint#csslint-task
#
# [INFO] Ignoring parts of CSS during linting:
# https://github.com/CSSLint/csslint/wiki/Ignoring-parts-of-CSS-during-linting
#
# [NOTE] Isn’t possible ignore specific rules for specific lines:
# https://stackoverflow.com/questions/29248792#comment103080092_35260823
#
# [NOTE] Stylus single-line buffered comments doesn’t worked for
# CSSLint ignore rules per line; they still removed:
# http://stylus-lang.com/docs/comments.html#multi-line-buffered
# https://github.com/CSSLint/csslint/wiki/Ignoring-parts-of-CSS-during-linting#ignoring-rules-per-line
# ###
# module.exports =
# 	options:
# 		csslintrc: '.csslintrc'
# 	lint:
# 		# [NOTE] “files” object doesn't work
# 		src: [
# 				"<%= templates.yamlconfig.OUTPUT_PATH %>/**/*.css"
# 				"!<%= templates.yamlconfig.OUTPUT_PATH %>/**/*.min*css"
# 				]

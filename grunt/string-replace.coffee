##########################
## grunt-string-replace ##
##########################
# [INFO] Substitutions in files use regular expressions:
# https://www.npmjs.com/package/grunt-string-replace
module.exports =


	#######################################
	# Development and production versions #
	#######################################
	# [INFO] Tasks for both: development and production versions
	html:

		# [NOTE] “<%= templates.paths.html %>” solely doesn’t work in this case
		files: [
			expand: true
			cwd: "."
			src: "<%= templates.paths.html %>"
			dest: "."
		]
		options:
			replacements: [

				# [LEARN][COFFEESCRIPT][REQUIRED] “#” comments here;
				# multiline “###” comments doesn’t supported inside array
				#
				# [LEARN][COFFEESCRIPT][REQUIRED] {Curly Braces} needs for delimite patterns


				# [DECLINED]
				# 1. Server often falls,
				# 2. Scripts from gitcdn.xyz sometimes doesn’t load,
				# 3. Cloudflare download source from gitcdn.xyz slowly
				#
				# [INFO] GitCDN:
				# https://github.com/schme16/gitcdn.xyz
				#
				# {
				# 	pattern: /https:\/\/kristinita.netlify.app\/(.+?)\.(js|css|ico|xml)/g
				# 	replacement: '//gitcdn.xyz/repo/Kristinita/Kristinita.netlify.com/master/$1.$2'
				# }


				# [INFO] Inject permalink to the header
				{
					pattern: /(<p>\s*?<a id="(.+?)"><\/a>\s*?<\/p>\s+?<h\d+?>((.|\n|\r)+?))(<\/h\d+?>)/g
					replacement: '$1 <a class="headerlink" href="#$2" title="Permanent link">¶</a>$5'
				}


				# [PURPOSE] Validation
				# [INFO] Remove proprietary attribute markdown="1" after site build:
				# https://python-markdown.github.io/extensions/extra/#markdown-inside-html-blocks

				{
					pattern: / markdown="1"/g
					replacement: ''
				}


				# [INFO] Wrap GRights abbreviations to KiraGRights class
				# [INFO] Regex for punctuation marks from here:
				# https://www.regular-expressions.info/posixbrackets.html
				{
					pattern: /(GR:.+?)(?=(\s|[!"\#$%&'()*+,\-./:;<=>?@\[\\\]^_`{|}~]))/g
					replacement: '<span class="KiraGRights">$1</span>'
				}


				# [INFO] Absolute paths for favicons
				#
				# [NOTE] Currently, use default RealFaviconGenerator behavior
				# we can use relative paths or unexpected lines will inject to our HTML files.
				# These regular expressions fix the problem.
				#
				# [EXAMPLE] “<link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">” →
				# “<link rel="apple-touch-icon" sizes="180x180" href="https://kristinita.netlify.app/apple-touch-icon.png">”
				#
				{
					pattern: /(<link rel=".+?".+?href=")(\/.+?">)/g
					replacement: '$1<%= templates.yamlconfig.SITEURL %>$2'
				}

				{
					pattern: /(<meta name="msapplication-TileImage" content=")(\/mstile-144x144.png">)/g
					replacement: '$1<%= templates.yamlconfig.SITEURL %>$2'
				}


				# [DECLINED]
				# “<base target="_blank">” is more simple solution;
				# it reduces the size of HTML files
				#
				# [LEARN][HTML] “target="_blank"” without “rel="noopener"” has vulnerabilities,
				# use “rel="noopener noreferrer"” for “target="_blank"”:
				# https://mathiasbynens.github.io/rel-noopener/
				# https://web.dev/external-anchors-use-rel-noopener/
				# https://davidebove.com/blog/2016/05/05/target_blank-the-vulnerability-in-your-browser/
				#
				# [INFO] Htmllint require it:
				# https://github.com/htmllint/htmllint/issues/232
				#
				# {
				# 	pattern: /(target="_blank")/g
				# 	replacement: '$1 rel="noopener noreferrer"'
				# }


				# [DECLINED] I migrated from Tooltipster to Balloon.css
				# [INFO] Clipboard.js + Tooltipster
				# {
				# 	pattern: /(<pre>)(((.|\n|\r)+?)?)(<\/pre>((\s+?)?)<\/div>)/g
				# 	replacement: '$1<button class="SashaButton SashaTooltip"><img class="SashaNotModify" \
				# 				src="<%= templates.yamlconfig.SITEURL %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>\
				# 				/images/interface-images/clippy.svg" \
				# 				alt="Clipboard button"></button>$2$5'
				# }


				# [INFO] Clipboard.js + Balloon.css
				# for SuperFences Python Markdown extension:
				# http://ru.stackoverflow.com/a/582520/199934
				# https://stackoverflow.com/a/33758435/5951529
				#
				# [LEARN][REGEX] Use “(.|\n|\r)” for any symbol, not “(.|\n)”
				#
				# [INFO] <button> and <img> tags must be in one line;
				# no line breaks between them!
				{
					pattern: /(<pre>)(((.|\n|\r)+?)?)(<\/pre>((\s+?)?)<\/div>)/g
					replacement: '$1<button class="SashaButton" data-balloon-pos="left"><img class="SashaNotModify" \
								src="<%= templates.yamlconfig.SITEURL %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>\
								/images/interface-images/clippy.svg" \
								alt="Clipboard button"></button>$2$5'
				}



				# [DECLINED] I migrated to Chocolat
				# [INFO] Fancybox and JQueryLazy images
				#
				# [NOTE] You need use same images 2 time: in “href” and “data-src”
				#
				#
				# {
				# 	pattern: /<img alt="([^"]+?)" src="(.+?)"( \/)?>/g
				# 	replacement: '<a class="fancybox" href="$2"><img class="SashaLazy" \
				# 				src="<%= templates.yamlconfig.SITEURL %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>\
				# 				/images/interface-images/transparent-one-pixel.png" \
				# 				data-src="$2" alt="$1"></a>'
				# }


				# [DECLINED] I mirgated to Chocolat
				# [INFO] lightgallery for images
				#
				#
				# {
				# 	pattern: /<img alt="([^"]+?)" src="(.+?)"( \/)?>/g
				# 	replacement: '<div id="lightgallery"><a href="$2"><img class="SashaLazy" \
				# 				src="<%= templates.yamlconfig.SITEURL %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>\
				# 				/images/interface-images/transparent-one-pixel.png" \
				# 				data-src="$2" alt="$1"></a></div>'
				# }


				# [DECLINED] I migrated to HesGallery
				# [INFO] Wrap images to Chocolat syntax:
				# http://chocolat.insipi.de/#getting-started
				# {
				# 	pattern: /<img alt="([^"]+?)" src="(.+?)"( \/)?>/g
				# 	replacement: '<div class="chocolat-parent"><a class="chocolat-image" href="$2"><img class="SashaLazy" \
				# 				src="$2" alt="$1"></a></div>'
				# }

				# [INFO] Wrap images to HesGallery syntax:
				# https://github.com/demtario/hes-gallery#sample-gallery-design

				# [REQUIRED] “?”. Regex works incorrectly, if 2 or more images on 1 line
				{
					pattern: /((<img alt="[^"]+") src="(.+?)")>/g
					replacement: '<div class="hes-gallery">$2 class="lazyload" data-src="$3" \
							src="<%= templates.yamlconfig.SITEURL %>/<%= templates.yamlconfig.THEME_STATIC_DIR %>\
							/images/interface-images/transparent-one-pixel.png"></div>'
				}

				# [INFO] Add class for links to PDF files “.pdf” and “.pdf#page=<page_number>”
				{
					pattern: /(a href="[^"]+\.pdf(#page=\d+)?")/g
					replacement: '$1 class="KiraPDFLink"'
				}

				# [INFO] Add class for links to YouTube
				{
					pattern: /(a href="https:\/\/(www\.youtube\.com|youtu\.be)[^"]+")/g
					replacement: '$1 class="KiraYouTubeLink"'
				}

			]


	# [INFO] Substitutions in JavaScript files generated from CoffeeScript
	coffeescript:
		files: [
			expand: true
			cwd: "<%= templates.yamlconfig.OUTPUT_PATH %>"
			src: '**/*.js'
			dest: "<%= templates.yamlconfig.OUTPUT_PATH %>"
		]
		options:
			replacements: [

				############
				# Wildfire #
				############
				# Add Wildfire to site
				# https://slides.com/chengkang/how-to-wildfire

				# [INFO] Firebase API key
				{
					pattern: /<%= api_key_wildfire_firebase %>/g
					replacement: "<%= templates.yamlconfig.API_KEY_WILDFIRE_FIREBASE %>"
				}

				# [INFO] Firebase project name
				{
					pattern: /<%= wildfire_firebase_project %>/g
					replacement: "<%= templates.yamlconfig.WILDFIRE_FIREBASE_PROJECT %>"
				}

				# [INFO] Firebase messagingSenderId
				{
					pattern: /<%= wildfire_messaging_sender_id %>/g
					replacement: "<%= templates.yamlconfig.WILDFIRE_MESSAGING_SENDER_ID %>"
				}

				# [INFO] typo-reporter formId
				{
					pattern: /<%= form_id_typo_reporter %>/g
					replacement: "<%= templates.yamlconfig.FORM_ID_TYPO_REPORTER %>"
				}
			]


	######################
	# Production version #
	######################
	###
	Tasks for production version only, not for dev version
	[WARNING] Needs files for each subtask. I can't combine “asideimages”, “backgroundimages” and
	“absoluteinsidehtmlimages” to one “publish” subtask.
	###

	###
	[DECLINED] I solved problem via {{MIN}} variable in production settings/
	[INFO] Replace “.css” and “.js” to “.min.css” and “.min.js” in HTML files

	html_min_extensions:
		files: [
			expand: true
			cwd: "."
			src: "<%= templates.paths.html %>"
			dest: "."
			]
		options:
			replacements: [
				{
					pattern: /("https\:\/\/kristinita\.netlify\.com\/.+)(\.(css|js)")/g
					replacement: '$1.min$2'
				}
			]
	###

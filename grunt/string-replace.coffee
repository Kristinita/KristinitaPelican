##########################
## grunt-string-replace ##
##########################
# Replace text, regex support
# https://www.npmjs.com/package/grunt-string-replace
module.exports =
	#######################################
	# Development and production versions #
	#######################################
	all:
		files: [
			expand: true
			cwd: "<%= templates.paths.output_path %>"
			src: '**/*.html'
			dest: "<%= templates.paths.output_path %>"
		]
		options:
			replacements: [
				# # GitCDN
				# # https://github.com/schme16/gitcdn.xyz
				# # [DEPRECATED]
				# # 1. Server often falls,
				# # 2. Scripts from gitcdn.xyz sometimes doesn't load,
				# # 3. Cloudflare download source from gitcdn.xyz slow
				# {
				# pattern: /https:\/\/kristinita.ru\/(.+?)\.(js|css|ico|xml)/g
				# replacement: '//gitcdn.xyz/repo/Kristinita/Kristinita.github.io/master/$1.$2'
				# }
				# Header permalink
				{
				pattern: /(<p>\s*?<a id="(.+?)"><\/a>\s*?<\/p>\s+?<h\d+?>((.|\n|\r)+?))(<\/h\d+?>)/g
				replacement: '$1 <a class="headerlink" href="#$2" title="Permanent link">¶</a>$5'
				}
				# Remove proprietary attribute markdown="1" after site build:
				# https://python-markdown.github.io/extensions/extra/#markdown-inside-html-blocks
				{
				pattern: / markdown="1"/g
				replacement: ''
				}
			]
	#######################
	# Development version #
	#######################
	dev:
		files: [
			expand: true
			cwd: "<%= templates.paths.output_path %>"
			src: '**/*.html'
			dest: "<%= templates.paths.output_path %>"
		]
		options:
			# [NOTE] Use (.|\n|\r) for any symbol, not (.|\n)
			# [NOTE] {Curly Braces} needs for delimite patterns
			replacements: [
				# Clipboard.js + Tooltipster for SuperFences
				# http://ru.stackoverflow.com/a/582520/199934
				# https://stackoverflow.com/a/33758435/5951529
				# [WARNING] <button> and <img> tags must be in one line;
				# no line breaks between them!
				{
				pattern: /(<pre>)(((.|\n|\r)+?)?)(<\/pre>((\s+?)?)<\/div>)/g
				replacement: '$1<button class="SashaButton SashaTooltip"><img class="SashaNotModify" \
								src="../<%= templates.paths.theme_static_dir %>/images/interface-images/clippy.svg" \
								alt="Clipboard button"></button>$2$5'
				}
				# Relative path
				# Fancybox and JQueryLazy images
				# [WARNING] You need use same images 2 time: in “href” and “data-src”
				{
				pattern: /<img alt="([^"]+?)" src="(.+?)"( \/)?>/g
				replacement: '<img class="SashaLazy" \
								src="../<%= templates.paths.theme_static_dir %>\
								/images/interface-images/transparent-one-pixel.png" \
								data-src="$2" alt="$1">'
				}
			]
	######################
	# Production version #
	######################
	# [WARNING] Needs files for each subtask. I can't combine “asideimages”, “backgroundimages” and
	# “absoluteinsidehtmlimages” to one “publish” subtask.

	# Absolute paths to images inside HTML
	absoluteinsidehtmlimages:
		files: [
			expand: true
			cwd: "<%= templates.paths.output_path %>"
			src: '**/*.{html,css}'
			dest: "<%= templates.paths.output_path %>"
		]
		options:
			replacements: [
				{
				pattern: /(<pre>)(((.|\n|\r)+?)?)(<\/pre>((\s+?)?)<\/div>)/g
				replacement: '$1<button class="SashaButton SashaTooltip"><img class="SashaNotModify" \
								src="<%= templates.site.siteurl %>/<%= templates.paths.theme_static_dir %>\
								/images/interface-images/clippy.svg" \
								alt="Clipboard button"></button>$2$5'
				}
				# Fancybox and JQueryLazy images
				{
				pattern: /<img alt="([^"]+?)" src="(.+?)"( \/)?>/g
				replacement: '<a class="fancybox" href="$2"><img class="SashaLazy" \
								src="<%= templates.site.siteurl %>/<%= templates.paths.theme_static_dir %>\
								/images/interface-images/transparent-one-pixel.png" \
								data-src="$2" alt="$1"></a>'
				}
			]
	# Convert relative paths to absolute in aside images
	asideimages:
		files: [
			expand: true
			cwd: "<%= templates.paths.output_path %>/<%= templates.paths.theme_static_dir %>/stylus/aside"
			src: '*.styl'
			dest: "<%= templates.paths.output_path %>/<%= templates.paths.theme_static_dir %>/stylus/aside"
		]
		options:
			replacements: [
				pattern: /(url\(")(\.\.\/\.\.)(\/images\/aside\/(.+?)"\))/g
				replacement: "$1<%= templates.site.siteurl %>/<%= templates.paths.theme_static_dir %>$3"
			]
	# Convert relative paths to absolute in background images
	backgroundimages:
		files: [
			expand: true
			cwd: "<%= templates.paths.output_path %>/<%= templates.paths.theme_static_dir %>/stylus/sections"
			src: '*.styl'
			dest: "<%= templates.paths.output_path %>/<%= templates.paths.theme_static_dir %>/stylus/sections"
		]
		options:
			replacements: [
				pattern: /(url\(")(\.\.\/\.\.)(\/images\/backgrounds\/(.+?)"\))/g
				replacement: "$1<%= templates.site.siteurl %>/<%= templates.paths.theme_static_dir %>$3"
			]

##########################
## grunt-string-replace ##
##########################
# Replace text, regex support
# https://www.npmjs.com/package/grunt-string-replace
module.exports =
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
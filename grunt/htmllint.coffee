############
# htmllint #
############
###
[OVERWIEW] Lint HTML:
http://htmllint.github.io/
https://www.npmjs.com/package/htmllint

[INFO] Grunt wrapper:
https://www.npmjs.com/package/grunt-htmllint

[INFO] Configuration:
https://github.com/htmllint/htmllint/wiki/Options

[INFO] Inline options ignoring:
https://github.com/htmllint/htmllint/wiki/Inline-Configurations

[WARNING] 1 error — 1 toast. The number of toasts may be large!
https://github.com/htmllint/grunt-htmllint/issues/25

[INFO] Run “htmllint” after “grunt” or “grunt publish” task, not after “pelican” command.

[NOTE] “attr-bans” modified, because Progressbar needs “style” attribute:
https://github.com/facelessuser/pymdown-extensions/issues/293
https://github.com/htmllint/htmllint/wiki/Options#attr-bans

[NOTE] I remove “width” attribute from “attr-bans”, because:
1. “width” and “height” for “img” is best practice.
2. I couldn’t find tools that add “width” and “height” to CSS, not to HTML
https://github.com/htmllint/htmllint-cli/issues/22#issuecomment-724600363

[FIXME] Migrate to BEM → remove “id-class-style”
https://github.com/htmllint/htmllint/wiki/Options#id-class-style

[INFO] “raw-ignore-regex” for ignoring linting inside style and script tags:
"raw-ignore-regex": "/(\\<script\\>.*\\<\/script\\>|\\<style\\>.*\\<\/style\\>)/",
https://github.com/htmllint/htmllint/issues/257
https://github.com/htmllint/htmllint/wiki/Options#raw-ignore-regex
[NOTE] This regex not work as expected:
"raw-ignore-regex": "/(\\<(script|style)\\>.*\\<\/(script|style)\\>|/"

[INFO] “tag-bans” — I enable “style” tag, because it required for speed performance:
https://developers.google.com/web/tools/lighthouse/audits/blocking-resources
https://github.com/htmllint/htmllint/wiki/Options#tag-bans
###
module.exports =
	options:
		###
		[INFO] fail the build after any error:
		https://www.npmjs.com/package/grunt-htmllint#optionsforce
		###
		force: false
		# [INFO] Support configuration file “.htmllintrc”
		htmllintrc: true
	src: "<%= templates.paths.html %>"

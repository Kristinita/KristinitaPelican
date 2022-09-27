###############
# check-pages #
###############
###
[OVERVIEW] Check dead and incorrect links:
https://www.npmjs.com/package/check-pages
https://dlaa.me/blog/post/gruntcheckpages

[INFO] Grunt implementation:
https://www.npmjs.com/package/grunt-check-pages

[OPTIONS]
https://www.npmjs.com/package/check-pages#options

[NOTE] check-pages doesn’t check anchors:
https://github.com/DavidAnson/check-pages/issues/10

[INFO] htmltest is alternative for checkPages:
https://github.com/wjdp/htmltest
###
module.exports = (grunt) ->

	###
	[INFO] Get all HTML files list use it as variable, if
	building object dynamically not supported for specific option:
	https://stackoverflow.com/a/54551148/5951529
	https://gruntjs.com/configuring-tasks#building-the-files-object-dynamically

	[NOTE] These functions will not work, if we’re placed them
	to “Gruntfile.coffee” or “templates.coffee”;
	For example, it doesn’t work in “templates.coffee”:
		kira_all_html: ->
			grunt.file.expand "<%= templates.yamlconfig.OUTPUT_PATH %>/*.html"
		kira_all_html_template: "<%= templates.kira_all_html() %>"
		# [LEARN][JAVASCRIPT] Convert comma-separated string to array:
		# https://stackoverflow.com/a/2858130/5951529
		kira_all_html_array: ->
			# [LEARN][GRUNT] Get configuration value:
			# https://www.nglesson.com/Livres/GettingStartedWithGrunt.pdf#page=64
			# [INFO] “grunt.config” = “grunt.config.get”, if one argument passed:
			# https://gruntjs.com/api/grunt.config#grunt.config
			grunt.config("templates.kira_all_html_template").split(",")
		kira_all_html_array_template: ["<%= templates.kira_all_html_array() %>"]
		kira_all_html_localhost: ->
			grunt.config("templates.kira_all_html_array_template").map((i) ->
				"http://localhost:4147/" + i
			)

	Grunt will not recognize “kira_all_html” and any subsequent variables as arrays

	[FIXME] Enable these functions for grunt-check-console and grunt-pageres,
	not specifically for grunt-check-pages

	[FIXME] Direct path name “output” required;
	if “<%= templates.yamlconfig.OUTPUT_PATH %>”, checkPages will not work
	###
	kira_all_html = ->
		grunt.file.expand "output/**/*.html"

	###
	[LEARN][JAVASCRIPT] Add text before each element of array:
	https://stackoverflow.com/a/33079773/5951529

	[NOTE] Use “http://0.0.0.0:4147/”,
	“http://localhost:4147/” doesn’t work
	###
	kira_all_html_localhost = ->
		kira_all_html().map((kira_web_page) ->
			"http://0.0.0.0:4147/" + kira_web_page
		)

	development:
		options:
			###
			[INFO] Wildcards are not supported;
			[REQUIRED] “http”, “https” or “file” protocol:
			https://www.npmjs.com/package/check-pages#pageurls

			Therefore, I add “kira_all_html_localhost()” function
			for check all my articles and pages.
			###
			pageUrls: kira_all_html_localhost()

			###
			[INFO] Check all links in pages for validity:
			https://www.npmjs.com/package/check-pages#checklinks

			[BUG] Don’t use Cyrillic domains in URL’s.
			checkPages doesn’t support encoded Cyrillic URL’s:
			https://github.com/DavidAnson/check-pages-cli/issues/1
			###
			checkLinks: true

			###
			[INFO] URLs that should be ignored by check-pages:
			https://www.npmjs.com/package/check-pages#linkstoignore

			linksToIgnore:
			###

			###
			[INFO] Identify placeholder links as “<a href="#">”, that haven’t be updated:
			https://www.npmjs.com/package/check-pages#noemptyfragments
			###
			noEmptyFragments: true

			###
			[INFO] Fail if link to localhost are encountered;
			this option detect temporary links from development.
			Use it in production, not in development:
			https://www.npmjs.com/package/check-pages#nolocallinks
			###
			noLocalLinks: false

			###
			[INFO] Fail task, if any redirect are encountered:
			https://www.npmjs.com/package/check-pages#noredirects

			###
			noRedirects: true

			###
			[INFO] Check solely internal, not third-party links:
			https://www.npmjs.com/package/check-pages#onlysamedomain
			###
			onlySameDomain: true

			###
			[INFO] Fail task, if we use HTTP link, when https is also valid:
			https://www.npmjs.com/package/check-pages#prefersecure
			###
			preferSecure: true

			###
			[INFO] Verify links with file hashes as “styles.css?md5=4f47458e34bc855a46349c1335f58cc3”:
			https://www.npmjs.com/package/check-pages#queryhashes
			###
			queryHashes: true

			###
			[INFO] I don’t use response headers.
			That’s why “checkCaching”, “checkXhtml” and “checkCompression”.

			[INFO] Verifies the HTTP Cache-Control and ETag response headers are present and valid:
			https://www.npmjs.com/package/check-pages#checkcaching
			###
			checkCaching: false

			###
			[INFO] Parse each URL’s content as XHTML:
			https://www.npmjs.com/package/check-pages#checkxhtml
			###
			checkXhtml: false

			###
			[INFO] Verifies the HTTP Content-Encoding response header is present and valid
			https://www.npmjs.com/package/check-pages#checkcompression
			###
			checkCompression: false

			###
			[INFO] Show summary results after all checks:
			https://www.npmjs.com/package/check-pages#summary
			###
			summary: true

			###
			[INFO] Brief overview instead of default verbose output:
			https://www.npmjs.com/package/check-pages#terse

			[INFO] “true”, because otherwise verbose output too long:
			https://travis-ci.com/github/Kristinita/KristinitaPelican/jobs/442165258
			###
			terse: true

			###
			[INFO] Maximum time in milliseconds (not seconds) a page request can take a finish downloading:
			https://www.npmjs.com/package/check-pages#maxresponsetime
			###
			maxResponseTime: 7000

			###
			[INFO] Custom User-Agent:
			https://www.npmjs.com/package/check-pages#useragent
			https://www.whoishostingthis.com/tools/user-agent/

			userAgent: "default"
			###

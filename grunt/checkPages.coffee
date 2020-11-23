###############
# check-pages #
###############
###
[PURPOSE] Check dead and incorrect links:
https://www.npmjs.com/package/check-pages
https://dlaa.me/blog/post/gruntcheckpages
[INFO] Grunt implementation:
https://www.npmjs.com/package/grunt-check-pages
[INFO] Options:
https://www.npmjs.com/package/check-pages#options

[NOTE] check-pages doesn’t check anchors:
https://github.com/DavidAnson/check-pages/issues/10
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
	###
	kira_all_html_localhost = ->
		kira_all_html().map((kira_web_page) ->
			"http://localhost:4147/" + kira_web_page
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
			###
			checkLinks: true

			###
			[INFO] URLs that should be ignored by check-pages:
			https://www.npmjs.com/package/check-pages#linkstoignore

			[FIXME][ISSUE] checkPages show error for Cyrillic links as
			“http://журнальныймир.рф/avtor/savchenko-boris”
			###
			linksToIgnore: ["http://localhost:4147/output/Erics-Rooms/\
			%D0%B6%D1%83%D1%80%D0%BD%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9%D0%BC%D0%B8%D1%80.%D1%80%D1%84/avtor/savchenko-boris"]

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

			[FIXME][ISSUE][MCVE] Strange redirected link bug:
			https://ci.appveyor.com/project/Kristinita/kristinitapelican/builds/36374275/job/gm6q5v4lehbc5em3#L7504
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
			[INFO] Verifies the HTTP Cache-Control and ETag response headers are present and valid:
			https://www.npmjs.com/package/check-pages#checkcaching

			[FIXME][ISSUE] “checkCaching”, “checkXhtml” and “checkCompression”
			works incorrectly on localhost.
			Therefore, “false”
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
			###
			# userAgent: "default"

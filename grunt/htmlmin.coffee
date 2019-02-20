#################
# html-minifier #
#################
# Minify HTML:
# https://www.npmjs.com/package/html-minifier
# Grunt-wrapper:
# https://www.npmjs.com/package/grunt-contrib-htmlmin
# Online:
# https://kangax.github.io/html-minifier/
# [NOTE] I migrate to html-minifier from minimize:
# 1. style tag minifying support:
# https://github.com/kangax/html-minifier/issues/396
# 2. More features:
# https://www.npmjs.com/package/html-minifier#options-quick-reference
# 3. Minification comparision:
# https://www.npmjs.com/package/html-minifier#minification-comparison
# [WARNING] Use “bunch of fragile regexes” instead of HTML parser:
# https://www.npmjs.com/package/grunt-minify-html
module.exports =
	minify:
		# Options:
		# https://www.npmjs.com/package/html-minifier#options-quick-reference
		options:
			# [INFO] Short links as “readonly="readonly"”:
			# http://perfectionkills.com/experimenting-with-html-minifier/#collapse_boolean_attributes
			collapseBooleanAttributes: true
			# [INFO] Remove spaces:
			# http://perfectionkills.com/experimenting-with-html-minifier/#collapse_whitespace
			collapseInlineTagWhitespace: true
			collapseWhitespace: true
			# [INFO] I want remove whitespaces for better minification
			conservativeCollapse: false
			# [INFO] Minify CSS in <style> tag use clean-css:
			# https://jakubpawlowicz.github.io/clean-css/
			# https://www.npmjs.com/package/clean-css
			minifyCSS: true
			# [INFO] Minfy JavaScript in <script> tag use UglifyJS2:
			# http://lisperator.net/uglifyjs/
			minifyJS: true
			# [FIXME] No examples, how use minifyURLs:
			# https://github.com/kangax/html-minifier/issues/667
			# https://www.npmjs.com/package/html-minifier#options-quick-reference
			# https://www.npmjs.com/package/relateurl
			# minifyURLs: ("<%= templates.site.siteurl %>
			# 			<%= templates.paths.cwd %>/<%= templates.site.output_path %>")
			# [INFO] Minify JSON-LD, not preserve it:
			# https://www.npmjs.com/package/html-minifier#options-quick-reference
			processScripts: ['application/ld+json']
			# [NOTE] Not recommeded:
			# http://perfectionkills.com/experimenting-with-html-minifier/#remove_attribute_quotes
			# http://jkorpela.fi/qattr.html
			# https://www.w3schools.com/html/html_attributes.asp
			removeAttributeQuotes: false
			removeComments: true
			# [INFO] http://perfectionkills.com/experimenting-with-html-minifier/#remove_empty_or_blank_attributes
			removeEmptyAttributes: true
			# [FIXME] Option remove blank “body” tag → HTML make non-valid.
			# Temporary disable, until I make normal templates for categories:
			# [INFO] http://perfectionkills.com/experimenting-with-html-minifier/#remove_empty_elements
			removeEmptyElements: false
			# [NOTE] Remove body, head and another tags; not recommend:
			# http://perfectionkills.com/experimenting-with-html-minifier/#remove_optional_tags
			removeOptionalTags: false
			# [INFO] Remove attributes with default values:
			# http://perfectionkills.com/experimenting-with-html-minifier/#remove_redundant_attributes
			removeRedundantAttributes: true
			# [INFO] Remove type="text/javascript" from script tags
			removeScriptTypeAttributes: true
			# [INFO] Remove type="text/css" from style and link tags
			removeStyleLinkTypeAttributes: true
			# [NOTE] That this will result in invalid HTML:
			# https://www.npmjs.com/package/html-minifier#options-quick-reference
			removeTagWhitespace: false
			# [INFO] Sorting improve compression ratio of gzip used in HTTP compression:
			# https://www.npmjs.com/package/html-minifier#sorting-attributes--style-classes
			sortAttributes: true
			sortClassName: true
			# [INFO] Use short DOCTYPE; is generally pretty save:
			# http://perfectionkills.com/experimenting-with-html-minifier/#use_short_doctype
			# http://perfectionkills.com/optimizing-html/#6_doctype_html
			useShortDoctype: true
		files: [
			expand: true
			cwd: "."
			src: ["<%= templates.paths.output_path %>/**/*.html"]
			dest: "."
			]

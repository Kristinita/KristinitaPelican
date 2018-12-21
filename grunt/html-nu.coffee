##############
# grunt-html #
##############
# Lint HTML, use vnu.jar markup checker:
# https://validator.github.io/validator/
# https://www.npmjs.com/package/grunt-html
# [WARNING] No rules list:
# https://stackoverflow.com/a/35646026/5951529
# [NOTE] W3C validator is obsolete, use W3C HTML checker:
# Official: https://stackoverflow.com/a/32675273/5951529
# More details: https://rocketvalidator.com/articles/w3c-validator-is-legacy-long-live-validator-nu
module.exports =
	options:
		# [TEMP] Footnotes obsolete syntax:
		# https://github.com/Python-Markdown/markdown/issues/768
		ignore: ["Bad value “footnote” for attribute “rel” on element “a”: \
				The string “footnote” is not a registered keyword.", "The “rev” attribute on the “a” element is obsolete. \
				Use the “rel” attribute instead, with a term having the opposite meaning."]
	src: ["<%= templates.paths.output_path %>/**/*.html"]

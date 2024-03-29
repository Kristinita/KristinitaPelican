##############
# grunt-html #
##############
###
[OVERVIEW] Lint HTML, use vnu.jar markup checker:
https://validator.github.io/validator/

[INFO] Grunt wrapper:
https://www.npmjs.com/package/grunt-html

[NOTE] No rules list:
https://stackoverflow.com/a/35646026/5951529

[NOTE] W3C validator is obsolete, use W3C HTML checker:
https://stackoverflow.com/a/32675273/5951529
https://rocketvalidator.com/articles/w3c-validator-is-legacy-long-live-validator-nu
###
module.exports =
	src: "<%= templates.paths.html %>"

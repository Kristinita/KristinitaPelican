#############
# stylelint #
#############
# Stylelint — CSS linter:
# https://stylelint.io/
# Grunt wrapper:
# https://www.npmjs.com/package/grunt-stylelint
# Configuration:
# https://stylelint.io/user-guide/configuration
# Grunt options:
# https://www.npmjs.com/package/grunt-stylelint#options
# [NOTE] Not to be confused with stylint — stylus linter!
# https://simenb.github.io/stylint/
# [NOTE] manual stylelint installation required:
# “npm install stylelint --save-dev”:
# https://www.npmjs.com/package/grunt-stylelint#getting-started
# [NOTE] Manual configuration and config file installation required:
# https://stackoverflow.com/a/55553735/5951529
# [INFO] stylelint-config-recommended:
# https://www.npmjs.com/package/stylelint-config-recommended
module.exports =
	lint:
		files: "<%= templates.paths.css %>"

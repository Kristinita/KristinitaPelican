##########
# pylint #
##########
###
[OVERVIEW] Pylint — Python code analysis:
https://www.pylint.org/

[INFO] Grunt wrapper:
https://www.npmjs.com/package/grunt-pylint

[OPTIONS] https://www.npmjs.com/package/grunt-pylint#options

[NOTE] pylint haven’t glob by default:
https://github.com/PyCQA/pylint/issues/352

[INFO] pylint works only if “__init__.py” in the folder:
https://github.com/PyCQA/pylint/issues/2108
###
module.exports =
	options:
		# [INFO] Use pylint from pipenv
		externalPylint: true

		###
		[INFO] Path to pipenv virtual environment; pipenv packages doesn't work without it:
		https://travis-ci.org/Kristinita/SashaGruntDebugging/builds/506827879
		###
		virtualenv: ".venv"
	pelican:
		###
		[INFO] Get list item in Grunt template:
		https://oncletom.io/2013/dynamic-grunt-targets-using-templates/

		[INFO] I check personal “.py” files

		[NOTE] I don’t check by pylint third-party plugins, that I fix,
		but plugins authors not apply changes.
		###
		src: "<%= templates.paths.python %>"

#################
## grunt-shell ##
#################
# Grunt plugin to run non-Grunt CLI commands.
# https://www.npmjs.com/package/grunt-shell
module.exports =


	#############
	## Pelican ##
	#############
	# Build Pelican site:
	# http://manos.im/blog/static-site-pelican-grunt-travis-github-pages/
	# https://github.com/sindresorhus/grunt-shell
	# Needs “pipenv run”, that scripts from pipenv virtual environment successful run;
	# for example, “pipenv run pelican --help”, not “pelican --help”.
	# https://robots.thoughtbot.com/how-to-manage-your-python-projects-with-pipenv
	# “--fatal” — exit(1), if any warning or error
	generate:
		command: 'pipenv run pelican content -s pelicanconf.py --fatal warnings'
	deploy:
		command: 'pipenv run pelican content -s publishconf.py --fatal warnings'


	# [DEPRECATED] If “pipenv --update”, users have bug:
	# https://github.com/pypa/pipenv/issues/1761
	# ############
	# ## pipenv ##
	# ############
	# # Update Pip and Pipenv
	# pipenvupdate:
	# 	command: 'pipenv --update'


	# Update all Python Pipenv packages:
	# https://stackoverflow.com/a/16269635/5951529
	# https://github.com/jgonggrijp/pip-review#pip-review
	pipenvupdateall:
		command: 'pipenv run pip-review --auto'
	# Clean unused packages
	# [WARNING] That “pipenv clean” doesn't remove Python Markdown extensions, you need install them in format:
	# pipenv install -e git+https://github.com/user/package_name.git#egg=package_name --dev
	# https://github.com/pypa/pipenv/issues/1524
	# This is “editable” format:
	# http://pipenv.readthedocs.io/en/latest/basics/#editable-dependencies-e-g-e
	pipenvcleanunused:
		command: 'pipenv clean --verbose'


	#########
	## git ##
	#########
	# Shrink .git folder
	# https://stackoverflow.com/a/2116892/5951529
	# Before: 568 MB — <https://i.imgur.com/aMvcfY1.png>
	# After: 341 MB — <https://i.imgur.com/52cQ1AL.png>
	#########
	# Remove reflog entries older, than 90 days:
	# https://stackoverflow.com/a/3824970/5951529
	gitreflog:
		command: 'git reflog expire --all'
	# git gc
	# https://stackoverflow.com/a/55738/5951529
	# Prune loose objects older than 2 weeks ago:
	# https://www.kernel.org/pub/software/scm/git/docgit-gc.html
	gitgarbagecollector:
		command: 'git gc --aggressive'


	###############
	## HTML Tidy ##
	###############
	# HTML Tidy scripts for Unix and Linux
	tidymodify:
		# Platform-specific tasks:
		# https://stackoverflow.com/a/23848087/5951529
		if process.platform == "win32"
			# Need quotes, that command run:
		    command: '"tidy/tidy-modify.bat"'
		else
			# Fix permission denied:
			# https://stackoverflow.com/a/46818913/5951529
		    command: 'bash tidy/tidy-modify.sh'
	tidyvalidate:
		if process.platform == "win32"
			command: '"tidy/tidy-validate.bat"'
		else
			command: 'bash tidy/tidy-validate.sh'


	##########
	## lice ##
	##########
	# Generate license for project:
	# https://pypi.org/project/lice/
	lice:
		# [BUG] lice doesn't work in AppVeyor:
		# https://github.com/appveyor/ci/issues/2226
		if process.platform == "win32"
			command: 'echo "Sorry, lice doesn\'t work in AppVeyor — https://github.com/appveyor/ci/issues/2226"'
		else
			command: 'pipenv run lice mit -o "Sasha Chernykh" --file output/LICENSE.md'


	############
	## covgen ##
	############
	# Generate Code of conduct for project:
	# https://contributor-covenant.org/
	# https://www.npmjs.com/package/covgen
	# [WARNING] Generate “CODE_OF_CONDUCT.md” only for root folder:
	# https://github.com/simonv3/covenant-generator/issues/15
	# [WARNING] Unobfuscated plain text e-mail:
	# https://github.com/ContributorCovenant/contributor_covenant/issues/523
	#########
	## npx ##
	#########
	# Tool for running npm CLI commands:
	# https://www.npmjs.com/package/npx
	# https://medium.com/@maybekatz/introducing-npx-an-npm-package-runner-55f7d4bd282b
	# https://stackoverflow.com/a/45164863/5951529
	covgen:
		command: 'npx covgen SashaChernykhEmpressOfUniverse$kristinita.ru'


	##################
	## pip-licenses ##
	##################
	# Output licenses of all PyPI packages:
	# https://pypi.org/project/pip-licenses/
	piplicenses:
		command: 'pipenv run pip-licenses --format-markdown > python.md'

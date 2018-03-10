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
	############
	## pipenv ##
	############
	# Update Pip and Pipenv
	pipenvupdate:
		command: 'pipenv --update'
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
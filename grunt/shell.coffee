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
	# # Update Pip and Pipenv
	# pipenvupdate:
	# 	command: 'pipenv --update'

	############
	## pipenv ##
	############
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
	# Update packages versions to the newest in “Pipfile.lock”, that:
	# 1. Another users have newest packages versions in their environment:
	# 2. Fix CI errors as https://travis-ci.org/Kristinita/KristinitaPelican/jobs/368968779#L658-L677
	# https://docs.pipenv.org/basics/#example-pipenv-upgrade-workflow
	pipenvupdatepipfilelock:
		command: 'pipenv update'


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
	# Validate and fix HTMl files:
	# http://www.html-tidy.org/
	# Description:
	# http://api.html-tidy.org/tidy/tidylib_api_next/index.html
	# Options:
	# http://api.html-tidy.org/tidy/quickref_next.html
	tidymodify:
		# Platform-specific tasks:
		# https://stackoverflow.com/a/23848087/5951529
		if process.platform is "win32"
			# Need quotes, that command run:
			command: '"batch/tidy-modify.bat"'
		else
			# Fix permission denied:
			# https://stackoverflow.com/a/46818913/5951529
			command: 'bash bash/tidy-modify.sh'
	tidyvalidate:
		if process.platform is "win32"
			command: '"batch/tidy-validate.bat"'
		else
			command: 'bash bash/tidy-validate.sh'


	############
	## covgen ##
	############
	# Generate Code of conduct for project:
	# https://contributor-covenant.org/
	# https://www.npmjs.com/package/covgen
	# [WARNING] Generate “CODE_OF_CONDUCT.md” for root folder:
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


	##########################
	## commitlint Travis CI ##
	##########################
	# Commit linting for Travis CI:
	# http://marionebl.github.io/commitlint/#/guides-ci-setup
	commitlint:
		command: 'commitlint-travis'


	###################
	## Travis Client ##
	###################
	# Lint “.travis.yml” file locally:
	# https://stackoverflow.com/a/35607499/5951529
	# https://rubygems.org/gems/travis
	# “-x” argument — exit code 1, if any warning:
	travislint:
		command: 'travis lint -x'


	##########
	# EClint #
	##########
	# Lint and fix files for EditorConfig rules:
	# https://www.npmjs.com/package/eclint
	# eclint doesn't search files and folders, that ignored in “.gitignore”:
	# https://github.com/jedmao/eclint/issues/80#issuecomment-314936365
	# “eclint infer” — show current statistic:
	# https://www.npmjs.com/package/eclint#infer
	# [WARNING] Another eclint check and fix methods doesn't work:
	# https://github.com/jedmao/eclint/issues/130
	# [WARNING] User can get different results for Windows and *NIX:
	# https://github.com/jedmao/eclint/issues/129#event-1574600632
	# [BUG] 2 blank lines in end of file “CODE_OF_CONDUCT.md”, needs fix it:
	# https://github.com/ContributorCovenant/contributor_covenant/issues/528
	eclintfix:
		command: "npx eclint fix CODE_OF_CONDUCT.md && cd <%= templates.paths.output_path %> \
					&& npx eclint fix && cd <%= templates.paths.cwd %>"
	eclintcheck:
		command: "cd <%= templates.paths.output_path %> && npx eclint check && cd <%= templates.paths.cwd %>"


	#####################
	# license-generator #
	#####################
	# Generate license:
	# https://www.npmjs.com/package/license-generator
	licensegenerator:
		command: "npx license-generator install mit -n \"Sasha Chernykh\""


	##############
	# ShellCheck #
	##############
	# Check “.sh” files:
	# https://www.shellcheck.net/
	shellcheck:
		if process.platform is "win32"
			command: '"batch/shellcheck.bat"'
		else
			command: 'bash bash/shellcheck.sh'


	###########
	# bashate #
	###########
	# Check “.sh” files:
	# https://docs.openstack.org/bashate/latest/readme
	bashate:
		if process.platform is "win32"
			command: '"batch/bashate.bat"'
		else
			command: 'bash bash/bashate.sh'


	#################
	# LocalAppVeyor #
	#################
	# Validate “appveyor.yml” file:
	# https://github.com/joaope/LocalAppVeyor
	# Get system environment variables:
	# https://stackoverflow.com/a/14089064/5951529
	# https://gruntjs.com/creating-tasks#cli-options-environment
	localappveyor:
		command: 'LocalAppVeyor lint --token <%= templates.tokens.api_key_appveyor %>'

#################
## grunt-shell ##
#################
###
[PURPOSE] Grunt plugin to run non-Grunt CLI commands.
https://www.npmjs.com/package/grunt-shell
###
module.exports =


	#############
	## Pelican ##
	#############
	###
	Build Pelican site:
	http://manos.im/blog/static-site-pelican-grunt-travis-github-pages/
	https://github.com/sindresorhus/grunt-shell

	[REQUIRED] “pipenv run”, that scripts from pipenv virtual environment successful run;
	for example, “pipenv run pelican --help”, not “pelican --help”.
	https://robots.thoughtbot.com/how-to-manage-your-python-projects-with-pipenv
	“--fatal” — exit(1), if any warning or error

	[INFO] Disable “--debug” flag due to too detailed output:
	https://app.travis-ci.com/github/Kristinita/KristinitaPelican/jobs/560440148#L624-L2274
	###
	generate:
		command: "pipenv run pelican content -s pelicanconf.py --fatal warnings"
	deploy:
		command: "pipenv run pelican content -s publishconf.py --fatal warnings"

	###
	[DEPRECATED] If “pipenv --update”, users have bug:
	https://github.com/pypa/pipenv/issues/1761
	# Update Pip and Pipenv
	pipenvupdate:
		command: 'pipenv --update'
	###


	############
	## pipenv ##
	############
	###
	[INFO] Update all Python Pipenv packages:
	https://stackoverflow.com/a/16269635/5951529
	https://github.com/jgonggrijp/pip-review#pip-review
	###
	pipenvupdateall:
		command: "pipenv run pip-review --auto"


	###
	[INFO] Clean unused packages:
	https://pipenv.pypa.io/en/latest/cli/#pipenv-clean

	[NOTE] So that “pipenv clean” doesn’t remove Python Markdown git extensions, you need install them in format:
	“pipenv install -e git+https://github.com/user/package_name.git#egg=package_name --dev”:
	https://pipenv.pypa.io/en/latest/basics/#a-note-about-vcs-dependencies
	https://github.com/pypa/pipenv/issues/1524

	This is “editable” format:
	http://pipenv.readthedocs.io/en/latest/basics/#editable-dependencies-e-g-e

	[NOTE] Use correct “package_name” for “editable” packages,
	so that “pipenv clean” doesn’t delete them:
	https://github.com/pypa/pipenv/issues/1524#issuecomment-695213982
	###
	pipenvcleanunused:
		command: "pipenv clean"

	###
	Update packages versions to the newest in “Pipfile.lock”, that:

	1. Another users have newest packages versions in their environment:
	2. Fix CI errors as https://travis-ci.org/Kristinita/KristinitaPelican/jobs/368968779#L658-L677
	https://docs.pipenv.org/basics/#example-pipenv-upgrade-workflow

	[INFO] Remove “--verbose” flag due to highly long details:
	https://app.travis-ci.com/github/Kristinita/KristinitaPelican/jobs/560271334#L736-L1277
	###
	pipenvupdatepipfilelock:
		command: "pipenv update"


	############
	## djLint ##
	############
	###
	[INFO] djLint — lint templates files (Jinja) for me
	https://www.djlint.com
	###
	djlint:
		command: "pipenv run djlint <%= templates.paths.theme %>/templates --lint"


	#########
	## git ##
	#########
	###
	Shrink .git folder
	https://stackoverflow.com/a/2116892/5951529
	Before: 568 MB — <https://i.imgur.com/aMvcfY1.png>
	After: 341 MB — <https://i.imgur.com/52cQ1AL.png>

	Remove reflog entries older, than 90 days:
	https://stackoverflow.com/a/3824970/5951529
	###
	gitreflog:
		command: "git reflog expire --all"

	###
	git gc
	https://stackoverflow.com/a/55738/5951529
	Prune loose objects older than 2 weeks ago:
	https://www.kernel.org/pub/software/scm/git/docgit-gc.html
	###
	gitgarbagecollector:
		command: "git gc --aggressive"


	###############
	## HTML Tidy ##
	###############
	###
	[OVERVIEW] Validate and fix HTML files:
	http://www.html-tidy.org/

	[INFO] Description:
	http://api.html-tidy.org/tidy/tidylib_api_next/index.html

	[OPTIONS]
	http://api.html-tidy.org/tidy/quickref_next.html
	###
	tidymodify:
		# [LEARN][GRUNT] Platform-specific tasks:
		# https://stackoverflow.com/a/23848087/5951529
		#
		# [NOTE][REQUIRED] Single-line comments after a colon; otherwise the error “unexpected_newline”:
		# https://travis-ci.com/github/Kristinita/KristinitaPelican/jobs/488737915#L1945
		if process.platform is "win32"
			# [INFO] Need quotes, that command run:
			command: '"batch/tidy-modify.bat"'
		else
			###
			[NOTE] Fix permission denied:
			https://stackoverflow.com/a/46818913/5951529
			###
			command: 'bash bash/tidy-modify.sh'
	tidyvalidate:
		if process.platform is "win32"
			command: '"batch/tidy-validate.bat"'
		else
			command: 'bash bash/tidy-validate.sh'


	############
	## covgen ##
	############
	###
	[OVERVIEW] Generate Code of conduct for project:
	https://contributor-covenant.org/
	https://www.npmjs.com/package/covgen

	[WARNING] Generate “CODE_OF_CONDUCT.md” for root folder:
	https://github.com/simonv3/covenant-generator/issues/15

	[WARNING] Unobfuscated plain text e-mail:
	https://github.com/ContributorCovenant/contributor_covenant/issues/523
	###


	#########
	## npx ##
	#########
	###
	[OVERVIEW] Execute npm CLI commands inside project:
	https://www.npmjs.com/package/npx
	https://medium.com/@maybekatz/introducing-npx-an-npm-package-runner-55f7d4bd282b
	https://stackoverflow.com/a/45164863/5951529

	[INFO] If the command doesn’t exist within the project, npx uses the command
	from the “PATH” environment variable
	###
	covgen:
		command: "npx covgen kristinita$cock.li"


	##################
	## pip-licenses ##
	##################
	###
	[OVERVIEW] Output licenses of all PyPI packages:
	https://pypi.org/project/pip-licenses/

	[OPTIONS]
	https://pypi.org/project/pip-licenses/#command-line-options
	###
	piplicenses:
		command: "pipenv run pip-licenses --with-authors --with-urls --with-description --format=markdown > pip-licenses.md"


	##########################
	## commitlint Travis CI ##
	##########################
	###
	[OVERVIEW] Commit linting for Travis CI:
	http://marionebl.github.io/commitlint/#/guides-ci-setup
	###
	commitlint:
		command: "commitlint-travis"


	###################
	## Travis Client ##
	###################
	###
	[ACTION] Lint “.travis.yml” file locally:
	https://stackoverflow.com/a/35607499/5951529
	https://rubygems.org/gems/travis

	[INFO] “-x” argument — exit code 1, if any warning:
	https://github.com/travis-ci/travis.rb#lint
	###
	travislint:
		command: "travis lint -x"


	##########
	# EClint #
	##########
	###
	[OVERVIEW] Lint and fix files use EditorConfig rules:
	https://www.npmjs.com/package/eclint

	eclint doesn't search files and folders, that ignored in “.gitignore”:
	https://github.com/jedmao/eclint/issues/80#issuecomment-314936365

	“eclint infer” — show current statistic:
	https://www.npmjs.com/package/eclint#infer

	[WARNING] Another eclint check and fix methods doesn't work:
	https://github.com/jedmao/eclint/issues/130

	[WARNING] User can get different results for Windows and *NIX:
	https://github.com/jedmao/eclint/issues/129#event-1574600632

	[BUG] 2 blank lines in end of file “CODE_OF_CONDUCT.md”, needs fix it:
	https://github.com/ContributorCovenant/contributor_covenant/issues/528
	###
	eclintfix:
		command: "npx eclint fix CODE_OF_CONDUCT.md && cd <%= templates.yamlconfig.OUTPUT_PATH %> \
					&& npx eclint fix && cd <%= templates.paths.cwd %>"
	eclintcheck:
		command: "cd <%= templates.yamlconfig.OUTPUT_PATH %> && npx eclint check && cd <%= templates.paths.cwd %>"


	#####################
	# license-generator #
	#####################
	###
	Generate license:
	https://www.npmjs.com/package/license-generator
	###
	licensegenerator:
		command: "npx license-generator install mit -n \"Sasha Chernykh\""


	##############
	# ShellCheck #
	##############
	###
	[OVERVIEW] Check “.sh” files:
	https://www.shellcheck.net/

	[INFO] ShellCheck pre-installed on Travis:
	https://github.com/koalaman/shellcheck#travis-ci

	[INFO] Scoop or Chocolatey installation required on Windows:
	https://github.com/koalaman/shellcheck#installing
	###
	shellcheck:
		if process.platform is "win32"
			command: '"batch/shellcheck.bat"'
		else
			command: 'bash bash/shellcheck.sh'


	###########
	# bashate #
	###########
	###
	Check “.sh” files:
	https://docs.openstack.org/bashate/latest/readme
	###
	bashate:
		if process.platform is "win32"
			command: '"batch/bashate.bat"'
		else
			command: 'bash bash/bashate.sh'


	#################
	# LocalAppVeyor #
	#################
	###
	[INFO] Validate “appveyor.yml” file:
	https://github.com/joaope/LocalAppVeyor

	[INFO] Get system environment variables:
	https://stackoverflow.com/a/14089064/5951529
	https://gruntjs.com/creating-tasks#cli-options-environment
	###
	localappveyor:
		command: "LocalAppVeyor lint --token <%= templates.tokens.api_key_appveyor %>"


	##########
	# remark #
	##########
	###
	[OVERVIEW] Remark — Markdown linter and formatter:
	https://remark.js.org/

	[INFO] CLI usage:
	https://www.npmjs.com/package/remark-cli

	[OPTIONS] https://github.com/unifiedjs/unified-args#cli


	[NOTE] Install “remark-cli”, not “remark” devDependency for using “shell:remark”

	[NOTE] Don’t use template <%= templates.paths.cwd %> in remark command.
	grunt-shell will run the command “Command: npx remark D:\Kristinita/*.md --silently-ignore --frail”
	and will not check any Markdown files.


	[REQUIRED][INFO] “--silently-ignore”. If no, remark will check all
	ignored files and spam the console with errors about each ignored file

	[INFO] “--frail” — build fail if any warning
	###
	remark:
		command: "npx remark **/*.md --silently-ignore --frail"

Title: For developers
Version: 0.0.3
Author: Sasha Chernykh
Lang: en
Summary: Information for developers about Kristinita's Search
Pagetitle: For developers
Metacontent: Information for developers about Kristinita's Search
Pagecolors: sasha-black-description
Asideimage: SashaInflatedSponges
Iconleftorright: right
Noco: 1QCqM6
Tooltipster: true
Clipboardjs: true
Og_image: https://i.imgur.com/2blY7dI.png

<!-- MarkdownTOC -->

1. [Unsupported](#Unsupported)
1. [Testing](#Testing)
1. [Devices and browsers](#Devices-and-browsers)
1. [Site building](#Site-building)
	1. [Demonstration](#Demonstration)
	1. [Pre-installation](#Pre-installation)
		1. [All operating systems](#All-operating-systems)
		1. [Windows](#Windows)
		1. [UNIX and macOS](#UNIX-and-macOS)
	1. [Installation](#Installation)
		1. [Environment variables](#Environment-variables)
			1. [PageSpeed Insights](#PageSpeed-Insights)
			1. [AppVeyor](#AppVeyor)
		1. [Windows](#Windows-1)
			1. [Terminal selection](#Terminal-selection)
			1. [Batch file](#Batch-file)
		1. [UNIX and macOS](#UNIX-and-macOS-1)
	1. [Build](#Build)
1. [Linting and validation](#Linting-and-validation)
	1. [General rules](#General-rules)
	1. [Glossary for table heading](#Glossary-for-table-heading)
		1. [Type](#Type)
		1. [Checking tool](#Checking-tool)
		1. [Rules description](#Rules-description)
		1. [Configuration file](#Configuration-file)
		1. [comments, issue](#comments-issue)
	1. [Validation table](#Validation-table)
		1. [Non-used tools](#Non-used-tools)

<!-- /MarkdownTOC -->

<a id="Unsupported"></a>
# Unsupported

Developer of this site doesn't support:

<!-- [FIXME] Fuck old browser -->

1. Older than 2 last version of each browser
1. [Any versions](https://www.quora.com/Is-Internet-Explorer-really-as-bad-as-everyone-tries-to-make-out) of [Internet Explorer](https://www.lifewire.com/why-do-people-hate-internet-explorer-3485786)
1. [JavaScript turn off](https://www.reddit.com/r/webdev/comments/48z7jz/do_you_take_into_account_those_who_disable/d0nxftd/)
1. [32-bit Windows](https://www.howtogeek.com/56701/htg-explains-whats-the-difference-between-32-bit-and-64-bit-windows-7/)

<a id="Testing"></a>
# Testing

Site tested via [BrowserStack](https://www.browserstack.com) on these latest devices and latest browsers version at January 2019:

+ macOS Mojave, Safari 12.0
+ [Windows 10 64-bit](https://www.browserstack.com/question/621)
	+ Firefox
	+ Opera
	+ Edge
	+ Chrome
+ iPhone XS Max
+ iPad Pro 12.9.2018
	+ ([iOS and Safari](https://www.lifewire.com/check-the-version-number-of-safari-446563)) 12
+ Samsung Galaxy S9 Plus, Chrome

<a id="Devices-and-browsers"></a>
# Devices and browsers

2 latest stable versions of these browsers:

+ Firefox
+ Opera
+ Safari
+ Chrome

<a id="Site-building"></a>
# Site building

<a id="Demonstration"></a>
## Demonstration

1. [AppVeyor](https://ci.appveyor.com/project/Kristinita/kristinitapelican/build/1.0.8/job/xupi280mw74lrnnx),
1. [Travis CI](https://travis-ci.org/Kristinita/KristinitaPelican/jobs/360627297).

<a id="Pre-installation"></a>
## Pre-installation

You must install in your machine latest versions:

<a id="All-operating-systems"></a>
### All operating systems

+ Python 3,
+ Node.js,
+ Git (even if you use another VCS).

<a id="Windows"></a>
### Windows

+ [Chocolatey](https://chocolatey.org/install#installing-chocolatey).

<a id="UNIX-and-macOS"></a>
### UNIX and macOS

+ [GNU Parallel](https://askubuntu.com/a/634835/582218),
+ [HTML Tidy](https://codeyarns.com/2016/06/06/how-to-build-and-install-html-tidy/).

<a id="Installation"></a>
## Installation

<a id="Environment-variables"></a>
### Environment variables

<a id="PageSpeed-Insights"></a>
#### PageSpeed Insights

[Get PageSpeed Insights API key](https://developers.google.com/speed/docs/insights/v5/get-started#key)

Add environment variable to your local PC:

+ Windows:

```batch
SETX API_KEY_PAGESPEED_INSIGHTS_V5 your_token
```

+ Linux:

```bash
export API_KEY_PAGESPEED_INSIGHTS_V5 your_token
```

Replace *your_token* to token, that you get.

<a id="AppVeyor"></a>
#### AppVeyor

Get [AppVeyor API token](https://www.appveyor.com/docs/api/). Register on AppVeyor, if already no → <https://ci.appveyor.com/api-keys> → *API keys* → *Generate new API token* → copy your token.

![AppVeyor token](https://i.imgur.com/WiFtUMD.png)

Add environment variable to your local PC:

+ Windows:

```batch
SETX API_KEY_APPVEYOR your_token
```

+ Linux:

```bash
export API_KEY_APPVEYOR your_token
```

Replace *your_token* to token, that you get.

<!-- [FIXME] gtools — https://github.com/chocolatey/chocolatey-package-requests/issues/532  -->

!!! warning
	Windows users needs also manually add path to *LocalAppVeyor.exe* — *%USERPROFILE%/.dotnet/tools* — as value of *PATH* environment variable. Use [Rapid Environment Editor](https://ru.stackoverflow.com/a/596341/199934) or [pathed](http://www.p-nand-q.com/download/gtools/pathed.html). Don't use *SETX*, [you can lose](https://stackoverflow.com/a/28778358/5951529) your *PATH* data.

<a id="Windows-1"></a>
### Windows

<a id="Terminal-selection"></a>
#### Terminal selection

Run batch file below from:

1. File Explorer or [alternatives](https://alternativeto.net/software/windows-explorer/?license=opensource&platform=windows),
1. Default Windows console (*cmd.exe*),
1. Your preferred terminal, if you sure, that [refreshenv](https://stackoverflow.com/a/32420542/5951529) update your environment variables for current session or terminal update them automatically.

In Far Manager you need <kbd>F9</kbd> → *Options* → *System settings* → mark settings *Automatic update of environment variables* and *Auto save setup*.

![Far Manager](https://i.imgur.com/2blY7dI.png)

Environment variables will update automatically in current session, but that apply updated environment variables for another session, you need to make [another actions](https://github.com/FarGroup/FarManager/issues/31).

<a id="Batch-file"></a>
#### Batch file

**Try** run this batch file:

```batch
SETX PIPENV_VENV_IN_PROJECT 1
SETX PIPENV_IGNORE_VIRTUALENVS 1
SETX DOTNET_CLI_TELEMETRY_OPTOUT 1
CALL RefreshEnv.cmd
git clone --depth=1 --branch=master https://github.com/Kristinita/KristinitaPelican.git
CD KristinitaPelican
START /B CMD /C "choco install phantomjs html-tidy -y -ignoredependencies"
START /B CMD /C "python -m pip install --upgrade pip & pip install pipenv & pipenv install --dev"
START /B CMD /C "npm install -g grunt-cli & npm install"
```

**Except** [*pexpect.exceptions.TIMEOUT*](https://github.com/pypa/pipenv/issues/65):

\ \ \ \ install all sequentially:

```batch
SETX PIPENV_VENV_IN_PROJECT 1
SETX PIPENV_IGNORE_VIRTUALENVS 1
SETX DOTNET_CLI_TELEMETRY_OPTOUT 1
SETX path "%path%;D:\Kristinita"
CALL RefreshEnv.cmd
git clone --depth=1 --branch=master https://github.com/Kristinita/KristinitaPelican.git
CD KristinitaPelican
choco install phantomjs html-tidy -y -ignoredependencies
python -m pip install --upgrade pip
pip install pipenv
pipenv install --dev
npm install -g grunt-cli
npm install
```

See comments to the script in files:

+ [appveyor.yml](https://github.com/Kristinita/KristinitaPelican/blob/master/appveyor.yml),
+ [appveyor-install.bat](https://github.com/Kristinita/KristinitaPelican/blob/master/ci/appveyor-install.bat).

<a id="UNIX-and-macOS-1"></a>
### UNIX and macOS

**Try** run this shell file:

```shell
export PIPENV_VENV_IN_PROJECT=1
export PIPENV_IGNORE_VIRTUALENVS=1
export DOTNET_CLI_TELEMETRY_OPTOUT=1
PATH=$PATH:$HOME/.dotnet/tools
git clone --depth=1 --branch=master https://github.com/Kristinita/KristinitaPelican.git
cd KristinitaPelican
wait
parallel ::: 'pip install --upgrade pip && pip install pipenv && pipenv install --dev' \
				'npm install --global npm && npm install -g grunt-cli phantomjs-prebuilt && npm install'
```

**Except** [*pexpect.exceptions.TIMEOUT*](https://github.com/pypa/pipenv/issues/65):

\ \ \ \ install all sequentially:

```shell
export PIPENV_VENV_IN_PROJECT=1
export PIPENV_IGNORE_VIRTUALENVS=1
export DOTNET_CLI_TELEMETRY_OPTOUT=1
PATH=$PATH:$HOME/.dotnet/tools
git clone --depth=1 --branch=master https://github.com/Kristinita/KristinitaPelican.git
cd KristinitaPelican
wait
pip install --upgrade pip
pip install pipenv
pipenv install --dev
npm install --global npm
npm install -g grunt-cli phantomjs-prebuilt
npm install
```

See comments to the script in files:

+ [.travis.yml](https://github.com/Kristinita/KristinitaPelican/blob/master/.travis.yml),
+ [travis-install.sh](https://github.com/Kristinita/KristinitaPelican/blob/master/ci/travis-install.sh).

<a id="Build"></a>
## Build

For build site run in *KristinitaPelican* folder:

Development site version:

```markdown
grunt
```

Production version:

```markdown
grunt publish
```

See comments in [files of *grunt* folder](https://github.com/Kristinita/KristinitaPelican/tree/master/grunt).

<a id="Linting-and-validation"></a>
# Linting and validation

**All original files and commits of Sasha Chernykh repositories must be 100% valid.**

Please, consider this, if you make a pull request.

“Original” — not from third-party frameworks, libraries, packages, scripts and so on. I'm not responsible, if third-party files not valid.

<a id="General-rules"></a>
## General rules

Accept for all files, if no exceptions.

1. [Tabs, not spaces](https://softwareengineering.stackexchange.com/a/2037/264224)
1. [Indent size — 4](https://www.quora.com/Why-do-most-developers-prefer-indenting-code-with-2-spaces-instead-of-a-tab/answer/David-Toomey)
1. [Line lenght — 120 in syntaxes, where needed](https://stackoverflow.com/a/111015/5951529)
1. [Syntactic sugar](https://www.computerhope.com/jargon/s/syntactic-sugar.htm) welcome

<a id="Glossary-for-table-heading"></a>
## Glossary for table heading

For validating table below.

<a id="Type"></a>
### Type

If in this column name of markup or programming language — I mean files, specific for this language.

Example:

+ *Python* — check all files with *.py* extension
+ *Markdown* — all files with *.md*, *.mdown* and *.markdown* extensions

<a id="Checking-tool"></a>
### Checking tool

Checking/linting/validating tool.

<a id="Rules-description"></a>
### Rules description

Link(s) to detailed description of checking tool rules.

<a id="Configuration-file"></a>
### Configuration file

File for checking tool, if I use non-default rules.

For **each** custom option I add comment, why I doesn't use default option.

If *—* symbol in this column, I use default checking tool configuration.

<a id="comments-issue"></a>
### comments, issue

Some linters use JSON for configuration files (I think, [this is bad](https://arp242.net/weblog/json_as_configuration_files-_please_dont)) \+ [JSON doesn't support comments](https://plus.google.com/+DouglasCrockfordEsq/posts/RK8qyGVaGSr) → I can't use comments in JSON configuration files. In these cases I add *comments* and *issue* links to *Configuration file* section.

+ *comments* — file, where comments about options in configuration JSON file
+ *issue* — feature request for support non-JSON configuration format

<a id="Validation-table"></a>
## Validation table

For all Sasha Chernykh projects:

[jtable]
Type|Checking tool|Rules description|Configuration file
English language|[write-good](https://www.npmjs.com/package/write-good) + [remark-lint-write-good](https://www.npmjs.com/package/remark-lint-write-good)|[1](https://github.com/Kristinita/write-good/tree/SashaGoddess#checks), WARNING — [no in default repository](https://github.com/btford/write-good/pull/65)|[.remarkrc.yaml](https://github.com/Kristinita/KristinitaPelican/blob/master/.remarkrc.yaml)
commits|[commitlint](http://marionebl.github.io/commitlint/) + [Husky](https://www.npmjs.com/package/husky)|[1](http://marionebl.github.io/commitlint/#/reference-rules), WARNING — [no default levels for rules](https://github.com/marionebl/commitlint/issues/316#issuecomment-385708769)|[.commitlintrc.yml](https://github.com/Kristinita/KristinitaPelican/blob/master/.commitlintrc.yml), [.huckyrc.yml](https://github.com/Kristinita/KristinitaPelican/blob/master/.huskyrc.yml)
all files and folders names|[grunt-path-validator](https://www.npmjs.com/package/grunt-path-validator) (for Grunt projects, I can't find tool for all project types)|no whitespace characters in names — it accept in files/folder naming conventions — [1](https://superuser.com/q/29111/572069), [2](https://portal.slac.stanford.edu/sites/inc_public/Pages/folder-file-names.aspx), [3](https://www.reddit.com/r/linux/comments/1kpzxz/what_are_your_file_naming_conventions/), [4](https://www2.le.ac.uk/services/research-data/organise-data/naming-files), [5](https://library.stanford.edu/research/data-management-services/data-best-practices/best-practices-file-naming)|[path_validator.coffee](https://github.com/Kristinita/KristinitaPelican/blob/master/grunt/path_validator.coffee) (for Grunt projects, I can't find tool for all project types)
all files|[EditorConfig](http://editorconfig.org/)|[1](https://github.com/editorconfig/editorconfig/wiki/EditorConfig-Properties)|[.editorconfig](https://github.com/Kristinita/KristinitaPelican/blob/master/.editorconfig)
supported browsers|[Browserslist](https://www.npmjs.com/package/browserslist)|[1](https://github.com/browserslist/browserslist#queries)|[browserslist](https://github.com/Kristinita/KristinitaPelican/blob/master/browserslist)
browsers console errors|[clean-console](https://www.npmjs.com/package/clean-console)|No errors in browsers console|[clean-console.coffee](https://github.com/Kristinita/KristinitaPelican/blob/master/grunt/clean-console.coffee)
site performance|[PageSpeed Insights](https://developers.google.com/speed/pagespeed/insights/)|[1](https://developers.google.com/web/tools/lighthouse/)|—
Python|[Flake8](http://flake8.pycqa.org/en/latest/)|[1](http://flake8.pycqa.org/en/latest/user/configuration.html)|[.flake8](https://github.com/Kristinita/KristinitaPelican/blob/master/.flake8)
Python|[pydocstyle](http://www.pydocstyle.org/en/latest/usage.html)|[1](http://www.pydocstyle.org/en/latest/usage.html#configuration-files)|—
Markdown|[Markdownlint](https://www.npmjs.com/package/markdownlint)|[1](https://github.com/DavidAnson/markdownlint/blob/master/doc/Rules.md)|[.markdownlint.yaml](https://github.com/Kristinita/KristinitaPelican/blob/master/.markdownlint.yaml)
Markdown|[remark](https://remark.js.org/)|[1](https://github.com/remarkjs/remark-lint/blob/master/doc/rules.md#list-of-rules), [2](https://github.com/remarkjs/remark-lint#list-of-external-rules)|[.remarkrc.yaml](https://github.com/Kristinita/KristinitaPelican/blob/master/.remarkrc.yaml)
HTML, CSS, JavaScript (not minified)|[JS Beautifier](http://jsbeautifier.org/)|[1](https://www.npmjs.com/package/js-beautify#options)|[.jsbeautifyrc](https://github.com/Kristinita/KristinitaPelican/blob/master/.jsbeautifyrc), [comments](https://github.com/Kristinita/KristinitaPelican/blob/master/grunt/jsbeautifier.coffee), [issue](https://github.com/beautify-web/js-beautify/issues/1181)
HTML|[The Nu Html Checker](https://validator.github.io/validator)|[no regulated rules list](https://stackoverflow.com/a/35646026/5951529)|—
HTML|[HTML Tidy](http://www.html-tidy.org/)|[1](http://api.html-tidy.org/tidy/tidylib_api_next/tidy_config.html)|[tidy.conf](https://github.com/Kristinita/KristinitaPelican/blob/master/tidy.conf)
HTML|[htmllint](http://htmllint.github.io/)|[1](https://github.com/htmllint/htmllint/wiki/Options)|[.htmllintrc](https://github.com/Kristinita/KristinitaPelican/blob/master/.htmllintrc), [comments](https://github.com/Kristinita/KristinitaPelican/blob/master/grunt/htmllint.coffee), [issue](https://github.com/htmllint/htmllint/issues/244)
HTML|[HTMLHint](https://htmlhint.io/)|[1](https://github.com/htmlhint/HTMLHint/wiki/Rules)||[.htmlhintrc](https://github.com/Kristinita/KristinitaPelican/blob/master/.htmllintrc), [comments](https://github.com/Kristinita/KristinitaPelican/blob/master/grunt/htmlhint.coffee), [issue](https://github.com/htmlhint/HTMLHint/issues/126)
Stylus|[Stylint](https://simenb.github.io/stylint/)|[1](https://www.npmjs.com/package/stylint#excluding-files-directories-and-code-blocks-from-the-linter)|[.stylintrc](https://github.com/Kristinita/KristinitaPelican/blob/master/.stylintrc), [comments](https://github.com/Kristinita/KristinitaPelican/blob/master/grunt/stylint.coffee), [issue](https://github.com/SimenB/stylint/issues/434)
CSS|[doiuse](https://doiuse.herokuapp.com/)|[1](https://caniuse.com/)|[browserslist](https://github.com/Kristinita/KristinitaPelican/blob/master/browserslist)
CoffeeScript|[CoffeeLint](http://www.coffeelint.org/)|[1](http://www.coffeelint.org/#options)|[coffeelint.json](https://github.com/Kristinita/KristinitaPelican/blob/master/coffeelint.json), [comments](https://github.com/Kristinita/KristinitaPelican/blob/master/grunt/coffeelint.coffee), [issue](https://github.com/clutchski/coffeelint/issues/638)
Bash|[ShellCheck](https://www.shellcheck.net/)|[1](https://github.com/koalaman/shellcheck/wiki)|—
Bash|[bashate](https://docs.openstack.org/bashate/latest/readme)|[1](https://docs.openstack.org/bashate/latest/readme#currently-supported-checks)|[bashate.sh](https://github.com/Kristinita/KristinitaPelican/blob/master/bash/bashate.sh) ([no configuration file for bashate](https://bugs.launchpad.net/bash8/+bug/1395391))
YAML|[yamllint](http://yamllint.readthedocs.io/en/latest/)|[1](http://yamllint.readthedocs.io/en/latest/configuration.html)|[.yamllint](https://github.com/Kristinita/KristinitaPelican/blob/master/.yamllint)
.travis.yml|[Travis CI Client](https://github.com/travis-ci/travis.rb#lint)|[1](https://docs.travis-ci.com/user/customizing-the-build)|—
appveyor.yml|[LocalAppVeyor](https://github.com/joaope/LocalAppVeyor#-lint-command)|[1](https://www.appveyor.com/docs/appveyor-yml/)|—
[/jtable]

<a id="Non-used-tools"></a>
### Non-used tools

In this section checking/linting/validation tools, that I don't use. Required argumentation.

[jtable]
Type|Checking tool|Argumentation
Python|[Python Black](https://github.com/ambv/black)|Vertical spaces format to one line ([example](https://github.com/ambv/black/issues/118#issuecomment-385318504)); author “[hate options](https://github.com/ambv/black/issues/181#issuecomment-385326100)”
[/jtable]

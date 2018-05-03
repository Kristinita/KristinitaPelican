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
Visualize: false
Opengraphimage: https://i.imgur.com/2blY7dI.png

<!-- MarkdownTOC -->

1. [Demonstration](#demonstration)
1. [Pre-installation](#pre-installation)
	1. [All operating systems](#all-operating-systems)
	1. [Windows](#windows)
	1. [UNIX and macOS](#unix-and-macos)
1. [Installation](#installation)
	1. [Windows](#windows-1)
		1. [Terminal selection](#terminal-selection)
		1. [Batch file](#batch-file)
	1. [UNIX and macOS](#unix-and-macos-1)
1. [Build](#build)
1. [Linting and validation](#linting-and-validation)
	1. [Glossary for table heading](#glossary-for-table-heading)
		1. [Type](#type)
		1. [Checking tool](#checking-tool)
		1. [Rules description](#rules-description)
		1. [Configuration file](#configuration-file)
	1. [Validation table](#validation-table)
		1. [Non-used tools](#non-used-tools)

<!-- /MarkdownTOC -->

<a id="demonstration"></a>
# Demonstration

1. [AppVeyor](https://ci.appveyor.com/project/Kristinita/kristinitapelican/build/1.0.8/job/xupi280mw74lrnnx),
1. [Travis CI](https://travis-ci.org/Kristinita/KristinitaPelican/jobs/360627297).

<a id="pre-installation"></a>
# Pre-installation

You must install in your machine latest versions:

<a id="all-operating-systems"></a>
## All operating systems

+ Python 3,
+ Node.js,
+ Git (even if you use another VCS).

<a id="windows"></a>
## Windows

+ [Chocolatey](https://chocolatey.org/install#installing-chocolatey).

<a id="unix-and-macos"></a>
## UNIX and macOS

+ [GNU Parallel](https://askubuntu.com/a/634835/582218),
+ [HTML Tidy](https://codeyarns.com/2016/06/06/how-to-build-and-install-html-tidy/).

<a id="installation"></a>
# Installation

<a id="windows-1"></a>
## Windows

<a id="terminal-selection"></a>
### Terminal selection

Run batch file below from:

1. File Explorer or [alternatives](https://alternativeto.net/software/windows-explorer/?license=opensource&platform=windows),
1. Default Windows console (*cmd.exe*),
1. Your preferred terminal, if you sure, that [refreshenv](https://stackoverflow.com/a/32420542/5951529) update your environment variables for current session or environment variables are updated for current session automatically.

In Far Manager you need <kbd>F9</kbd> → *Options* → *System settings* → mark settings *Automatic update of environment variables* and *Auto save setup*.

![Far Manager](https://i.imgur.com/2blY7dI.png)

Environment variables will update automatically in current session, but that apply updated environment variables for another session, you need to make [another actions](https://github.com/FarGroup/FarManager/issues/31).

<a id="batch-file"></a>
### Batch file

**Try** run this batch file:

```batch
SETX PIPENV_VENV_IN_PROJECT 1
CALL RefreshEnv.cmd
git clone --depth=1 --branch=master https://github.com/Kristinita/KristinitaPelican.git
CD KristinitaPelican
START /B CMD /C "choco install html-tidy -y -ignoredependencies"
START /B CMD /C "python -m pip install --upgrade pip & pip install pipenv & pipenv install --dev"
START /B CMD /C "npm install -g grunt-cli & npm install"
```

**Except** [*pexpect.exceptions.TIMEOUT*](https://github.com/pypa/pipenv/issues/65):

\ \ \ \ install all sequentially:

```batch
SETX PIPENV_VENV_IN_PROJECT 1
CALL RefreshEnv.cmd
git clone --depth=1 --branch=master https://github.com/Kristinita/KristinitaPelican.git
CD KristinitaPelican
choco install html-tidy -y -ignoredependencies
python -m pip install --upgrade pip
pip install pipenv
pipenv install --dev
npm install -g grunt-cli
npm install
```

See comments to the script in files:

+ [appveyor.yml](https://github.com/Kristinita/KristinitaPelican/blob/master/appveyor.yml),
+ [appveyor-install.bat](https://github.com/Kristinita/KristinitaPelican/blob/master/ci/appveyor-install.bat).

<a id="unix-and-macos-1"></a>
## UNIX and macOS

**Try** run this shell file:

```shell
export PIPENV_VENV_IN_PROJECT=1
git clone --depth=1 --branch=master https://github.com/Kristinita/KristinitaPelican.git
cd KristinitaPelican
wait
parallel ::: 'pip install --upgrade pip && pip install pipenv && pipenv install --dev' \
				'npm install --global npm && npm install -g grunt-cli && npm install'
```

**Except** [*pexpect.exceptions.TIMEOUT*](https://github.com/pypa/pipenv/issues/65):

\ \ \ \ install all sequentially:

```shell
export PIPENV_VENV_IN_PROJECT=1
git clone --depth=1 --branch=master https://github.com/Kristinita/KristinitaPelican.git
cd KristinitaPelican
wait
pip install --upgrade pip
pip install pipenv
pipenv install --dev
npm install --global npm
npm install -g grunt-cli
npm install
```

See comments to the script in files:

+ [.travis.yml](https://github.com/Kristinita/KristinitaPelican/blob/master/.travis.yml),
+ [travis-install.sh](https://github.com/Kristinita/KristinitaPelican/blob/master/ci/travis-install.sh).

<a id="build"></a>
# Build

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

<a id="linting-and-validation"></a>
# Linting and validation

**All original files and commits of Sasha Chernykh repositories must be 100% valid.**

Please, consider this, if you make a pull request.

“Original” — not from third-party frameworks, libraries, packages, scripts and so on. I'm not responsible, if third-party files not valid.

<a id="glossary-for-table-heading"></a>
## Glossary for table heading

For validating table below.

<a id="type"></a>
### Type

Type of object.

If in this column name of markup or programming language — I mean files, specific for this language.

Example:

+ *Python* — check all files with *.py* extension
+ *Markdown* — all files with *.md*, *.mdown* and *.markdown* extensions

<a id="checking-tool"></a>
### Checking tool

Checking/linting/validating tool.

<a id="rules-description"></a>
### Rules description

Link(s) to detailed description of checking tool rules.

<a id="configuration-file"></a>
### Configuration file

File for checking tool, if I use non-default rules.

For **each** custom option I add comment, why I doesn't use default option.

If *—* symbol in this column, I use default checking tool configuration.

<a id="validation-table"></a>
## Validation table

For all Sasha Chernykh projects:

[jtable]
Type|Checking tool|Rules description|Configuration file
commits|[commitlint](http://marionebl.github.io/commitlint/)|[1](http://marionebl.github.io/commitlint/#/reference-rules), WARNING — [no default levels for rules](https://github.com/marionebl/commitlint/issues/316#issuecomment-385708769)|[.commitlintrc.yml](https://github.com/Kristinita/KristinitaPelican/blob/master/.commitlintrc)
all files and folders names|[grunt-path-validator](https://www.npmjs.com/package/grunt-path-validator) (for Grunt projects, I can't find tool for all project types)|no whitespace characters in names — it accept in files/folder naming conventions — [1](https://superuser.com/q/29111/572069), [2](https://portal.slac.stanford.edu/sites/inc_public/Pages/folder-file-names.aspx), [3](https://www.reddit.com/r/linux/comments/1kpzxz/what_are_your_file_naming_conventions/), [4](https://www2.le.ac.uk/services/research-data/organise-data/naming-files), [5](https://library.stanford.edu/research/data-management-services/data-best-practices/best-practices-file-naming)|[path_validator.coffee](https://github.com/Kristinita/KristinitaPelican/blob/master/grunt/path_validator.coffee) (for Grunt projects, I can't find tool for all project types)
all files|[EditorConfig](http://editorconfig.org/)|[1](https://github.com/editorconfig/editorconfig/wiki/EditorConfig-Properties)|[.editorconfig](https://github.com/Kristinita/KristinitaPelican/blob/master/.editorconfig)
supported browsers|[Browserslist](https://github.com/browserslist/browserslist)|[1](https://github.com/browserslist/browserslist#queries)|[browserslist](https://github.com/Kristinita/KristinitaPelican/blob/master/browserslist)
Python|[Flake8](http://flake8.pycqa.org/en/latest/)|[1](http://flake8.pycqa.org/en/latest/user/configuration.html)|[.flake8](https://github.com/Kristinita/KristinitaPelican/blob/master/.flake8)
Python|[pydocstyle](http://www.pydocstyle.org/en/latest/usage.html)|[1](http://www.pydocstyle.org/en/latest/usage.html#configuration-files)|—
Markdown|[Markdownlint](https://www.npmjs.com/package/markdownlint)|[1](https://github.com/DavidAnson/markdownlint/blob/master/doc/Rules.md)|[.markdownlint.yaml](https://github.com/Kristinita/KristinitaPelican/blob/master/.markdownlint.yaml)
HTML|[HTML Tidy](http://www.html-tidy.org/)|[1](http://api.html-tidy.org/tidy/tidylib_api_next/tidy_config.html)|—
CoffeeScript|[CoffeeLint](http://www.coffeelint.org/)|[1](http://www.coffeelint.org/#options)|[coffeelint.json](https://github.com/Kristinita/KristinitaPelican/blob/master/coffeelint.json) (comments in [coffeelint.coffee](https://github.com/Kristinita/KristinitaPelican/blob/master/grunt/coffeelint.coffee), because [JSON doesn't support them](https://github.com/clutchski/coffeelint/issues/638))
Bash|[ShellCheck](https://www.shellcheck.net/)|[1](https://github.com/koalaman/shellcheck/wiki)|—
YAML|[yamllint](http://yamllint.readthedocs.io/en/latest/)|[1](http://yamllint.readthedocs.io/en/latest/configuration.html)|[.yamllint](https://github.com/Kristinita/KristinitaPelican/blob/master/.yamllint)
.travis.yml|[Travis CI Client](https://github.com/travis-ci/travis.rb#lint)|[1](https://docs.travis-ci.com/user/customizing-the-build)|—
[/jtable]

<a id="non-used-tools"></a>
### Non-used tools

In this section checking/linting/validation tools, that I don't use. Required argumentation.

[jtable]
Type|Checking tool|Argumentation
Python|[Python Black](https://github.com/ambv/black)|Vertical spaces format to one line ([example](https://github.com/ambv/black/issues/118#issuecomment-385318504)); author “[hate options](https://github.com/ambv/black/issues/181#issuecomment-385326100)”
[/jtable]

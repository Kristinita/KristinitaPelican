Title: For developers
Version: 0.0.1
Author: Sasha Chernykh
Lang: en
Summary: Information for developers about Kristinita's Search
Pagetitle: For developers
Metacontent: Information for developers about Kristinita's Search
Pagecolors: sasha-black
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

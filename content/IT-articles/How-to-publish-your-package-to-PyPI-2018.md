Title: How to publish your package to PyPI, 2018
Version: 0.1.0
Author: Sasha Chernykh
Lang: en
Summary: Tutorial, how you can publish your Python package to PyPI: <br><br> ![Erichek on pypi.python.org](https://i.imgur.com/IzSH7BK.png) <br><br> ![Erichek on pypi.org](https://i.imgur.com/4P3w8TP.png) <br><br> ![Erichek on pypi.org 2](https://i.imgur.com/IxsUDu4.png)
Pagetitle: How to publish your package to PyPI, 2018
Metacontent: Tutorial, how you can publish your Python package to PyPI
Pagecolors: it-articles
Asideimage: SashaGreenSweater
Iconleftorright: left
Tags: it-articles, python, pypi, release
Category: IT-Articles
Noco: 1vWK5
Tooltipster: true
Clipboardjs: true
Opengraphimage: https://i.imgur.com/mO0Fnsk.jpg
Customjs: false
Customcss: false

<!-- MarkdownTOC -->

1. [Overview](#overview)
1. [Audience](#audience)
1. [Relevance](#relevance)
1. [Motivation](#motivation)
1. [Demonstration](#demonstration)
1. [Features](#features)
1. [Limitations](#limitations)
1. [Installation](#installation)
1. [Configuration](#configuration)
	1. [Files](#files)
	1. [&#95;&#95;init&#95;&#95;.py](#9595init9595py)
	1. [License](#license)
	1. [README](#readme)
		1. [README.md](#readmemd)
		1. [README.rst](#readmerst)
	1. [setup.cfg](#setupcfg)
		1. [long_description](#long_description)
		1. [classifiers](#classifiers)
		1. [zip_safe](#zip_safe)
		1. [packages](#packages)
		1. [console_scripts](#console_scripts)
		1. [bdist_wheel](#bdist_wheel)
	1. [Dependencies](#dependencies)
		1. [Difference between requirements.txt and install_requires](#difference-between-requirementstxt-and-install_requires)
			1. [install_requires](#install_requires)
			1. [requirements.txt](#requirementstxt)
		1. [setup.py](#setuppy)
		1. [requirements.txt](#requirementstxt-1)
		1. [MANIFEST.in](#manifestin)
	1. [pyroma](#pyroma)
1. [TestPyPI](#testpypi)
	1. [What is TestPyPI](#what-is-testpypi)
	1. [Registration](#registration)
	1. [Twine settings](#twine-settings)
	1. [Build package](#build-package)
	1. [Publish to TestPyPI](#publish-to-testpypi)
	1. [Visit TestPyPI](#visit-testpypi)
	1. [virtualenv](#virtualenv)
		1. [Why virtual environment?](#why-virtual-environment)
		1. [Using virtualenv and virtualenvwrapper](#using-virtualenv-and-virtualenvwrapper)
		1. [Checking](#checking)
1. [PyPI](#pypi)
1. [Updating](#updating)
1. [Automatic updating, release and changelog](#automatic-updating-release-and-changelog)
	1. [Demonstration](#demonstration-1)
	1. [Features](#features-1)
	1. [Limitations](#limitations-1)
	1. [Installation and setting-up](#installation-and-setting-up)
		1. [.release-it.json](#release-itjson)
	1. [Usage](#usage)
1. [Testing environment](#testing-environment)

<!-- /MarkdownTOC -->

<a id="overview"></a>
# Overview

Tutorial, how you can add your Python package to [PyPI — Python Package Index](https://en.wikipedia.org/wiki/Python_Package_Index).

If you want, that users install your Python [package](https://stackoverflow.com/a/7948504/5951529) via command:

```shell
pip install <your_package>
```

Read this article.

!!! info
	In this article I wrote the most common method at February 2018. But you can consider another tools as [flit](https://github.com/takluyver/flit) and [poet](https://github.com/sdispater/poet).

<a id="audience"></a>
# Audience

Python developers, that:

1. publish package to PyPI first time,
1. already published packages to PyPI, but want to do it more qualitatively.

<a id="relevance"></a>
# Relevance

This article is relevant for February 2018. In the future, the data in this article may be obsolete.

<a id="motivation"></a>
# Motivation

One more article? Why?

I read some articles about PyPI publishing → I think, that articles, which I read, have disadvantages:

1. outdated;
1. not show real examples and demonstrations;
1. not all-in-one; I was forced to read other resources;
1. They do not describe all the difficulties the developer has encountered, when try to publish package on PyPI.

I don't want, that another beginner Python developers take a lot of time for PyPI publishing as me. And I try to write an article, that:

1. non-outdated at February 2018;
1. show examples and demos;
1. all-in-one; I try to add in my article all information, that I need for first PyPI publishing;
1. described all problems, to solve that personally I spent my time.

<a id="demonstration"></a>
# Demonstration

For examples in this article, I select my Erichek package.

<https://pypi.python.org/pypi/erichek> page at February 2018:

![Erichek on pypi.python.org](https://i.imgur.com/yzNSQNm.png)

<https://pypi.org/project/erichek> [Warehouse](https://pyfound.blogspot.com/2018/02/python-package-maintainers-help-test.html) page at February 2018:

![Erichek on pypi.org](https://i.imgur.com/DjMYPrP.png)

![Erichek on pypi.org 2](https://i.imgur.com/rdfBR5j.png)

You can install Erichek, use command:

```shell
pip install erichek
```

If you want to have similar behavior, read on.

If I have explained something incomprehensibly, see files of [Erichek GitHub repository](https://github.com/Kristinita/Erichek).

<a id="features"></a>
# Features

1. This article — cross platform solution.

<a id="limitations"></a>
# Limitations

1. You must be able to write working Python packages.
1. Erichek and another my packages only for Python 3. I don't want support Python 2. If you want support Python 2, possibly, you will need some other action.
1. If you can have a configuration different, that Erichek, possibly, you will need in another actions.

<a id="installation"></a>
# Installation

Please, install via pip (*pip install &lt;package&gt;*):

1. [twine](https://github.com/pypa/twine),
1. [wheel](https://pypi.python.org/pypi/wheel),
1. [virtualenv](https://virtualenv.pypa.io/en/stable/),
1. [virtualenvwrapper](https://virtualenvwrapper.readthedocs.io/) for Linux/macOS, [virtualenvwrapper-win](https://pypi.python.org/pypi/virtualenvwrapper-win) for Windows,
1. [pyroma](https://pypi.python.org/pypi/pyroma/),
1. update your [setuptools](https://pypi.python.org/pypi/setuptools), to be sure, that [pyroma works correct](https://github.com/regebro/pyroma/issues/16) — `pip install -U setuptools`.

<a id="configuration"></a>
# Configuration

<a id="files"></a>
## Files

Simplify configuration. Real project configuration see in [Erichek GitHub repository](https://github.com/Kristinita/Erichek).

```shell
│   .release-it.json
│   CHANGELOG.md
│   LICENSE.md
│   MANIFEST.in
│   README.rst
│   package.json
│   requirements.txt
│   setup.cfg
│   setup.py
│
├───erichek
│       __init__.py
│       __main__.py
```

In [Software Engineering site recommends](https://softwareengineering.stackexchange.com/q/301691/264224) use uppercase for README and some another text files.

!!! question
	I [ask a question](https://softwareengineering.stackexchange.com/questions/365410/readme-md-vs-readme-md), need I use uppercase for file extension or no? *README.rst* or *README.RST*? But I get 7 minuses and my question will delete.

	I don't find standard. Personally I use lowercase for file extensions, but you can use uppercase.

<!-- Using HTML Entities -->

<a id="9595init9595py"></a>
## &#95;&#95;init&#95;&#95;.py

See [answer](https://stackoverflow.com/a/4116384/5951529), why *\_\_init\_\_.py* need. This file may be blank or contains content.

<a id="license"></a>
## License

Add text of license for your package to *LICENSE.md* file.

If your editor is [Sublime Text 3](https://www.sublimetext.com/3), you can use [License Snippets](https://packagecontrol.io/packages/Licence%20Snippets) package.

<a id="readme"></a>
## README

<a id="readmemd"></a>
### README.md

If you preferred write README in Markdown, you can have problems.

At February 2018 [PyPI doesn't support Readme.md](https://github.com/pypa/warehouse/issues/869) without dependencies. Possibly, [it seems like there is no easy way to use a markdown README for PyPI. Solutions involve requiring pandoc locally, which is a heavy dependency](https://github.com/dhimmel/hetio/issues/7#issuecomment-283797432).

!!! hint
	You can [convert Markdown to reStructuredText](https://bfroehle.com/2013/04/26/converting-md-to-rst/) use [Pandoc](http://pandoc.org).

<a id="readmerst"></a>
### README.rst

I recommend write README in [reStructuredText](http://docutils.sourceforge.net/rst.html) — you need use file *README.rst*. I add to [my README.rst](https://github.com/Kristinita/Erichek/blob/master/README.rst) next information:

1. Short package description,
1. Badges,
1. Link to long package description on my site.

I prefer to add long description to personal site, not to README, because I have much more options in the design of the description.

<a id="setupcfg"></a>
## setup.cfg

!!! info
	You can add your parameters to *setup.py*, not to *setup.cfg*, see [discussion](https://github.com/pypa/python-packaging-user-guide/issues/378). I believe, that adding to *setup.cfg* more convenient.

[See example *setup.cfg*](https://github.com/4383/sampleproject/blob/update/distribute/setup.cfg). Copy content of this file to your *setup.cfg* and change example values of parameters to your real values.

In the subsections below I describe the places that caused me difficulties.

<a id="long_description"></a>
### long_description

my value:

```ini
long_description = file: Readme.rst
```

Set your README file as value. Letters [must be in same register as in file](https://github.com/regebro/pyroma/issues/16#issuecomment-362904598). For example, if your file is *Readme.rst*, you need to set *file: README.rst*, not *file: Readme.rst* or *file: README.RST*.

<a id="classifiers"></a>
### classifiers

You can use only classifiers from [this list](https://pypi.python.org/pypi?%3Aaction=list_classifiers). If no, you can't publish your package to PyPI.

Possibly, UNIX users can select classifiers via [pypi-classifiers GUI](https://github.com/mbr/pypi-classifiers), but [I can't set this program for Windows 10](https://github.com/mbr/pypi-classifiers/issues/2).

<a id="zip_safe"></a>
### zip_safe

my value:

```ini
zip_safe = False
```

If you build your package use Wheels, [you don't need this parameter](https://stackoverflow.com/a/16541150/5951529), but pyroma [will show lower value](https://github.com/regebro/pyroma/issues/19). So I recommend add `#!ini zip_safe = False` or `#!ini zip_safe = True` (unimportant) to your *setup.cfg* file.

<a id="packages"></a>
### packages

my value:

```ini
packages = find:
```

If no `#!ini packages = find:`, users doesn't download folder with your Python module.

<a id="console_scripts"></a>
### console_scripts

What is it. If Erichek user want run Erichek, he/she wrote in console:

```shell
python "path/to/__main__.py"
```

But since *console_scripts* exist in *setup.cfg*, Erichek user can use simply command, that get same behavior:

```shell
erichek
```

my value:

```ini
console_scripts =
	erichek = erichek.__main__:main
```

Parameter and values:

+ `erichek` — name of command, that users of your package will run.
+ `erichek.__main__` — relative path to your main module. For me it [*\_\_main\_\_.py* file in *erichek* folder](https://github.com/Kristinita/Erichek/blob/master/erichek/__main__.py).
+ `:main` — function, that run, when you run your module. For my *\_\_main\_\_.py* it `#!python main()` function.

<a id="bdist_wheel"></a>
### bdist_wheel

my value:

```ini
[bdist_wheel]
python-tag = py3
```

See [what is Wheels](https://wheel.readthedocs.io/en/stable/) and why [*.whl* preferred than *.egg*](https://www.python.org/dev/peps/pep-0427/#comparison-to-egg).

Erichek — Python 3 package, so I have `#!ini python-tag = py3`. If your package support Python 2 and 3 both, [you need use](https://wheel.readthedocs.io/en/stable/#defining-the-python-version) next code:

```ini
[bdist_wheel]
universal = 1
```

<a id="dependencies"></a>
## Dependencies

In this section I tell, what you need, that dependencies of your package from file *requirements.txt* automatically install for user. You don't need to write same dependencies in *requirements.txt* and *setup.cfg*/*setup.py*.

!!! caution
	Some developers [criticize this method](https://stackoverflow.com/a/33685899/5951529). If you need different dependencies for *requirements.txt* and *install_requires*, please, add list of your dependencies in *requirements.txt* and *setup.cfg* both.

<a id="difference-between-requirementstxt-and-install_requires"></a>
### Difference between requirements.txt and install_requires

Simplified definition.

<a id="install_requires"></a>
#### install_requires

*install_requires* parameter in *setup.cfg* or *setup.py* show, which packages will install additionally, if user install your package via pip. For example, user install [clize package](https://pypi.org/project/sasha/):

```shell
pip install clize
```

[Part of clize *setup.py*](https://github.com/epsy/clize/blob/3d9804b6b652415215677846a44d59fc7ae8929d/setup.py#L13-L19):

```python
install_requires=[
	'six',
	'sigtools >= 2.0',
	'attrs >= 17.4.0',
	'od',
	'docutils',
],
```

In clize installation process [*six*, *sigtools*, *docutils*, *od* and *attrs* packages](https://github.com/thusoy/sasha/blob/38e50791436859e9e054e50d5c511bbc46011f89/setup.py#L16-L19) automatically install for user, if this packages no already installed.

```shell
D:\>pip install clize
Collecting clize
	Using cached clize-4.0.3-py2.py3-none-any.whl
Requirement already satisfied: six in c:\python36\lib\site-packages (from clize)
Requirement already satisfied: sigtools>=2.0 in c:\python36\lib\site-packages (from clize)
Requirement already satisfied: docutils in c:\python36\lib\site-packages (from clize)
Collecting od (from clize)
	Using cached od-1.0-py3-none-any.whl
Requirement already satisfied: attrs>=17.4.0 in c:\python36\lib\site-packages (from clize)
Installing collected packages: od, clize
Successfully installed clize-4.0.3 od-1.0
```

<a id="requirementstxt"></a>
#### requirements.txt

For example, I am Python package developer and have local dependencies for my package.

1. If I want to update local dependencies, I update versions in *requirements.txt* → I run in console:

	```shell
	pip install -r requirements.txt -t . --upgrade
	```

	my local dependencies are updated.

1. Services as [Dependabot](https://dependabot.com/) or [Pyup](https://pyup.io/) check dependencies from *requirements.txt* and update numbers of outdated versions.

<a id="setuppy"></a>
### setup.py

In this and 2 next sections I wrote, how you can get [install\_requires behavior](#installrequires), use only *requirements.txt* file. You don't need additional add your dependencies to install\_requires.

Add [this code](https://stackoverflow.com/a/16624700/5951529) to your *setup.py*:

```python
from setuptools import setup

from pip.req import parse_requirements

# parse_requirements() returns generator of pip.req.InstallRequirement objects
install_reqs = parse_requirements('requirements.txt', session='hack')

# reqs is a list of requirements
# e.g. ['django==1.5.1', 'mezzanine==1.4.6']
reqs = [str(ir.req) for ir in install_reqs]

setup(
	install_requires = reqs
)
```

!!! note
	Author of answer by link above doesn't add a line in answer:

	```python
	from setuptools import setup
	```

	But you need to add it.

<a id="requirementstxt-1"></a>
### requirements.txt

[Add list of your dependencies](https://pip.readthedocs.io/en/1.1/requirements.html) to *requirements.txt*.

<a id="manifestin"></a>
### MANIFEST.in

Add a line to *MANIFEST.in* file:

```markdown
include requirements.txt
```

If no, [users can't install your package](https://stackoverflow.com/q/26319101/5951529).

<a id="pyroma"></a>
## pyroma

[pyroma](https://pypi.python.org/pypi/pyroma/) — PyPI configuration validator.

If you set all your configuration files, run command in root directory of your Python module:

```shell
pyroma .
```

You need get 10/10 final rating, example:

```zsh
$ pyroma .
------------------------------
Checking .
Registered VCS backend: git
Registered VCS backend: hg
Registered VCS backend: svn
Registered VCS backend: bzr
Found erichek
------------------------------
Final rating: 10/10
Your cheese is so fresh most people think it's a cream: Mascarpone
------------------------------
```

If no 10/10, please, see pyroma messages and try fix your package.

<a id="testpypi"></a>
# TestPyPI

<a id="what-is-testpypi"></a>
## What is TestPyPI

If you publish your package first time or not sure that everything is doing right, I recommend at first publish package to [TestPyPI](https://test.pypi.org/). TestPyPI — is a service, where you can test uploading, downloading and display your package on PyPI site before you share package to PyPI.

<a id="registration"></a>
## Registration

Please, register on [TestPyPI](https://testpypi.python.org) and [PyPI](https://pypi.python.org/pypi) sites.

It would be nice, if you will use same username and password for both sites, that [Twine](#twine-settings) works correct.

<a id="twine-settings"></a>
## Twine settings

[Add environment variables](https://github.com/pypa/twine#options)
*TWINE_USERNAME* and *TWINE_PASSWORD* with values — your PyPI and TestPyPI username and password.

See, how you can add environment variables for:

+ [UNIX](https://askubuntu.com/a/58828/582218),
+ [Windows](https://superuser.com/a/79614/572069).

!!! caution
	Also [you can add](http://peterdowns.com/posts/first-time-with-pypi.html) your username and password to *.pypirc* file, but it [not recommended](https://packaging.python.org/tutorials/distributing-packages/#create-an-account).

<a id="build-package"></a>
## Build package

Print in your terminal:

```shell
python setup.py bdist_wheel
```

!!! note
	[*python setup.py register*](http://peterdowns.com/posts/first-time-with-pypi.html) [is obsolete method](https://packaging.python.org/tutorials/distributing-packages/#uploading-your-project-to-pypi).

!!! info
	If by some reasons you don't want use Wheels, [you can build your package](https://packaging.python.org/tutorials/distributing-packages/#source-distributions), use command `python setup.py sdist`

<a id="publish-to-testpypi"></a>
## Publish to TestPyPI

[Enter in your terminal](https://packaging.python.org/guides/using-testpypi/#using-testpypi-with-twine):

```shell
twine upload --repository-url https://test.pypi.org/legacy/ dist/*
```

If no errors in your configuration, package must successful upload to TestPyPI.

!!! bug
	[Known bug](https://github.com/pypa/packaging-problems/issues/74) at February 2018 — in PyPI and TestPyPI you never can't overwrite specific version of your package, even if you delete your package. I.e., for example, you publish to PyPI or TestPyPI version *4.14.7* of your package *mypackage* → you delete *mypackage* from PyPI and/or TestPyPI → you can't upload *4.14.7* version of *mypackage* again.

<a id="visit-testpypi"></a>
## Visit TestPyPI

After uploading visit 2 pages:

+ `https://testpypi.python.org/pypi/<your_package>`,
+ `https://test.pypi.org/project/<your_package>`.

Examples for Erichek at February 2018:

+ <https://test.pypi.org/project/erichek>:

![Erichek TestPyPI](https://i.imgur.com/WW0M2Io.png)

![Erichek TestPyPI 2](https://i.imgur.com/r5kIabM.png)

+ <https://testpypi.python.org/pypi/erichek>:

![Erichek TestPyPI Python](https://i.imgur.com/FDXRBtv.png)

If the result suits you, in next step install package, that you upload, use virtual environment.

!!! caution
	You can't find your package, if you use search form on <https://test.pypi.org> or <https://pypi.org>. [The search indexes are not immediately updated, it may take \~24 hours for a new package or deleted package to appear in a search](https://github.com/pypa/warehouse/issues/2899#issuecomment-364150430).

!!! note
	On <https://testpypi.python.org> can't show last version of your package. That fix it, login at <https://testpypi.python.org> → visit `https://testpypi.python.org/pypi?%3Aaction=pkg_edit&name=<your_package>` (<https://testpypi.python.org/pypi?%3Aaction=pkg_edit&name=erichek> for Erichek) → [set *Hide? No*](https://i.imgur.com/bGjKHzS.png) for latest version.

	If you have this problem for <https://pypi.python.org>, make same actions.

<a id="virtualenv"></a>
## virtualenv

I recommend install your TestPyPI package, use virtual environment.

<a id="why-virtual-environment"></a>
### Why virtual environment?

Citation from [Pro Python Best Practices](https://www.apress.com/us/book/9781484222409) book:

> Virtualenv is like building a moat around the house. It prevents a fire from spreading — in both directions. Likewise, a virtual environment prevents that Python projects interfere with each other.

![virtualenv](https://i.imgur.com/fRISif0.png)

Reasons of use virtual environment for TestPyPI installation:

1. You can have bugs in your package. Bugs may have a negative impact of your environment. If you will use virtual environment, these bugs does not affect your global Python environment.
1. You can have some globally dependencies in your environment, but users of your package may haven't them. If you use virtual environment, you see, how your package will install and works without, possibly, pre-installed global dependencies on your machine.

<a id="using-virtualenv-and-virtualenvwrapper"></a>
### Using virtualenv and virtualenvwrapper

!!! caution
	If you on Windows, please, use [standard Windows console](https://conemu.github.io/en/Delusions.html#delusion-2) for correct virtualenvwrapper-win works or use plugin for your preferred terminal. You can't use command lines command from this section in [PowerShell](https://pypi.python.org/pypi/virtualenvwrapper-win) or [Far Manager](https://github.com/FarGroup/FarManager/issues/23).

Open terminal in any directory. Run these commands:

```batch
C:\Users\SashaChernykh>mkvirtualenv erichekenv
Using base prefix 'c:\\python36'
New python executable in C:\Users\SashaChernykh\Envs\erichekenv\Scripts\python.exe
Installing setuptools, pip, wheel...done.

(erichekenv) C:\Users\SashaChernykh>toggleglobalsitepackages

	Disabled global site-packages
(erichekenv) C:\Users\SashaChernykh>pip install --extra-index-url https://test.pypi.org/simple/ erichek
```

Where:

+ *erichekenv* — name of your virtual environment; you can use any name instead of *erichek*, if virtual environment with this name not already exist;
+ *erichek* — name of your package; use real name of your package instead of *erichek*.

!!! note
	[Use *--extra-index-url*](https://stackoverflow.com/a/34561435/5951529), [not *--index-url*](https://packaging.python.org/guides/using-testpypi/#using-testpypi-with-pip) command line argument for correct dependencies installation.

!!! caution
	Can take ~10 minutes, before you can install last version of your package. For example, you upload *4.14.7* version your package *mypackage* to TestPyPI → you print in a terminal `pip install --extra-index-url https://test.pypi.org/simple/ mypackage==4.14.7` → you can get an error:

	```shell
	Could not find a version that satisfies the requirement mypackage==4.14.7 (from versions: 4.14.6)
	No matching distribution found for mypackage==4.14.7
	```

	You may need wait ~10 minutes, that 4.14.7 version index on TestPyPI. You can have a similar problem for PyPI.

<a id="checking"></a>
### Checking

If you can't have bugs in installation process, check, that you package works correct. For example, Erichek check, contains errors in *.txt* files in a folder or no. I run *erichek* console command.

If error in one of text file:

```batch
C:\ErichekExamples>erichek
[2018-02-08 08:49:43.058353] NOTICE: eric_encoding logbook: All files in Windows-1251 encoding
[2018-02-08 08:49:43.060355] NOTICE: eric_body logbook: All files contains <body>
[2018-02-08 08:49:43.062358] NOTICE: eric_asterisks logbook: All needest lines contains asterisks
[2018-02-08 08:49:43.063357] ERROR: eric_head logbook: Air_crashes.txt not contains «Постоянный адрес пакета:»
[2018-02-08 08:49:43.064359] ERROR: eric_head logbook: One or more packages not contains one or more head data. Please, add correct head data to your package.
[2018-02-08 08:49:43.064359] ERROR: summary logbook: You have errors in your packages. Please, fix them.
```

If all *.txt* files correct:

```batch
C:\ErichekExamples>erichek
[2018-02-08 08:51:23.840987] NOTICE: eric_encoding logbook: All files in Windows-1251 encoding
[2018-02-08 08:51:23.841997] NOTICE: eric_body logbook: All files contains <body>
[2018-02-08 08:51:23.843991] NOTICE: eric_asterisks logbook: All needest lines contains asterisks
[2018-02-08 08:51:23.844992] NOTICE: eric_head logbook: All files contains correct head data
[2018-02-08 08:51:23.844992] NOTICE: summary logbook: Congratulations! You haven't errors in your packages!
```

Erichek works as expected.

After succsessful checking [you can remove](https://github.com/davidmarble/virtualenvwrapper-win/#main-commands) your virtual environment (*erichekenv* in example):

<!-- [NOTE] Plain text lexer:
http://pygments.org/docs/lexers/#pygments.lexers.special.TextLexer -->

```text
(erichekenv) C:\Users\SashaChernykh>rmvirtualenv erichekenv

	Deleted C:\Users\SashaChernykh\Envs\erichekenv

C:\Users\SashaChernykh>
```

<a id="pypi"></a>
# PyPI

If all actions from [TestPyPI section](#testpypi) success for you, you can publish your package to PyPI and then install it.

1. change version in your *setup.cfg* file (it must be [semver](https://semver.org/)-compatible);
1. in root folder of your package open terminal and print:

	```shell
	python setup.py bdist_wheel && twine upload dist/*
	```

1. visit `https://pypi.python.org/pypi/<your_package>` and `https://pypi.org/project/<your_package>`, as you [visit TestPyPI](#visit-testpypi) and check, is everything okay;
1. install your package, use pip:

	```shell
	pip install <your_package>
	```

1. check, that your package works correct [as in previous section](#checking).

If all okay, **congratulations! You successful publish your package to PyPI!**

![Congratulations](https://i.imgur.com/4cvn8jX.jpg)

<a id="updating"></a>
# Updating

That update your package in PyPI:

1. Make new changes,
1. Make same actions as in [section above](#pypi).

<a id="automatic-updating-release-and-changelog"></a>
# Automatic updating, release and changelog

!!! note
	In this article I wrote not detailed. If you want to read details, how it worked, see [my another article](Fastest-way-to-add-new-version-of-Sublime-Text-3-package). I recommend read it before making actions from this section.

!!! caution
	I recommend in first do actions from this section for test project, not real. Argumentation:

	+ You or I can make a typo(s);
	+ Differences in my and your environment;
	+ Different versions of tools from this article can do another behavior, [example](https://github.com/webpro/release-it/issues/233)

<a id="demonstration-1"></a>
## Demonstration

I enter command to the terminal:

```shell
release-it -n -V
```

I get [behavior](https://github.com/Kristinita/Erichek/commit/be58c1d53bbc8aeb764807463b0db159b59200f6):

1. All commits description add to *CHANGELOG.md*:

	![Changelog](https://i.imgur.com/pmePvzQ.png)

1. New release [publish to GitHub](https://github.com/Kristinita/Erichek/releases/tag/0.2.0):

	![New release](https://i.imgur.com/fiMNQAw.png)

1. Version updates in *setup.cfg*:

	![Version in setup.cfg](https://i.imgur.com/4C1jnLm.png)

1. New version of Erichek publish to PyPI.

If you want to have same behavior, read on.

<a id="features-1"></a>
## Features

See [these features](Fastest-way-to-add-new-version-of-Sublime-Text-3-package#features).

<a id="limitations-1"></a>
## Limitations

See [these limitations](Fastest-way-to-add-new-version-of-Sublime-Text-3-package#limitations).

<a id="installation-and-setting-up"></a>
## Installation and setting-up

1. you need to install all from [this section](Fastest-way-to-add-new-version-of-Sublime-Text-3-package#installation) except *tee*, *cat*, *mv* and *js-beautify*;
1. please, follow [these](Fastest-way-to-add-new-version-of-Sublime-Text-3-package#github-token), [these](Fastest-way-to-add-new-version-of-Sublime-Text-3-package#upstream-branch) and [these](Fastest-way-to-add-new-version-of-Sublime-Text-3-package#changelogmd) instructions;
1. [create a file *package.json*](Fastest-way-to-add-new-version-of-Sublime-Text-3-package#packagejson) in root folder of your repository.

<a id="release-itjson"></a>
### .release-it.json

Create a file *.release-it.json* in root folder of your repository with content:

```json
{
	"buildCommand": "changelog -u https:\/\/${repo.host}\/${repo.repository} -f CHANGELOG.md && sed -i 's\/^version = .*$\/version = ${version}\/g' setup.cfg && python setup.py bdist_wheel && twine upload dist\/*",
	"changelogCommand": "changelog -f -",
	"github": {
		"release": true,
		"tokenRef": "GITHUB_TOKEN"
	},
	"npm": {
		"publish": false
	},
	"safeBump": false
}
```

Where:

+ `sed -i 's\/^version = .*$\/version = ${version}\/g' setup.cfg` — command for replacing version in your *setup.cfg* to the newest, see [find and replace via sed](https://askubuntu.com/a/20416/582218):

	![Version in setup.cfg](https://i.imgur.com/4C1jnLm.png)

+ `python setup.py bdist_wheel && twine upload dist\/*` — [build and publish](#pypi) your package.

!!! note
	[In *.release-it.json* of real Erichek repository](https://github.com/Kristinita/Erichek/blob/master/.release-it.json) I add also next text:

	```json
	&& sed -i 's\/^VERSION = \".*\"$\/VERSION = \"${version}\"\/g' \"erichek\/eric_config.py\"
	```

	It change a version in *eric\_config.py* file, that command `erichek --version` works correct.

	![Version in eric_config.py](https://i.imgur.com/xMrSbew.png)

	If you don't want to have this behavior, please, do not add this text to your *.release-it.json*.

See [here](Fastest-way-to-add-new-version-of-Sublime-Text-3-package#release-itjson-1), if you want to know details about another parts of *.release-it.json*.

<a id="usage"></a>
## Usage

See [usage instructions](Fastest-way-to-add-new-version-of-Sublime-Text-3-package#usage).

<a id="testing-environment"></a>
# Testing environment

+ Windows 10 Enterprise LTSB 64-bit EN,
+ Python 3.6.4,
+ setuptools 38.4.1,
+ pip 9.0.1,
+ Twine 1.9.1,
+ Wheel 0.30.0,
+ virtualenv 15.1.0,
+ virtualenvwrapper-win 1.2.5,
+ pyroma 2.3,
+ Node.js 9.4.0,
+ git 2.16.0.windows.2,
+ release-it 7.0.0,
+ changelog 1.7.0,
+ sed (GNU sed) 4.2.2.

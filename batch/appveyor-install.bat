@REM @Author: Kristinita
@REM @Date:   2018-02-28 19:42:16
@REM @Last Modified by:   Kristinita
@REM Modified time: 2019-03-14 18:42:44
@REM [INFO] Install all AppVeyor dependencies for building and validation.
@REM [LEARN] Use REM comments:
@REM https://stackoverflow.com/a/12407934/5951529
@REM [LEARN] Hide REM lines from showing, use @ symbol:
@REM https://www.computerhope.com/issues/ch001313.htm
@REM https://jpsoft.com/help/rem.htm
@REM CMD command /C option run another console; without /C option command doesn't work:
@REM https://ss64.com/nt/cmd.html
@REM START command /B option, that output from another consoles move to head console
@REM https://ss64.com/nt/start.html
@REM [WARNING] Use -ignoredependencies for HTML Tidy installation to AppVeyor
@REM https://github.com/majkinetor/au-packages/issues/75
@REM https://ci.appveyor.com/project/Kristinita/sashatidydebugging/build/1.0.12
START /B CMD /C "choco install html-tidy -y -ignoredependencies"
@REM [NOTE] Needs “python -m pip install -U pip”, not “pip install -U pip”, because
@REM “PermissionError: [WinError 5] Access is denied”:
@REM https://pip.pypa.io/en/stable/installing/#upgrading-pip
@REM https://pythonhosted.org/CodeChat/appveyor.yml.html
@REM [BUG] Temporary downgrade pipenv, because locking bug in newest versions:
@REM https://github.com/pypa/pipenv/issues/3391
@REM [WARNING] Use “pip3”, not “pip”, because Python 2 is default for February 2019:
@REM https://www.appveyor.com/docs/windows-images-software/#python
@REM [WARNING] Needs “%PYTHON%\\python”, that Python 3, not Python 2 will run:
@REM Required:
@REM 1. quotes
@REM 2. slash escaping
@REM “python3” command deprecated in Python 3.7
@REM https://github.com/ogrisel/python-appveyor-demo/blob/master/appveyor.yml
@REM https://packaging.python.org/guides/supporting-windows-using-appveyor/
START /B CMD /C "%PYTHON%\\python -m pip install --upgrade pip & pip3 install pipenv==11.10.2 & pipenv install --dev & pipenv run peru sync & %PYTHON%\\python rename_pelican_plugins_folder.py"
START /B CMD /C "choco install nodejs phantomjs -y & npm install -g grunt-cli & npm install"
@REM [INFO] pathed — setx PATH environment variable without loss data:
@REM http://www.p-nand-q.com/download/gtools/pathed.html
@REM [NOTE] 2 refreshenv required, compare:
@REM https://ci.appveyor.com/project/Kristinita/sashaappveyordebugging/builds/24724183
@REM https://ci.appveyor.com/project/Kristinita/sashaappveyordebugging/builds/24723651
@REM https://ci.appveyor.com/project/Kristinita/sashaappveyordebugging/builds/24723848
@REM [NOTE] “pathed /APPEND” duplicates required;
@REM “pathed /APPEND firstpath secondpath thirdpath” will not work:
@REM https://ci.appveyor.com/project/Kristinita/sashaappveyordebugging/builds/24721706#L32
@REM [WARNING] Needs set Python 3, because Python 2 by default at February 2019:
@REM https://github.com/ogrisel/python-appveyor-demo/blob/master/appveyor.yml
@REM https://www.appveyor.com/docs/windows-images-software/#python
@REM https://ci.appveyor.com/project/Kristinita/erichek/build/1.0.3
@REM [INFO] Set latest Ruby version at the time:
@REM https://www.appveyor.com/docs/lang/ruby/
@REM https://www.appveyor.com/docs/build-environment/#ruby
@REM https://www.appveyor.com/docs/lang/ruby/#installation
@REM [INFO] Set LocalAppVeyor Windows path:
@REM DotNet user profile is “USERPROFILE” on Windows and “HOME” on Linux:
@REM https://github.com/dotnet/cli/issues/7569#issuecomment-329280924
START /B CMD /C "choco install gtools -y & refreshenv & pathed /APPEND %PYTHON% & pathed /APPEND %PYTHON%\\Scripts & pathed /APPEND C:\Ruby26-x64\bin & pathed /APPEND %USERPROFILE%\.dotnet\tools & refreshenv"
@REM [FIXME] Incorrect lint “.travis.yml” file:
@REM https://github.com/travis-ci/travis.rb/issues/422
@REM https://github.com/travis-ci/travis-yaml/issues/58
@REM [WARNING] Old Ruby 1.9.3 default by March 2019:
@REM https://www.appveyor.com/docs/windows-images-software/#ruby
@REM START /B CMD /C "gem install travis"
@REM [WARNING] In local machine you need install dotnetcore:
@REM https://chocolatey.org/packages/dotnetcore
START /B CMD /C "dotnet tool install -g localappveyor --version 0.5.0-alpha.10"
@REM [NOTE] ShellCheck installation via Scoop — fast way for Windows:
@REM https://github.com/koalaman/shellcheck/issues/915#issuecomment-385049702
@REM https://help.appveyor.com/discussions/suggestions/843-add-support-for-the-scoop-installer
START /B CMD /C "scoop install shellcheck"

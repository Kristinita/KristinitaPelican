@REM @Author: Kristinita
@REM @Date:   2018-02-28 19:42:16
@REM @Last Modified by:   Kristinita
@REM Modified time: 2019-01-29 16:16:07
@REM Install all AppVeyor dependencies for building and validation.
@REM Use REM comments:
@REM https://stackoverflow.com/a/12407934/5951529
@REM Hide REM lines from showing, use @ symbol:
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
START /B CMD /C "python -m pip install --upgrade pip & pip install pipenv==11.10.2 & pipenv install --dev"
START /B CMD /C "choco install nodejs phantomjs -y & npm install -g grunt-cli & npm install"
START /B CMD /C "gem install travis"
@REM [NOTE] Doesn't need add LocalAppVeyor path to PATH environment variable:
@REM https://github.com/Kristinita/SashaAppVeyorDebugging/blob/3eb2069f79335dfe8f9f49bfca8cf51462577a86/appveyor.yml
@REM https://ci.appveyor.com/project/Kristinita/sashaappveyordebugging/builds/21943338
@REM [WARNING] In local machine you need:
@REM 1. Install dotnetcore — https://chocolatey.org/packages/dotnetcore
@REM 2. Add path to LocalAppVeyor — “%USERPROFILE%\.dotnet\tools” as value of PATH environment variable
@REM [WARNING] Use pathed — http://www.p-nand-q.com/download/gtools/pathed.html
@REM Don't use SETX for adding to PATH — https://stackoverflow.com/a/28778358/5951529
START /B CMD /C "dotnet tool install -g localappveyor --version 0.5.0-alpha.10"
@REM [NOTE] ShellCheck installation via Scoop — fast way for Windows:
@REM https://github.com/koalaman/shellcheck/issues/915#issuecomment-385049702
@REM https://help.appveyor.com/discussions/suggestions/843-add-support-for-the-scoop-installer
START /B CMD /C "scoop install shellcheck"

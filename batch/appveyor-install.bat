@REM @Author: Kristinita
@REM @Date:   2018-02-28 19:42:16
@REM @Last Modified by:   Kristinita
@REM Modified time: 2022-09-27 22:27:00

@REM [PURPOSE] Install all AppVeyor dependencies for building and validation.


@REM [LEARN][BATCH] Use REM comments:
@REM https://stackoverflow.com/a/12407934/5951529
@REM
@REM [LEARN][BATCH] Hide REM lines from showing, use @ symbol:
@REM https://www.computerhope.com/issues/ch001313.htm
@REM https://jpsoft.com/help/rem.htm
@REM
@REM [LEARN][BATCH] CMD command /C option run another console; without /C option command doesn't work:
@REM https://ss64.com/nt/cmd.html
@REM
@REM [LEARN][BATCH] START command /B option, that output from another consoles move to head console:
@REM https://ss64.com/nt/start.html


@REM [NOTE] Needs “python -m pip install -U pip”, not “pip install -U pip”, because
@REM “PermissionError: [WinError 5] Access is denied”:
@REM https://pip.pypa.io/en/stable/installing/#upgrading-pip
@REM https://pythonhosted.org/CodeChat/appveyor.yml.html
@REM
@REM [NOTE] Needs “%PYTHON%\\python”, that Python 3, not Python 2 will run
@REM
@REM [NOTE] “python3” command deprecated in Python 3.7
@REM https://github.com/ogrisel/python-appveyor-demo/blob/master/appveyor.yml
@REM https://packaging.python.org/guides/supporting-windows-using-appveyor/
@REM [NOTE] “pip3” doesn't work; use “%PYTHON%\\python -m pip”:
@REM https://stackoverflow.com/a/42559223/5951529
@REM [NOTE] In this batch file required:
@REM 1. quotes
@REM 2. slash escaping
@REM
@REM [FIXME] Disable pip upgrade. It used to work in 2018—2021, but doesn’t work in 2022:
@REM “%PYTHON%\\python -m pip install --upgrade pip &”
@REM https://ci.appveyor.com/project/Kristinita/kristinitapelican/build/job/7wwcotq9d18skwm4#L281
@REM [COMPARE] https://ci.appveyor.com/project/Kristinita/sashaappveyordebugging/builds/42637066#L76
@REM https://ci.appveyor.com/project/Kristinita/sashaappveyordebugging/builds/42637089#L74
@REM
@REM [FIXME][BUG] I replace the native pygments-csv-lever to my patch
@REM without “citation marks” in “README.md” due to persistent issues for AppVeyor encodings:
@REM https://ci.appveyor.com/project/Kristinita/kristinitapelican/builds/44897793#L189
@REM [COMPARE] https://ci.appveyor.com/project/Kristinita/sashaappveyordebugging/builds/44899708
@REM https://ci.appveyor.com/project/Kristinita/sashaappveyordebugging/builds/44900052
START /B CMD /C "%PYTHON%\\python -m pip install pipenv & pipenv install --dev & pipenv run peru sync"


@REM [INFO] Install Chocolatey packages from XML file with extension “.config”:
@REM https://superuser.com/a/1132468/572069
@REM https://docs.chocolatey.org/en-us/choco/commands/install#packages.config
START /B CMD /C "choco install packages.config -y & npm install -g grunt-cli & npm install"


@REM [NOTE] Old Ruby 1.9.3 default by September 2020:
@REM https://www.appveyor.com/docs/windows-images-software/#ruby
@REM START /B CMD /C "gem install travis"


@REM [NOTE] For your local machine you need install dotnetcore for localappveyor installation:
@REM https://chocolatey.org/packages/dotnetcore
START /B CMD /C "dotnet tool install -g localappveyor"


@REM [NOTE][FIXME][ISSUE] Scoop hasn’t behavior for installation multiple packages from list
@REM as “scoop install scoop-packages.yaml”
@REM https://github.com/ScoopInstaller/Scoop/issues/2289#issuecomment-523370257
@REM
@REM [INFO] ShellCheck installation via Scoop — the fastest way for Windows:
@REM https://github.com/koalaman/shellcheck/issues/915#issuecomment-385049702
@REM https://help.appveyor.com/discussions/suggestions/843-add-support-for-the-scoop-installer
START /B CMD /C "scoop install shellcheck"

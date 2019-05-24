@REM Set “PATH” environment variable.
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
@REM [NOTE] Keys “/USER” or “/MACHINE” required, compare:
@REM https://ci.appveyor.com/project/Kristinita/sashaappveyordebugging/builds/24763128
@REM https://ci.appveyor.com/project/Kristinita/sashaappveyordebugging/builds/24763463
@REM https://ci.appveyor.com/project/Kristinita/sashaappveyordebugging/builds/24763626
START /B CMD /C "choco install gtools -y & refreshenv & pathed /APPEND %PYTHON% /USER & pathed /APPEND %PYTHON%\Scripts /USER & pathed /APPEND C:\Ruby26-x64\bin /USER"

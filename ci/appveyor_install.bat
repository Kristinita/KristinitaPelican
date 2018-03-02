@REM @Author: Kristinita
@REM @Date:   2018-02-28 19:42:16
@REM @Last Modified by:   Kristinita
@REM Modified time: 2018-03-01 20:59:14
@REM Parallel pip and npm commands.
@REM Use REM comments:
@REM https://stackoverflow.com/a/12407934/5951529
@REM Hide REM lines from showing, use @ symbol:
@REM https://www.computerhope.com/issues/ch001313.htm
@REM https://jpsoft.com/help/rem.htm
@REM CMD command /C option run another console; without /C option command doesn't work:
@REM https://ss64.com/nt/cmd.html
@REM START command /B option, that output from another consoles move to head console
@REM https://ss64.com/nt/start.html
START /B CMD /C "pip install --upgrade pip & pip install pipenv & pipenv install --dev"
START /B CMD /C "npm install -g grunt-cli & npm install"
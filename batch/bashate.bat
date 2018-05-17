@REM @Author: Kristinita
@REM @Date:   2018-04-28 07:42:17
@REM @Last Modified by:   Kristinita
@REM Modified time: 2018-04-28 08:45:46
@ECHO off
@REM bashate: check shell files
@REM For details see “tidy-validate.sh” file of this repository
CHCP 65001
SET VALIDALL=true
SETLOCAL EnableDelayedExpansion
FOR /R %%f IN (bash\*.sh) DO (
	pipenv run bashate -i E002,E003,E006,E010,E011 %%f
	IF "!ERRORLEVEL!"=="0" (
		ECHO %%~nxf valid
	) ELSE (
	ECHO %%~nxf not valid^^! Please, fix it^^!
	SET VALIDALL=false
	)
)
%VALIDALL%

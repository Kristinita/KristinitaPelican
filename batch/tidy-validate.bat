@REM @Author: Kristinita
@REM @Date:   2018-03-07 14:57:34
@REM @Last Modified by:   Kristinita
@REM Modified time: 2018-04-28 08:35:35
@REM HTML Tidy — validation all HTML files.
@ECHO off
@REM For correct displaying Cyrillic filenames
CHCP 65001
CD output
SET VALIDALL=true
@REM Correct ERRORLEVEL in IF/ELSE
@REM https://stackoverflow.com/a/4368104/5951529
SETLOCAL EnableDelayedExpansion
@REM If/else exitcode:
@REM https://stackoverflow.com/a/36897449/5951529
@REM I need use variable, that contains 1 letter; “f” — “filename”.
FOR /R %%f IN (*.html) DO (
	@REM [FIXME] Safari Pinned Tab Icons doesn't support for HTML Tidy:
	@REM https://github.com/htacg/tidy-html5/issues/686
	@REM “--markup no” — disable print file content to console:
	@REM http://api.html-tidy.org/tidy/quickref_next.html#markup
	tidy -q --markup no --warn-proprietary-attributes no %%f
	@REM Error level:
	@REM https://stackoverflow.com/a/334893/5951529
	IF "!ERRORLEVEL!"=="0" (
		@REM Split filename from filepath
		@REM https://stackoverflow.com/a/9253018/5951529
		ECHO %%~nxf valid
	) ELSE (
	@REM Exclamation mark as literal:
	@REM https://stackoverflow.com/a/3288632/5951529
	ECHO %%~nxf not valid^^! Please, fix it^^!
	SET VALIDALL=false
	)
)
%VALIDALL%

@REM @Author: Kristinita
@REM @Date:   2018-03-07 14:51:41
@REM @Last Modified by:   Kristinita
@REM Modified time: 2018-04-28 08:34:59
@REM HTML Tidy: Fix errors and warnings in HTML files:
@REM Modify HTML: doesn't show warnings or errors.
@REM [BUG]: AppVeyor works incorrect, if filename contains Cyrillic letters:
@REM https://github.com/appveyor/ci/issues/2107
@ECHO off
CHCP 65001
CD output
FOR /R %%f IN (*.html) DO tidy -mq --wrap 0 --show-errors 0 --show-warnings 0 %%f
@REM Exit code = 0 in any case:
@REM https://stackoverflow.com/a/4728151/5951529
EXIT /b 0

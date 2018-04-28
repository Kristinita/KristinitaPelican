#!/bin/bash
# @Author: Kristinita
# @Date:   2018-03-07 14:33:18
# @Last Modified by:   Kristinita
# @Last Modified time: 2018-04-28 10:41:59
#############
# HTML Tidy #
#############
# Fix errors and warnings in HTML files:
# Modifying HTML: doesn't show warnings or errors.
# I need use variable, that contains 1 letter; “f” — “filename”.
shopt -s globstar
for f in output/**/*.html;
	# Not show errors and warnings:
	# http://tidy.sourceforge.net/docs/quickref.html?#DiagnosticsHeader
	do tidy -mq --show-errors 0 --show-warnings 0 --wrap 0 "$f"
done
# Exit code = 0 in any case:
# https://unix.stackexchange.com/a/428022/237999
true

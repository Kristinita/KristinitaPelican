#!/bin/bash
# @Author: Kristinita
# @Date:   2018-03-07 14:33:18
# @Last Modified by:   Kristinita
# @Last Modified time: 2018-05-17 20:32:00
#############
# HTML Tidy #
#############
# [FIXME] Fix problems in Python Markdown and Pelican HTML output
# to remove of tidy-modify.
#
# 1. HTML Tidy incorrectly formats blocks of code:
# https://github.com/htacg/tidy-html5/issues/1006
#
# 2. HTML Tidy add unexpected blank "p" and "span" tags
#
# 3. HTML Tidy adds unexpected "p":
# "Warning: inserting implicit <p>"
#
#
# [INFO] Fix errors and warnings in HTML files:
#
# [NOTE] I need use variable, that contains 1 letter; "f" — "filename".
#
# [WARNING][BUG] HTML Tidy remove line breaks inside code blocks:
# https://github.com/htacg/tidy-html5/issues/1006#issuecomment-1246422318
shopt -s globstar

for f in output/**/*.html
	do
	# [INFO] Not show errors and warnings:
	# http://tidy.sourceforge.net/docs/quickref.html?#DiagnosticsHeader
	tidy -config ./tidy.conf -m --show-errors 0 --show-warnings 0 "$f"
done

# [LEARN][BASH] Exit code = 0 in any case:
# https://unix.stackexchange.com/a/428022/237999
true

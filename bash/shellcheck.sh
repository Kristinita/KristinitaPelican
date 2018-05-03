#!/bin/bash
# @Author: Kristinita
# @Date:   2018-04-28 07:38:29
# @Last Modified by:   Kristinita
# @Last Modified time: 2018-04-28 12:15:08
##############
# ShellCheck #
##############
# Check shell files:
# https://www.shellcheck.net/
# Program doesn't support recursively checking at-the-box:
# https://github.com/koalaman/shellcheck/issues/143
# For details see “tidy-validate.sh” file of this repository
# [NODE] Needs shebang:
# https://github.com/koalaman/shellcheck/wiki/SC2148
# [NOTE] Needs quotes — "$f" — to prevent globbing and word splitting:
# https://github.com/koalaman/shellcheck/wiki/SC2086
shopt -s globstar
validall=true
for f in bash/*.sh; do
	if shellcheck "$f"; then
		echo "$f" valid
	else
		validall=false
		echo "$f" not valid! Please, fix it!
	fi
done
$validall

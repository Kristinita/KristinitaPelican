#!/bin/bash
# @Author: Kristinita
# @Date:   2018-04-28 07:38:29
# @Last Modified by:   Kristinita
# @Last Modified time: 2018-05-17 20:34:00
##############
# ShellCheck #
##############
# Check shell files:
# https://www.shellcheck.net/
# [BUG] AppVeyor doesn't support non-ASCII symbols in ".sh" files:
# https://ci.appveyor.com/project/Kristinita/kristinitapelican/build/job/ysk4whh6yu0dn6hi
# https://github.com/appveyor/ci/issues/2129
# [NOTE] Program doesn't support recursively checking at-the-box:
# https://github.com/koalaman/shellcheck/issues/143
# For details see tidy-validate.sh file of this repository
# [NODE] Needs shebang:
# https://github.com/koalaman/shellcheck/wiki/SC2148
# [NOTE] Needs quotes — "$f" — to prevent globbing and word splitting:
# https://github.com/koalaman/shellcheck/wiki/SC2086
shopt -s globstar
validall=true
for f in bash/*.sh
	do
	if shellcheck "$f"
		then
		echo "$f" valid
	else
		validall=false
		echo "$f" not valid! Please, fix it!
	fi
done
$validall

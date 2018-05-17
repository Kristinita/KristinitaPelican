#!/bin/bash
# @Author: Kristinita
# @Date:   2018-04-28 07:38:29
# @Last Modified by:   Kristinita
# @Last Modified time: 2018-04-28 12:15:08
###########
# bashate #
###########
# Linter for bash files:
# https://docs.openstack.org/bashate/latest/readme
shopt -s globstar
validall=true
for f in bash/*.sh
	do
	# Ignoring rules:
	# E002, E003 — I use tabs,
	# E006 — 79 symbols is little, no rule, that I can to 120 symbols:
	# https://bugs.launchpad.net/bash8/+bug/1395391
	# E010, E011 — 1. no syntax reasons, 2. No one line — expected for long lines:
	# https://unix.stackexchange.com/a/443509/237999
	if pipenv run bashate -i E002,E003,E006,E010,E011 "$f"
		then
		echo "$f" valid
	else
		validall=false
		echo "$f" not valid! Please, fix it!
	fi
done
$validall

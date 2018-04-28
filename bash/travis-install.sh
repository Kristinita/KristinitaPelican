#!/bin/bash
################
# GNU Parallel #
################
# Install all Travis CI dependencies for building and validation.
# Run commands parallel:
# https://www.gnu.org/software/parallel/
# [WARNING] On Windows works only in Cygwin, not in default console:
# https://savannah.gnu.org/forum/forum.php?forum_id=7581
# Parallel npm and pip tasks:
# https://unix.stackexchange.com/a/427419/237999
# [WARNING] Default UNIX parallel commands doesn't work for Travis CI:
# https://unix.stackexchange.com/questions/427410#comment771128_427415
# [NOTE] Grunt tasks needs grunt-cli globally:
# https://stackoverflow.com/a/21133609/5951529
# [WARNING] Don't paste any comments after “parallel :::”, parallel will not work:
# https://travis-ci.org/Kristinita/SashaScrutinizer/builds/363772800
# [WARNING] apt-get HTML Tidy version outdated, build HTML tidy on Ubuntu from sources:
# https://github.com/htacg/tidy-html5/blob/next/README/BUILD.md
# https://github.com/htacg/tidy-html5/issues/721
# https://codeyarns.com/2016/06/06/how-to-build-and-install-html-tidy/
# [NOTE] “sudo make install” — mandatory command:
# https://travis-ci.org/Kristinita/SashaTidyDebugging/builds/369420036
# [BUG] Warnings in console, when HTML Tidy build:
# https://github.com/htacg/tidy-html5/issues/721
parallel ::: 'pip install --upgrade pip && pip install pipenv && pipenv install --dev' \
	'npm install --global npm && npm install -g grunt-cli && npm install' \
	'git clone https://github.com/htacg/tidy-html5.git && cd tidy-html5 && cd build/cmake && cmake ../.. -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIB:BOOL=OFF && make && sudo make install' \
	'gem install travis'

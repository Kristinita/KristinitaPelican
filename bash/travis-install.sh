#!/bin/bash
################
# GNU Parallel #
################
# [PURPOSE] Install all Travis CI dependencies for building and validation.


# [BUG][WARNING][APPVEYOR] Don't use NON-ASCII symbols in this file!
# AppVeyor doesn't support them.
# https://ci.appveyor.com/project/Kristinita/kristinitapelican/build/job/ha70um51grbxo8e4#L2032
# https://github.com/appveyor/ci/issues/2226
# https://github.com/appveyor/ci/issues/2129
# https://github.com/appveyor/ci/issues/2107


# [LEARN][PARALLEL] Run commands parallel:
# https://www.gnu.org/software/parallel/
# [WARNING] On Windows it works in Cygwin, not in default console:
# https://savannah.gnu.org/forum/forum.php?forum_id=7581
# [INFO] Parallel npm and pip tasks:
# https://unix.stackexchange.com/a/427419/237999
# [NOTE] Default UNIX parallel commands doesn't work for Travis CI:
# https://unix.stackexchange.com/questions/427410#comment771128_427415
# [WARNING] Don't paste any comments after "parallel :::", parallel will not work!
# https://travis-ci.org/Kristinita/SashaScrutinizer/builds/363772800


# [NOTE] Grunt tasks needs grunt-cli globally:
# https://stackoverflow.com/a/21133609/5951529


# [NOTE] Use "--upgrade" flag for install Pipenv,
# as of November 2020 Travis CI has outdated Pipenv version:
# https://github.com/pypa/pipenv/issues/4141#issuecomment-728808409


# [NOTE] apt-get HTML Tidy version outdated, build HTML tidy on Ubuntu from sources:
# https://askubuntu.com/a/1027128
# https://github.com/htacg/tidy-html5/blob/next/README/BUILD.md
# https://github.com/htacg/tidy-html5/issues/721
# https://codeyarns.com/2016/06/06/how-to-build-and-install-html-tidy/
# [NOTE] "sudo make install" — mandatory command:
# https://travis-ci.org/Kristinita/SashaTidyDebugging/builds/369420036
# [BUG] Warnings in console, when HTML Tidy build:
# https://github.com/htacg/tidy-html5/issues/721


# [INFO] PhantomJS pre-installed on Travis:
# https://docs.travis-ci.com/user/gui-and-headless-browsers/#using-phantomjs


# [INFO] Install .NET Core and LocalAppVeyor for Ubuntu:
# https://dotnet.microsoft.com/download/linux-package-manager/ubuntu16-04/sdk-current
# [NOTE] Matrix key "dotnet" for C#, F# or Visual Basic projects.
# If no, you need install .NET Core manually:
# https://docs.travis-ci.com/user/languages/csharp/
# [NOTE] You need specific DotNet and Ubuntu version;
# "https://packages.microsoft.com/config/ubuntu/packages-microsoft-prod.deb" and
# "sudo apt-get install dotnet-sdk" will not works
parallel ::: 'pip install --upgrade pip pipenv && pipenv install --dev && pipenv run peru sync' \
	'npm install --global npm && npm install -g grunt-cli && npm install' \
	'git clone https://github.com/htacg/tidy-html5.git && cd tidy-html5 && cd build/cmake && cmake ../.. -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIB:BOOL=OFF && make && sudo make install' \
	'gem install travis' \
	'wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && sudo dpkg -i packages-microsoft-prod.deb && sudo apt-get update && sudo apt-get install dotnet-sdk-3.1 && dotnet tool install -g localappveyor'

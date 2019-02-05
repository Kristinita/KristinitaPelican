#!/bin/bash
################
# GNU Parallel #
################
# Install all Travis CI dependencies for building and validation.
# [BUG] Don't use NON-ASCII symbols in this file!
# AppVeyor doesn't support them.
# https://ci.appveyor.com/project/Kristinita/kristinitapelican/build/job/ha70um51grbxo8e4#L2032
# https://github.com/appveyor/ci/issues/2226
# https://github.com/appveyor/ci/issues/2129
# https://github.com/appveyor/ci/issues/2107
# Run commands parallel:
# https://www.gnu.org/software/parallel/
# [WARNING] On Windows works in Cygwin, not in default console:
# https://savannah.gnu.org/forum/forum.php?forum_id=7581
# Parallel npm and pip tasks:
# https://unix.stackexchange.com/a/427419/237999
# [WARNING] Default UNIX parallel commands doesn't work for Travis CI:
# https://unix.stackexchange.com/questions/427410#comment771128_427415
# [NOTE] Grunt tasks needs grunt-cli globally:
# https://stackoverflow.com/a/21133609/5951529
# [WARNING] Don't paste any comments "after parallel :::", parallel will not work:
# https://travis-ci.org/Kristinita/SashaScrutinizer/builds/363772800
# [WARNING] apt-get HTML Tidy version outdated, build HTML tidy on Ubuntu from sources:
# https://github.com/htacg/tidy-html5/blob/next/README/BUILD.md
# https://github.com/htacg/tidy-html5/issues/721
# https://codeyarns.com/2016/06/06/how-to-build-and-install-html-tidy/
# [NOTE] "sudo make install" — mandatory command:
# https://travis-ci.org/Kristinita/SashaTidyDebugging/builds/369420036
# [BUG] Warnings in console, when HTML Tidy build:
# https://github.com/htacg/tidy-html5/issues/721
# [BUG] Temporary downgrade pipenv, because locking bug in newest versions:
# https://github.com/pypa/pipenv/issues/3391
# [INFO] Install .NET Core and LocalAppVeyor for Ubuntu:
# https://docs.microsoft.com/en-us/windows-server/administration/linux-package-repository-for-microsoft-software#ubuntu
# [NOTE] PhantomJS pre-installed on Travis:
# https://docs.travis-ci.com/user/gui-and-headless-browsers/#using-phantomjs
# [NOTE] Matrix key "dotnet" for C#, F# or Visual Basic projects.
# If no, you need install .NET Core manually:
# https://docs.travis-ci.com/user/languages/csharp/
# [WARNING] You need specific DotNet version and Ubuntu version;
# "https://packages.microsoft.com/config/ubuntu/packages-microsoft-prod.deb" and
# "sudo apt-get install dotnet-sdk" will not works
# [WARNING] You need specific LocalAppVeyor version, because no stable versions at January 2019,
# and user get a bug: "error NU1103: Unable to find a stable package localappveyor with version"
parallel ::: 'pip install --upgrade pip && pip install pipenv==11.10.2 && pipenv install --dev' \
	'npm install --global npm && npm install -g grunt-cli && npm install' \
	'git clone https://github.com/htacg/tidy-html5.git && cd tidy-html5 && cd build/cmake && cmake ../.. -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIB:BOOL=OFF && make && sudo make install' \
	'gem install travis' \
	'wget https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb && sudo dpkg -i packages-microsoft-prod.deb && sudo apt-get update && sudo apt-get install dotnet-sdk-2.2 && dotnet tool install -g localappveyor --version 0.5.0-alpha.10'

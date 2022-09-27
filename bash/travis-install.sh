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
#
# [WARNING] On Windows it works in Cygwin, not in default console:
# https://savannah.gnu.org/forum/forum.php?forum_id=7581
#
# [INFO] Parallel npm and pip tasks:
# https://unix.stackexchange.com/a/427419/237999
#
# [NOTE] Default UNIX parallel commands doesn't work for Travis CI:
# https://unix.stackexchange.com/questions/427410#comment771128_427415
#
# [WARNING] Don't paste any comments after "parallel :::", parallel will not work!
# https://travis-ci.org/Kristinita/SashaScrutinizer/builds/363772800


# [NOTE] Grunt tasks needs grunt-cli globally:
# https://stackoverflow.com/a/21133609/5951529


# [NOTE] Use "--upgrade" flag for install Pipenv,
# as of November 2020 Travis CI has outdated Pipenv version:
# https://github.com/pypa/pipenv/issues/4141#issuecomment-728808409


# [INFO] Snap Tidy installation:
# https://snapcraft.io/tidy
#
# [FIXME] In August 2022 Snap use outdated Tidy version:
# https://github.com/brlin-tw/tidy-snap/issues/3
#
# [REQUIRED] "sudo snap"
# [COMPARE]
# https://app.travis-ci.com/github/Kristinita/SashaTravis/builds/254920138#L176
# https://app.travis-ci.com/github/Kristinita/SashaTravis/builds/254920378#L176
#
# [INFO] Tidy Apt installation also available in 2022:
# https://launchpad.net/ubuntu/+source/tidy-html5
# https://packages.ubuntu.com/jammy/tidy
# https://app.travis-ci.com/github/Kristinita/SashaTravis/builds/254921954


# [DEPRECATED] In August 2022 Tidy installation via Snap or Apt available
# [NOTE] apt-get HTML Tidy version outdated, build HTML tidy on Ubuntu from sources:
# https://askubuntu.com/a/1027128
# https://github.com/htacg/tidy-html5/blob/next/README/BUILD.md
# https://github.com/htacg/tidy-html5/issues/721
# https://codeyarns.com/2016/06/06/how-to-build-and-install-html-tidy/
# 'git clone https://github.com/htacg/tidy-html5.git && cd tidy-html5 && cd build/cmake && cmake ../.. -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIB:BOOL=OFF && make && sudo make install' \
#
# [NOTE] "sudo make install" — required command:
# https://travis-ci.org/Kristinita/SashaTidyDebugging/builds/369420036


# [INFO] PhantomJS pre-installed on Travis:
# https://docs.travis-ci.com/user/gui-and-headless-browsers/#using-phantomjs


# [NOTE] Big .NET dependency required for LocalAppVeyor:
# https://github.com/joaope/LocalAppVeyor#install
#
# [INFO] Install the .NET SDK or the .NET Runtime on Ubuntu 22.04:
# https://docs.microsoft.com/en-us/dotnet/core/install/linux-ubuntu#2204
#
# [INFO] Use ".NET Runtime", not ".NET SDK";
# SDK required for developing apps; for using apps install the Runtime:
# https://docs.microsoft.com/en-us/dotnet/core/install/linux-snap#sdk-or-runtime
#
# [FIXME] LocalAppVeyor doesn't work on .NET 6:
# https://github.com/joaope/LocalAppVeyor/issues/445
#
# [BUG] DotNet not installed to Ubuntu 22 via Snap:
# https://stackoverflow.com/a/68519735/5951529
# https://app.travis-ci.com/github/Kristinita/SashaTravis/builds/254922526#L202
# https://github.com/dotnet/installer/issues/491
# https://github.com/dotnet/sdk/issues/11639
# https://forum.snapcraft.io/t/rpath-in-elf-that-can-be-moved-across-system/10118
# https://docs.microsoft.com/en-us/dotnet/core/install/linux-snap


# [INFO] Install the .NET SDK or the .NET Runtime on Ubuntu:
# https://docs.microsoft.com/en-us/dotnet/core/install/linux-ubuntu
#
# [INFO] Installation for Ubuntu 20.10:
# https://docs.microsoft.com/en-us/dotnet/core/install/linux-ubuntu#2010-
#
# [NOTE] Matrix key "dotnet" for C#, F# or Visual Basic projects.
# If no, you need install .NET Core manually:
# https://docs.travis-ci.com/user/languages/csharp/
#
# [NOTE] You need specific DotNet and Ubuntu version;
# "https://packages.microsoft.com/config/ubuntu/packages-microsoft-prod.deb" and
# "sudo apt-get install dotnet-sdk" will not works
parallel ::: 'pip install --upgrade pip pipenv && pipenv install --dev && pipenv run peru sync' \
	'npm install --global npm && npm install -g grunt-cli && npm install' \
	'sudo snap install tidy' \
	'gem install travis' \
	'wget -q https://packages.microsoft.com/config/ubuntu/20.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && sudo dpkg -i packages-microsoft-prod.deb && sudo apt-get update && sudo apt-get install -y dotnet-sdk-5.0 && dotnet tool install -g localappveyor'

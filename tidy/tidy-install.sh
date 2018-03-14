# @Author: Kristinita
# @Date:   2018-03-07 15:20:23
# @Last Modified by:   Kristinita
# @Last Modified time: 2018-03-12 19:20:20
# Install HTML tidy on Ubuntu:
# https://codeyarns.com/2016/06/06/how-to-build-and-install-html-tidy/
git clone https://github.com/htacg/tidy-html5.git
cd tidy-html5
cd build/cmake
cmake ../..
cmake --build . --config Release
sudo make install
# Move to build directory after HTML Tidy installation:
# https://docs.travis-ci.com/user/environment-variables/#Default-Environment-Variables
cd $TRAVIS_BUILD_DIR

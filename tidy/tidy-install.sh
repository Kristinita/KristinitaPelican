# @Author: Kristinita
# @Date:   2018-03-07 15:20:23
# @Last Modified by:   Kristinita
# @Last Modified time: 2018-03-07 15:22:35
# Install HTML tidy on Ubuntu:
# https://codeyarns.com/2016/06/06/how-to-build-and-install-html-tidy/
git clone https://github.com/htacg/tidy-html5.git
cd tidy-html5
cd build/cmake
cmake ../..
cmake --build . --config Release
sudo make install
cd ../../..

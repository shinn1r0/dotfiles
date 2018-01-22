cd ~/
git clone https://github.com/nim-lang/Nim.git
cd Nim
git clone --depth 1 https://github.com/nim-lang/csources.git
cd csources
sh build.sh
cd ../
bin/nim c koch
../koch boot -d:release
bin/nim e install_nimble.nims
bin/nim e install_tools.nims

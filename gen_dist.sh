cd src/YanoneKaffeesatzZeroHack
make clean
make all
make doc
cd ../beamer
make clean
make all
make doc
cd ../../dist
cp -r ../src/YanoneKaffeesatzZeroHack/fonts/ ./
mkdir -p tex/latex/stratum0/img
cp ../src/YanoneKaffeesatzZeroHack/*.fd tex/latex/stratum0
cp ../src/beamer/*.sty tex/latex/stratum0
cp ../src/beamer/img/*.pdf tex/latex/stratum0/img
zip -r stratum0.zip fonts tex -x "*/\.*" -x "\.*"
cd ..

rm -rf CMakeCache.txt  CMakeFiles  Debug/ Release/ *.dir/ dist/
cmake -D BUILD_SHARED_LIBS=OFF .
mkdir dist
cmake --build . --config Release
cmake --install . --config Release --prefix dist
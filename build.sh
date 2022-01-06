rm -rf CMakeCache.txt  CMakeFiles  Debug/ Release/ *.dir/ dist/
if [ $OSTYPE == "msys" ]; then
    echo "WINDOWS BUILD"
    cmake \
        -D CMAKE_VERBOSE_MAKEFILE=ON \
        -D BUILD_SHARED_LIBS=OFF \
        -D BZIP2_LIBRARIES=../bzip2-dev-1.0.8.0-win-x64/libbz2-static \
        -D BZIP2_INCLUDE_DIR=../bzip2-dev-1.0.8.0-win-x64/ \
        -D ZLIB_LIBRARY=../zlib/dist/lib/zlibstatic \
        -D ZLIB_INCLUDE_DIR=../zlib/include/
else
    echo "NON-WINDOWS BUILD"
    cmake -D BUILD_SHARED_LIBS=OFF .
fi

mkdir -p dist
cmake --build . --config Release && \
cmake --install . --config Release --prefix dist
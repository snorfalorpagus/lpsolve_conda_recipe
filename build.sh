mkdir -p ${PREFIX}/bin
mkdir -p ${PREFIX}/lib
mkdir -p ${PREFIX}/include/lpsolve

# build library
cd lpsolve55
sed 's/-Wno-long-double//' < ccc.osx > ccc.osx.patched
sh ccc.osx.patched
cd bin/osx64
install_name_tool -id ${PREFIX}/lib/liblpsolve55.dylib liblpsolve55.dylib
otool -L liblpsolve55.dylib
cp liblpsolve55.dylib ${PREFIX}/lib/
cd ../../../

# build executable
cd lp_solve
sed 's/-Wno-long-double//' < ccc.osx > ccc.osx.patched
sh ccc.osx.patched
cp bin/osx64/lp_solve ${PREFIX}/bin/
cd ..

# install headers
cp *.h ${PREFIX}/include/
cp *.h ${PREFIX}/include/lpsolve/

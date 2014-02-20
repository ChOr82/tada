#!/bin/bash

targetbase="/opt/tada"
gcclibs="$targetbase/gcc-libs"
gccnative="$targetbase/gcc-native"
curr_lib="none"


clear

echo "============================="
echo "= Build native gcc compiler ="
echo "=============================" && echo

############################################### 
curr_lib=gcc-4.8.2
echo "=================================="
echo "Install $curr_lib. Continue? (y/n)"
echo "=================================="
read user_option

if test $user_option = "y"
then
	cd $gcclibs
	../sources/$curr_lib/configure --prefix=$gccnative --with-gmp=$gcclibs --with-mpfr=$gcclibs --with-mpc=$gcclibs --enable-languages=c,ada,lto 
	make && make check && make install
else
	echo "Ok. Finished."
fi

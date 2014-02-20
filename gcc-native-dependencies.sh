#!/bin/bash

cd /opt/tada/sources
curr_lib="none"

echo "Installation from gcc dependencies will start for libraries"
echo "==========================================================="

curr_lib="m4-1.4.17"
echo "Install $curr_lib. Continue? (y/n)"
read user_option

if ("$user_option" == "y") then
	cd $curr_lib
	./configure --prefix=/opt/tada/gcc-native
	make && make check && make install
else
	echo "Ok. Finished."
	exit
fi

#cd ../gmp-5.1.3
#./configure --prefix=/opt/tada/gcc-native
#make && make check && make install

#cd ../mpfr-3.1.2
#./configure --prefix=/opt/tada/gcc-native --with-gmp=/opt/tada/gcc-native
#make && make check && make install

#cd ../mpc-1.0.2
#./configure --prefix=/opt/tada/gcc-native
#make && make check && make install

#cd ../automake-1.9
#./configure --prefix=/opt/tada/gcc-native
#make && make check && make install
	
#cd ../autoconf-2.69
#./configure --prefix=/opt/tada/gcc-native
#make && make check && make install

#cd ../flex-2.5.37
#./configure --prefix=/opt/tada/gcc-native
#make && make check && make install

#cd ../binutils-2.24
#./configure --prefix=/opt/tada/gcc-native --verbose --disable-nls --target=arm-none-eabi
#make && make check && make install

PATH=/opt/tada/gcc-native/bin:$PATH


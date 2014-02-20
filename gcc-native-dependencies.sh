#!/bin/bash

targetbase="/opt/tada"
gccnative="$targetbase/gcc-native"
curr_lib="none"


cd $targetbase/sources

clear

echo "==========================================================="
echo "Installation from gcc dependencies will start for libraries"
echo "===========================================================" && echo

############################################### 
curr_lib=m4-1.4.17
echo "=================================="
echo "Install $curr_lib. Continue? (y/n)"
echo "=================================="
read user_option

if test $user_option = "y"
then
	cd $curr_lib
	./configure --prefix=$gccnative
	make && make check && make install
else
	echo "Ok. Finished."
fi

############################################### 
curr_lib=gmp-5.1.3
echo "=================================="
echo "Install $curr_lib. Continue? (y/n)"
echo "=================================="
read user_option

if test $user_option = "y"
then
	cd $curr_lib
	./configure --prefix=$gccnative
	make && make check && make install
else
	echo "Ok. Finished."
fi

############################################### 
curr_lib=mpfr-3.1.2
echo "=================================="
echo "Install $curr_lib. Continue? (y/n)"
echo "=================================="
read user_option

if test $user_option = "y"
then
	cd $curr_lib
	./configure --prefix=$gccnative --with-gmp=$gccnative
	make && make check && make install
else
	echo "Ok. Finished."
fi

############################################### 
curr_lib=mpc-1.0.2
echo "=================================="
echo "Install $curr_lib. Continue? (y/n)"
echo "=================================="
read user_option

if test $user_option = "y"
then
	cd $curr_lib
	./configure --prefix=$gccnative
	make && make check && make install
else
	echo "Ok. Finished."
fi

############################################### 
curr_lib=automake-1.9
echo "=================================="
echo "Install $curr_lib. Continue? (y/n)"
echo "=================================="
read user_option

if test $user_option = "y"
then
	cd $curr_lib
	./configure --prefix=$gccnative
	make && make check && make install
else
	echo "Ok. Finished."
fi
	
############################################### 
curr_lib=autoconf-2.69
echo "=================================="
echo "Install $curr_lib. Continue? (y/n)"
echo "=================================="
read user_option

if test $user_option = "y"
then
	cd $curr_lib
	./configure --prefix=$gccnative
	make && make check && make install
else
	echo "Ok. Finished."
fi

############################################### 
curr_lib=flex-2.5.37
echo "=================================="
echo "Install $curr_lib. Continue? (y/n)"
echo "=================================="
read user_option

if test $user_option = "y"
then
	cd $curr_lib
	./configure --prefix=$gccnative
	make && make check && make install
else
	echo "Ok. Finished."
fi

############################################### 
curr_lib=binutils-2.24
echo "=================================="
echo "Install $curr_lib. Continue? (y/n)"
echo "=================================="
read user_option

if test $user_option = "y"
then
	cd $curr_lib
	./configure --prefix=$gccnative --verbose --disable-nls --target=arm-none-eabi
	make && make check && make install
else
	echo "Ok. Finished."
fi


############################################### 
echo "=========================================================="
echo "This step will include $gccnative in PATH. Continue? (y/n)"
echo "=========================================================="
read user_option

if test $user_option = "y"
then
	PATH=$gccnative/bin:$PATH
else
	echo "Ok. Finished."
fi




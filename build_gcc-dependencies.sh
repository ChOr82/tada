#!/bin/bash

PROJECT_PATH="/opt/tada"
PROJECT_LIBS="$PROJECT_PATH/gcc-libs"
PROJECT_SRCS="$PROJECT_PATH/sources"
CURRENT_LIBR="none"
export PATH=$PROJECT_LIBS/bin:$PATH

clear
echo "==============================================================="
echo "= Installation from gcc dependencies will start for libraries ="
echo "===============================================================" && echo

############################################### 
echo "==================================="
echo "Install all(a) or select libraries?"
echo "==================================="
read noselect

############################################### 
CURRENT_LIBR="m4-1.4.17"
echo "=================================="
echo "Install $CURRENT_LIBR. Continue? (y/n)"
echo "=================================="

if test $noselect = "a"
then
	user_option="y"
else
	read user_option
fi

if test $user_option = "y"
then
	cd $PROJECT_SRCS/$CURRENT_LIBR
	./configure --prefix=$PROJECT_LIBS
	make && make check && make install
else
	echo "Ok. Finished."
fi

############################################### 
CURRENT_LIBR="gmp-5.1.3"
echo "=================================="
echo "Install $CURRENT_LIBR. Continue? (y/n)"
echo "=================================="
if test $noselect = "a"
then
	user_option="y"
else
	read user_option
fi

if test $user_option = "y"
then
	cd /opt/tada/sources/$CURRENT_LIBR
	./configure --prefix=$PROJECT_LIBS
	make && make check && make install
else
	echo "Ok. Finished."
fi

############################################### 
CURRENT_LIBR="mpfr-3.1.2"
echo "=================================="
echo "Install $CURRENT_LIBR. Continue? (y/n)"
echo "=================================="
if test $noselect = "a"
then
	user_option="y"
else
	read user_option
fi

if test $user_option = "y"
then
	cd $PROJECT_SRCS/$CURRENT_LIBR
	./configure --prefix=$PROJECT_LIBS --with-gmp=$PROJECT_LIBS
	make && make check && make install
else
	echo "Ok. Finished."
fi

############################################### 
CURRENT_LIBR="mpc-1.0.2"
echo "=================================="
echo "Install $CURRENT_LIBR. Continue? (y/n)"
echo "=================================="
if test $noselect = "a"
then
	user_option="y"
else
	read user_option
fi

if test $user_option = "y"
then
	cd $PROJECT_SRCS/$CURRENT_LIBR
	./configure --prefix=$PROJECT_LIBS --with-gmp=$PROJECT_LIBS
	make && make check && make install
else
	echo "Ok. Finished."
fi

############################################### 
CURRENT_LIBR="autoconf-2.69"
echo "=================================="
echo "Install $CURRENT_LIBR. Continue? (y/n)"
echo "=================================="
if test $noselect = "a"
then
	user_option="y"
else
	read user_option
fi

if test $user_option = "y"
then
	cd $PROJECT_SRCS/$CURRENT_LIBR
	./configure --prefix=$PROJECT_LIBS
	make && make check && make install
else
	echo "Ok. Finished."
fi

############################################### 
CURRENT_LIBR="automake-1.9"
echo "=================================="
echo "Install $CURRENT_LIBR. Continue? (y/n)"
echo "=================================="
if test $noselect = "a"
then
	user_option="y"
else
	read user_option
fi

if test $user_option = "y"
then
	cd $PROJECT_SRCS/$CURRENT_LIBR
	./configure --prefix=$PROJECT_LIBS
	make && make check && make install
else
	echo "Ok. Finished."
fi
	
############################################### 
CURRENT_LIBR="flex-2.5.37"
echo "=================================="
echo "Install $CURRENT_LIBR. Continue? (y/n)"
echo "=================================="
if test $noselect = "a"
then
	user_option="y"
else
	read user_option
fi


if test $user_option = "y"
then
	cd $PROJECT_SRCS/$CURRENT_LIBR
	./configure --prefix=$PROJECT_LIBS
	make && make check && make install
else
	echo "Ok. Finished."
fi

############################################### 
CURRENT_LIBR="binutils-2.24"
echo "=================================="
echo "Install $CURRENT_LIBR. Continue? (y/n)"
echo "=================================="
if test $noselect = "a"
then
	user_option="y"
else
	read user_option
fi


if test $user_option = "y"
then
	cd $PROJECT_SRCS/$CURRENT_LIBR
	./configure --prefix=$PROJECT_LIBS --verbose --disable-nls --target=arm-none-eabi
	make && make check && make install
else
	echo "Ok. Finished."
fi






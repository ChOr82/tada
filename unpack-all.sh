#!/bin/bash

homepath=`pwd`
clear

echo "#############################"
echo "# Environment Configuration #"
echo "#############################" && echo

if [ -d "/opt/tada" ]; then
	echo "###### Removing /opt/tada ..."
	sudo rm -rf /opt/tada
fi

echo "###### Creating /opt/tada ..." && sudo mkdir /opt/tada
echo "###### Changing /opt/tada permissions to current user ..." && sudo chown `whoami` /opt/tada

echo "###### Creating base folders ..."
cd /opt/tada
mkdir sources
mkdir gcc-libs
mkdir gcc-libs/bin

echo "###### Adding /opt/tada/gcc-libs/bin to PATH ..."
export PATH=/opt/tada/gcc-libs/bin:$PATH
echo "###### New PATH is " && echo $PATH

echo "###### Copying tar ball sources ..."
cp $homepath/downloads/*.gz sources/
cp $homepath/downloads/*.bz2 sources/
	
echo "###### Extracting sources ..."
cd sources
tar zxf autoconf-2.69.tar.gz
tar jxf automake-1.9.tar.bz2
tar zxf binutils-2.24.tar.gz
tar zxf gcc-4.8.2.tar.gz
tar jxf gmp-5.1.3.tar.bz2
tar zxf mpc-1.0.2.tar.gz
tar zxf mpfr-3.1.2.tar.gz
tar zxf m4-1.4.17.tar.gz 
#tar zxf flex-2.5.37.tar.gz

echo "###### Removing tar ball sources ..."
rm *.gz *.bz2

echo "###### Finished."


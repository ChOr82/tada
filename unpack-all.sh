#!/bin/bash

svn export https://github.com/pvrego/tada.git/trunk /opt/tada --force

cd /opt/tada
cp downloads/* sources

cd sources

tar zxf autoconf-2.69.tar.gz
tar jxf automake-1.9.tar.bz2
tar zxf binutils-2.24.tar.gz
tar zxf gcc-4.8.2.tar.gz
tar jxf gmp-5.1.3.tar.bz2
tar zxf mpc-1.0.2.tar.gz
tar zxf mpfr-3.1.2.tar.gz
tar zxf m4-1.4.tar.gz 
#tar zxf flex-2.5.37.tar.gz

rm *.gz *.bz2

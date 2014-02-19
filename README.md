## Welcome to TAda project ##

**Tiva Ada** is a cross-compiler for build Ada code in Tiva board.

### General Information ###
This build is done using Ubuntu 13.10 32 bits. 
	
### Project Status and Goals ###

### Project Structure ##

	trunk
	|-- LICENSE
	`-- README.md

### Building the Cross Compiler ###
#### What you will need ####

1. Create a folder to keep the project. Transfer the owner to your current user in order to facilitate the builds. Move to `tada` folder. All the build will be done from there.

	cd /opt  
	sudo mkdir tada  
	sudo chwon `` `whoami` `` tada  
	cd tada  
	
2. Create a download folder in `tada/downloads` and download the following libraries to it.

	mkdir downloads  
	cd downloads  
	
	1. **m4**. <ftp://ftp.gnu.org/gnu/m4/m4-1.4.17.tar.gz>
	2. **gmp**. <https://gmplib.org/download/gmp/gmp-5.1.3.tar.bz2>
	3. **mpfr**. <ftp://ftp.gnu.org/gnu/mpfr/mpfr-3.1.2.tar.gz>
	4. **mpc**. <ftp://ftp.gnu.org/gnu/mpc/mpc-1.0.2.tar.gz>
	5. **autoconf**. <ftp://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz>
	6. **automake**. <ftp://ftp.gnu.org/gnu/automake/automake-1.9.tar.bz2>
	7. **binutils**. <ftp://ftp.gnu.org/gnu/binutils/binutils-2.24.tar.gz>
	8. **gcc**. <ftp://ftp.gnu.org/gnu/gcc/gcc-4.8.2/gcc-4.8.2.tar.gz>
	9. **lex**. <http://prdownloads.sourceforge.net/flex/flex-2.5.37.tar.gz?download>
	10. **gnat-gpl**
		
	cd ..
	
3. Create a folder `tada/sources` to keep the sources from the libraries. Copy the files from the `tada/downloads` folder to it, and unpack them.

	mkdir sources  
	cp downloads/* sources/  
	cd sources

	tar zxf autoconf-2.69.tar.gz  
	tar jxf automake-1.9.tar.bz2  
	tar zxf binutils-2.24.tar.gz  
	tar zxf gcc-4.8.2.tar.gz  
	tar jxf gmp-5.1.3.tar.bz2  
	tar zxf mpc-1.0.2.tar.gz  
	tar zxf mpfr-3.1.2.tar.gz  
	tar zxf m4-1.4.tar.gz 
	tar zxf flex-2.5.37.tar.gz
	
	rm *.bz2 *.gz  

#### Step-by-step build ####

1. Install the generic libraries `gmp`, `mpfr` and `mpc`.

	mkdir gcc-native

	cd m4-1.4  
	./configure --prefix=/opt/tada/gcc-native  
	make  
	make install  
	- installation ok
	
	cd gmp-5.1.3  
	./configure --prefix=/opt/tada/gcc-native  
	make  
	make install  
	- installation ok  

	cd ../mpfr-3.1.2  
	./configure --prefix=/opt/tada/gcc-native --with-gmp=/opt/tada/gcc-native
	make  
	make install  
  	- installation ok  

	cd ../mpc-1.0.2  
	./configure --prefix=/opt/tada/gcc-native --with-gmp=/opt/tada/gcc-native  
	make  
	sudo make install  
	- installation ok

	cd ..  

2. Install `automake`, `autoconf` and `binutils`

	mkdir target  

	cd automake-1.9  
	./configure --prefix=/opt/tada/target  
	make  
	make install  
	- installation ok
	
	cd ../autoconf-2.69  
	./configure --prefix=/opt/tada/target  
	make  
	make install  
	- installation ok
	
	-- maybe not needed
	cd ../flex-2.5.37
	./configure --prefix=/opt/tada/target  
	make  
	make install  
	
	cd ../binutils-2.24  
	./configure --prefix=/opt/tada/target  
	make  
	make install  

	cd ..  

3. Add `target/bin` folder to the PATH.

	PATH=/opt/tada/target/bin:$PATH

4. Build the native gcc compiler.

	cd gcc-native
	../sources/gcc-4.8.2/configure --prefix=/opt/tada/target --enable-languages=c,ada,lto --no-recursion
	make
	# it can take lots of time here.

#### References ####

##### Projects #####

[01] Ada Microkernel Project
<http://www.archeia.com/>

[02] ARM-Ada
<http://sourceforge.net/projects/arm-ada/>

[03] GNATforAVR32
<https://github.com/gregerts/GNATforAVR32>

[04] Tamp
<https://github.com/Lucretia/tamp>

##### General Documents #####

[05] How to install GCC from scratch with GMP, MPFR, MPC, ELF, without shared libraries?
<http://stackoverflow.com/questions/9450394/how-to-install-gcc-from-scratch-with-gmp-mpfr-mpc-elf-without-shared-librari>

[06] GNAT Pro User's Guide Supplement for Cross Platforms:
<http://www.adacore.com/wp-content/files/auto_update/gnat-cross-docs/html/gnat_ugx.html>

[07] GNAT Pro User's Guide Supplement for High-Integrity Edition Platforms:
<http://www.adacore.com/wp-content/files/auto_update/gnat-hie-docs/html/gnathie_ug.html>

[08] Ada’05 compiler for ARM based systems:
<http://www.zsk.p.lodz.pl/~morawski/Dyplomy/Praca%20dyplomowa%20p.%20Horna.pdf>

	

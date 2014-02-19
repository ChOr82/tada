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
	
	1. **gmp**. We used <https://gmplib.org/download/gmp/gmp-5.1.3.tar.bz2>. But a newer version could be downloaded from <https://gmplib.org/download/gmp/>.
	
		wget https://gmplib.org/download/gmp/gmp-5.1.3.tar.bz2

	2. **mpfr**. We used <http://www.mpfr.org/mpfr-3.1.0/mpfr-3.1.0.tar.gz>. But a newer version could be downloaded from <http://www.mpfr.org/>.
		
		wget http://www.mpfr.org/mpfr-3.1.0/mpfr-3.1.0.tar.bz2
		
	3. 	**mpc**. We used <ftp://ftp.gnu.org/gnu/mpc/mpc-1.0.2.tar.gz>. But a newer version could be downloaded from <http://www.multiprecision.org/index.php?prog=mpc&page=download>
	
		wget ftp://ftp.gnu.org/gnu/mpc/mpc-1.0.2.tar.gz
		
	4. **autoconf**. We used autoconf-2.69.

		wget ftp://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz
		
	5. **automake**. We used automake-1.9.
	
		wget ftp://ftp.gnu.org/gnu/automake/automake-1.9.tar.bz2
		
	6. **binutils**. We used binutils-2.9.1.
	
		wget ftp://ftp.gnu.org/gnu/binutils/binutils-2.9.1.tar.gz

	7. **gcc**. We used gcc-4.8.2. But a newer version could be downloaded from <ftp://ftp.gnu.org/gnu/gcc/>.
	
		wget ftp://ftp.gnu.org/gnu/gcc/gcc-4.8.2/gcc-4.8.2.tar.gz
	
	8. **gnat-gpl**
		
	cd ..
	
3. Create a folder `tada/sources` to keep the sources from the libraries. Copy the files from the `tada/downloads` folder to it, and unpack them.

	mkdir sources  
	cp downloads/* sources/  
	cd sources

	tar zxf autoconf-2.69.tar.gz  
	tar jxf automake-1.9.tar.bz2  
	tar zxf binutils-2.9.1.tar.gz  
	tar zxf gcc-4.8.2.tar.gz  
	tar jxf gmp-5.1.3.tar.bz2  
	tar zxf mpc-1.0.2.tar.gz  
	tar jxf mpfr-3.1.0.tar.bz2  
	rm *.bz2 *.gz  

#### Step-by-step build ####

1. Install the generic libraries `gmp`, `mpfr` and `mpc`.

	cd gmp-5.1.3  
	./configure  
	make  
	sudo make install  
  
	cd ../mpfr-3.1.0  
	./configure  
	make  
	sudo make install  
  
	cd ../mpc-1.0.2  
	./configure  
	make  
	sudo make install  

	cd ..  

2. Install `automake`, `autoconf` and `binutils`

	mkdir target  

	cd automake-1.9  
	./configure --prefix=/opt/tada/target  
	make  
	make install  
	
	cd ../autoconf-2.69  
	./configure --prefix=/opt/tada/target  
	make  
	make install  

	cd ../binutils-2.9.1  
	./configure --prefix=/opt/tada/target  
	make  
	make install  

	cd ..  

3. Add `target/bin` folder to the PATH.

	PATH=/opt/tada/target/bin:$PATH

4. Build the native gcc compiler.

	mkdir gcc-native
	cd gcc-native
	../sources/gcc-4.8.2/configure --prefix=/opt/tada/target --enable-languages=c,ada,lto --no-recursion
	make
	# it can take lots of time here.

	
	

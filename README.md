# nvenc
Standalone version of nvencodeapi and nvcuvid  
This work originates from Wine-Staging  

The master branch is meant for keeping up-to-date with  
current driver implementation of nvencodeapi and nvcuvid,  
and thus recommend using driver of recent date. (570+).  

## Build requirements:  
- [WINE] (version >= 9.x) [https://www.winehq.org/](https://www.winehq.org/)  
- [Meson] [http://mesonbuild.com/](http://mesonbuild.com/)  
- [NINJA] [https://ninja-build.org/](https://ninja-build.org/)  


Build by running the included script:  
`./package-release.sh destdir`  

This builds only 64bit libraries.  
Old dual-build tree is stashed here:  
[https://github.com/SveSop/nvenc/tree/old-32-64_version](https://github.com/SveSop/nvenc/tree/old-32-64_version)  

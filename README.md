# nvenc
Standalone version of nvencodeapi and nvcuvid  
This work originates from Wine-Staging  

The master branch is meant for keeping up-to-date with  
current driver implementation of nvencodeapi and nvcuvid,  
and thus recommend using driver of recent date. (570+).  

PS. This library requires NVCUDA library in addition to run.  
See: [https://github.com/SveSop/nvcuda](https://github.com/SveSop/nvcuda)  

## Build requirements:  
- [WINE] (version >= 10.x) [https://www.winehq.org/](https://www.winehq.org/)  
- [Meson] [http://mesonbuild.com/](http://mesonbuild.com/)  
- [NINJA] [https://ninja-build.org/](https://ninja-build.org/)  

Build by running the included script:  
`./package-release.sh packagename destdir`  

## Optional build variable:
Providing `--fakedll` to the build script like this:  
`./package-release.sh packagename destdir --fakedll`  
The library will be built as a winelib dll.so and a fakedll .dll placed in the  
output folder in typical wine folderstructure eg.  
`nvenc-packagename/lib/wine/x86_64-windows` and `nvenc-packagename/lib/wine/x86_64-unix`  
These can preferrably be used with the wine env variable `WINEDLLPATH` like this:  
`export WINEDLLPATH=nvenc-packagename/lib/wine`  

This should make `wineboot -u` copy the fakedll to your WINEPREFIX automatically if you  
use wine > 10.0. Be aware that you must use this ENV variable whenever you use that  
WINEPREFIX for NVENC.  
The files can also be copied directly into the wine binary folders in the same folderstructure,  
and it should work the same way.  

This builds only 64bit libraries.  
Old dual-build tree is stashed here:  
[https://github.com/SveSop/nvenc/tree/old-32-64_version](https://github.com/SveSop/nvenc/tree/old-32-64_version)  

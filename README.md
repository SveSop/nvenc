# nvenc
Standalone version of nvencodeapi and nvcuvid  
This work originates from Wine-Staging  

The master branch is meant for keeping up-to-date with  
upstream wine-staging implementation of nvencodeapi and nvcuvid.  

The `devel` branch is current development to support newer API than  
the wine-staging branch that is no longer in active development.  

## Build requirements:  
- [WINE] (version >= 9.x) [https://www.winehq.org/](https://www.winehq.org/)  
- [Meson] [http://mesonbuild.com/](http://mesonbuild.com/)  
- [NINJA] [https://ninja-build.org/](https://ninja-build.org/)  


Build by running the included script:  
`./package-release.sh destdir`  

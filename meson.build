project('nvenc', ['c'], version: 'v0.0', license: 'mixed')

include_path = include_directories('./include')

lib_dl      = meson.get_compiler('c').find_library('dl')

winebuild   = find_program('winebuild')
winegcc     = find_program('winegcc')
wrc         = find_program('wrc')

subdir('dlls')

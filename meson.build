project('nvenc', ['c'], version: 'v0.0', license: 'mixed')

include_path = include_directories('./include')

lib_dl      = meson.get_compiler('c').find_library('dl')

winebuild   = find_program('winebuild')
winegcc     = find_program('winegcc')
wrc         = find_program('wrc')

target_arch = target_machine.cpu_family() == 'x86_64' ? '-m64' : '-m32'
arch_dir_prefix = target_machine.cpu_family() == 'x86_64' ? 'x86_64-' : 'i386-'

if get_option('fakedll')
  install_dir = get_option('libdir') / 'wine'
  install_dir_unix = install_dir / arch_dir_prefix + 'unix'
  install_dir_windows = install_dir / arch_dir_prefix + 'windows'
else
  install_dir_unix = get_option('libdir')
endif

subdir('dlls')

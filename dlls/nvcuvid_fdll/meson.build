nvcuvid_res = custom_target(
  'nvcuvid.res',
  output: 'nvcuvid.res',
  input: 'nvcuvid.rc',
  command: [
    wrc,
    '-I', meson.project_source_root() + '/include',
    '-o', '@OUTPUT@',
    '@INPUT@',
  ],
  install: false,
)

nvcuvid_def = custom_target(
  'nvcuvid.def',
  output: 'nvcuvid.def',
  input: '../nvcuvid/nvcuvid.spec',
  command: [winebuild, target_arch, '-w', '--def', '-o', '@OUTPUT@', '-E', '@INPUT@'],
  install: false,
)

custom_target(
  'nvcuvid.dll',
  output: 'nvcuvid.dll',
  input: [nvcuvid_def, nvcuvid_res],
  command: [
    winebuild,
    target_arch,
    '--dll',
    '--fake-module',
    '-o', '@OUTPUT@',
    '-E', '@INPUT@',
  ],
  install: true,
  install_dir: install_dir_windows,
)

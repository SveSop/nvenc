nvencodeapi_res = custom_target(
  'nvencodeapi.res',
  output: 'nvencodeapi.res',
  input: 'nvencodeapi.rc',
  command: [
    wrc,
    '-I', meson.project_source_root() + '/include',
    '-o', '@OUTPUT@',
    '@INPUT@',
  ],
  install: false,
)

nvencodeapi_def = custom_target(
  'nvencodeapi.def',
  output: 'nvencodeapi.def',
  input: '../nvencodeapi/nvencodeapi.spec',
  command: [winebuild, target_arch, '-w', '--def', '-F', 'nvencodeapi64.dll', '-o', '@OUTPUT@', '-E', '@INPUT@'],
  install: false,
)

custom_target(
  'nvencodeapi64.dll',
  output: 'nvencodeapi64.dll',
  input: [nvencodeapi_def, nvencodeapi_res],
  command: [
    winebuild,
    target_arch,
    '--dll',
    '--fake-module',
    '-F', 'nvencodeapi64.dll',
    '-o', '@OUTPUT@',
    '-E', '@INPUT@',
  ],
  install: true,
  install_dir: install_dir_windows,
)

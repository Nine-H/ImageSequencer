project('com.github.nine-h.imagesequencer', 'vala', 'c', version:'0.1')

app_deps = [
    dependency('gtk+-3.0'),
    meson.get_compiler('vala').find_library('posix'),
    meson.get_compiler('c').find_library('m'),
]

app_source = files(
    'src/ffmpegwrapper.vala',
    'src/imagesequencer.vala'
)

app = executable (
    meson.project_name(),
    app_source,
    dependencies: app_deps,
    install: true
)

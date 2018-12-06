# ImageSequencer

simple app that converts image sequences into video files, for elementary OS I guess.

## Usage

```
meson build && cd build && ninja test && com.github.nine-h.imagesequencer
```

yeah, it's pretty rough, but it's just a sketch at this point, at the moment you need to edit the ffmpeg image input string in ffmpegwrapper.vala to do anything other than blender renders with 9999 frames or less, hoping to make this more automagic. I'll take some test time lapses with my gopro so I have more test data to work with.

## Todo

* Desktop integration and xdg bs
* File saving (`mv /tmp/sequencer_tmp.mp4 <somewhere>` for now)
* Replace yuck posix shell with libav or MLT or something
* Real validation and stuff so it doesn't run off into the weeds
* Config options for format, framerate, size, quality, etc.
* Houston and set up stripe account

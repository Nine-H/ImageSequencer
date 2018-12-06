// ffmpeg -r 24 -f image2 -i %04d.jpg -vcodec libx264 -pix_fmt yuv420p test.mp4

class FFmpegWrapper : GLib.Object {
    public int frame_rate {get; set;}
    public string name_format {get; set;}
    public string directory {get; set;}
    
    public FFmpegWrapper () {
        frame_rate = 24;
        name_format = "%04d.jpg";
    }
    
    public void render () {
        message ("switch to: %s", directory);
        string shell = "ffmpeg -y -r %i -f image2 -i %s -vcodec libx264 /tmp/sequencer_tmp.mp4".printf (frame_rate, name_format);
        message ("commandline: %s", shell);
        Posix.system ("cd %s; %s; cd -".printf(directory.substring(directory.index_of_nth_char(6)), shell));
        Posix.system ("xdg-open /tmp/sequencer_tmp.mp4");
    }
}

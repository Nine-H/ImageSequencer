class ImageSequencer : Gtk.Application {
    private Gtk.Button startbutton;
    private FFmpegWrapper renderer;
    
    public override void activate () {
        renderer = new FFmpegWrapper ();
        
        var instruction = new Gtk.Label ("Select a folder to begin");
        instruction.get_style_context ().add_class ("h2");
        
        var open = new Gtk.FileChooserButton ("Open Folder", Gtk.FileChooserAction.SELECT_FOLDER);
        open.selection_changed.connect (()=>{
            renderer.directory = open.get_uri();
            startbutton.sensitive = true;
        });
        
        startbutton = new Gtk.Button.with_label ("Render!");
        startbutton.sensitive = false;
        startbutton.get_style_context ().add_class (Gtk.STYLE_CLASS_SUGGESTED_ACTION);
        startbutton.clicked.connect(()=>{renderer.render();});
        
        var layout = new Gtk.Box (Gtk.Orientation.VERTICAL, 6);
        layout.pack_start (instruction);
        layout.pack_start (open);
        layout.pack_start (startbutton);
        
        var window = new Gtk.Window ();
        window.add (layout);
        window.border_width = 12;
        window.destroy.connect (Gtk.main_quit);
        window.get_style_context ().add_class ("flat");
        window.get_style_context ().add_class ("rounded");
        window.resizable = false;
        window.show_all ();
        window.title = "ImageSequencerGUI";
        
        Gtk.main ();
    }
    
    public static int main (string[] args) {
        var app = new ImageSequencer ();
        Gtk.init (ref args);
        return app.run ();
    }
}



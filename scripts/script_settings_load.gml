///Load the settings and apply them every time something has changed:
ini_open(working_directory + "\settings\settings.ini");
//Define global variables:
//video variables:
global.fullscreen = ini_read_string("video","fullscreen","false");
global.window_size = ini_read_real("video","window_size",2);
global.quality = ini_read_real("video","quality",2);
//Sounds variables:
global.music_volume = ini_read_real("sounds","music_volume",9);
global.sfx_volume = ini_read_real("sounds","sfx_volume",9);
//Langage variable:
global.langage = ini_read_string("langage","selected_langage","franglish");


//Apply windows_size/fullscreen:
if global.fullscreen = "true"{    
    window_set_fullscreen(true);
    }
else{
    window_set_fullscreen(false);
    window_set_size(424*global.window_size,240*global.window_size);
    }
//Center the window
with(object_deadzone){
    //alarm_set(0,1);
    }



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
//Controls variable:
global.vibrate = ini_read_string("controls","vibrate","on");
//Mapping du clavier:
global.keyboard_left=ini_read_real("controls","left",ord("Q"));
global.keyboard_right=ini_read_real("controls","right",ord("D"));
global.keyboard_up=ini_read_real("controls","up",ord("Z"));
global.keyboard_down=ini_read_real("controls","down",ord("S"));

global.keyboard_face1=ini_read_real("controls","face1",32);
global.keyboard_face2=ini_read_real("controls","face2",27);
global.keyboard_face3=ini_read_real("controls","face3",ord("T"));
global.keyboard_face4=ini_read_real("controls","face4",ord("U"));

global.keyboard_start=ini_read_real("controls","start",ord("P"));

global.keyboard_shoulderr=ini_read_real("controls","shoulderr",ord("E"));
global.keyboard_shoulderl=ini_read_real("controls","shoulderl",ord("A"));



//Apply windows_size/fullscreen: DISABLED FOR NEW VIEW SYSTEM

if global.fullscreen = "true"{    
    window_set_fullscreen(true);
    surface_resize(application_surface, display_get_width(), display_get_height());
    }
else{
    window_set_fullscreen(false);
    surface_resize(application_surface, object_deadzone.ideal_width*global.window_size, object_deadzone.ideal_height*global.window_size);
    window_set_size(object_deadzone.ideal_width*global.window_size, object_deadzone.ideal_height*global.window_size);
    }
//Center the window
with(object_deadzone){
    alarm_set(0,1);
    }





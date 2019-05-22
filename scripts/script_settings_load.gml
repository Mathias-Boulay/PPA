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

global.background_xoffset=0;
global.background_yoffset=0;

//Apply windows_size/fullscreen: DISABLED FOR NEW VIEW SYSTEM

if global.fullscreen = "true"{    
    window_set_fullscreen(true);
    surface_resize(application_surface, display_get_width(), display_get_height());
    var ratio=display_get_width()/display_get_height();
    for(var i=1; i<=room_last;i++){
        if room_exists(i){
            //On défini la view 0 en fonction du ratio de l'écran.
            switch(ratio){
            
                case 16/9:
                    room_set_view(i,0,true,0,0,424,240,0,0,424,240,0,0,0,0,-1);
                break;
                
                case 16/10:
                    room_set_view(i,0,true,0,0,424,265,0,0,424,265,0,0,0,0,-1);
                    //global.background_yoffset=12;
                break;
                
                case 21/9:
                    room_set_view(i,0,true,0,0,560,240,0,0,560,240,0,0,0,0,-1);
                    global.background_xoffset=68;
                break;
                
                case 1/1:
                    room_set_view(i,0,true,0,0,424,424,0,0,424,424,0,0,0,0,-1);
                    //global.background_yoffset=92;
                break;
                
                case 4/3:
                    room_set_view(i,0,true,0,0,424,318,0,0,424,318,0,0,0,0,-1);
                    //global.background_yoffset=39;
                break;
                
                default: //Fallback en 16:9
                    room_set_view(i,0,true,0,0,424,240,0,0,424,240,0,0,0,0,-1);
                break;
                
                }
            room_set_view_enabled(i,true);
            }
        }
    //Il faut recentrer l'objet livre.
    //Cas possible: menu d'options; n'existe pas.
    if instance_exists(object_white_book){
        with(object_white_book){
            //On se replace puis on replace les autres éléments du menu.
            x= view_xview[0]+(view_wview[0]/2)-(sprite_get_width(sprite_white_book)/2);
            y= view_yview[0]+(view_hview[0]/2)-(sprite_get_height(sprite_white_book)/2);
            
            object_resolution.x= x+269;
            object_resolution.y=y+86;
            
            object_fullscreen.x=x+269;
            object_fullscreen.y=y+120;
            
            object_quality.x=x+269;
            object_quality.y=y+161;
            
            object_retour.x=x+175;
            object_retour.y=y+200;
            
            object_leftbutton_main_menu.x=object_fullscreen.bbox_right+5;
            object_leftbutton_main_menu.y=object_fullscreen.y+11;
            
            
            object_rightbutton_main_menu.x=object_fullscreen.bbox_left-5;
            //Le y se place tout seul sur cet objet.
            
            }
        }
       
    }
else{
    if window_get_fullscreen(){
        window_set_fullscreen(false);
        //Il faut recentrer l'objet livre.
        //Cas possible: menu d'options; n'existe pas.
        if instance_exists(object_white_book){
            with(object_white_book){
                //On se replace puis on replace les autres éléments du menu.
                x= view_xview[0]+(view_wview[0]/2)-(sprite_get_width(sprite_white_book)/2);
                y= view_yview[0]+(view_hview[0]/2)-(sprite_get_height(sprite_white_book)/2);
                
                object_resolution.x= x+269;
                object_resolution.y=y+86;
                
                object_fullscreen.x=x+269;
                object_fullscreen.y=y+120;
                
                object_quality.x=x+269;
                object_quality.y=y+161;
                
                object_retour.x=x+175;
                object_retour.y=y+200;
                
                object_leftbutton_main_menu.x=object_fullscreen.bbox_right+5;
                object_leftbutton_main_menu.y=object_fullscreen.y+11;
                
                
                object_rightbutton_main_menu.x=object_fullscreen.bbox_left-5;
                //Le y se place tout seul sur cet objet.
                
                }
            }
        }

    surface_resize(application_surface, 424*global.window_size, 240*global.window_size);
    window_set_size(424*global.window_size, 240*global.window_size);
    for(var i=1; i<=room_last;i++){
        if room_exists(i){
            //On défini la view 0 pour chaque room selon les paramètes calculé
            room_set_view(i,0,true,0,0,424,240,0,0,424,240,0,0,0,0,-1);
            room_set_view_enabled(i,true);
            }
        }
    }
    

//Center the window
with(object_deadzone){
    alarm_set(0,1);
    }





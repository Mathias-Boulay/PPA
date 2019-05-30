///script_fade_status(Room/Status,Room/Status,Room/Status,...)
if !instance_exists(object_fade){
    temp_fade = instance_create(view_xview[0],view_yview[0],object_fade);
    for(i=0;i<argument_count;i++){
        temp_fade.STATUS[i]=argument[i];
        }
    }


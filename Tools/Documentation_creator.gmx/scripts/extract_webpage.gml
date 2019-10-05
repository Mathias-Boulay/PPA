///extract_webpage(File);
var Image_number;
var webpage;
var String_webpage;
var Category_webpage;
var Title_webpage;
var TypeString;
var File;

Image_number = 0;

TypeString[1] = '<p class="BigTitlePurple">';
TypeString[2] = '<p class="SubTitlePurple">';
TypeString[3] = '<p class="SubTitleDark">';
TypeString[4] = '<p class="LittleTitlePurple">';
TypeString[5] = '<p class="LittleTitle">';
TypeString[6] = '<p class="Syntax">';
TypeString[7] = '<table class="FunctionTable">';
TypeString[8] = '<img';
TypeString[9] = '<p>';
TypeString[10] = '<table class="ConstantsTable">';


File = argument0;
File = string_delete(File,1,string_pos("Docs/html",File));
webpage = file_text_open_read(File);
String_webpage = file_text_read_string(webpage);
file_text_close(webpage);

Category_webpage = string_delete(argument0,1,string_pos('html/',argument0)+5);
if string_count('\',Category_webpage) > 0{
    Category_webpage = string_copy(Category_webpage,1,string_pos('/',Category_webpage)+1);
    }
else{
    Category_webpage = "";
    }


//Remove useless things:
String_webpage = string_replace(String_webpage,'<DOCTYPE html><html><head><meta charset="utf-8" />','');

String_webpage = string_replace(String_webpage,'<link rel="stylesheet" href="../../css/css.css" />','');
String_webpage = string_replace(String_webpage,'<link rel="stylesheet" href="../css/css.css" />','');

String_webpage = string_replace(String_webpage,'<html>','');
String_webpage = string_replace(String_webpage,'</html>','');

//String_webpage = string_replace(String_webpage,'<head>','');
String_webpage = string_replace(String_webpage,'</head>','');

String_webpage = string_replace(String_webpage,'<body>','');
String_webpage = string_replace(String_webpage,'</body>','');

String_webpage = string_replace(String_webpage,'<html>','');

String_webpage = string_delete(String_webpage,string_pos('<table class="FooterTable">',String_webpage),string_length(String_webpage));

//Extract
Title_webpage = string_copy(String_webpage,string_pos('<title>',String_webpage),(string_pos('</title>',String_webpage)+8)-string_pos('<title>',String_webpage));
Title_webpage = string_replace(Title_webpage,'<title>','');
Title_webpage = string_replace(Title_webpage,'-PPA Docs</title>','');

String_webpage = string_delete(String_webpage,string_pos('<title>',String_webpage),(string_pos('</title>',String_webpage)+8)-string_pos('<title>',String_webpage));

do{
    show_debug_message(String_webpage);
    var Type;
    var TypePosition;
    Type = 0;
    TypePosition = string_length(String_webpage);
        
    for(i=1; i<10; i++){
        if string_pos(TypeString[i],String_webpage) < TypePosition && string_pos(TypeString[i],String_webpage) != 0{
            Type = i;
            TypePosition = string_pos(TypeString[i],String_webpage);
            }
        }
        
    Part_webpage = "";
    
    show_debug_message("Type found= "+string(TypeString[Type]));
        
    switch(Type){
        
        case TITLE:
        case PURPLE_SUB_TITLE:
        case SUB_TITLE:
        case PURPLE_LITTLE_TITLE:
        case LITTLE_TITLE:
        case SYNTAX:
        case TEXT:
            Part_webpage = string_copy(String_webpage,TypePosition, (string_pos('</p>',String_webpage)+4)-TypePosition);
            Part_webpage = string_replace(Part_webpage,TypeString[Type],'');
            Part_webpage = string_replace(Part_webpage,'</p>','');
            
            String_webpage = string_delete(String_webpage,string_pos(TypeString[Type],String_webpage),(string_pos('</p>',String_webpage)+4)-TypePosition);
            
            This_part = instance_create(room_width-(sprite_width/2),sprite_height*(0.5+instance_number(object_part)),object_part);
            This_part.ID = Type;
            This_part.Final = string_replace(Part_webpage,'<br>','#');
            
            break;
            
        
        case FUNCTION_TABLE:
            Part_webpage = string_copy(String_webpage,TypePosition, (string_pos('</table>',String_webpage)+8)-TypePosition);
            Part_webpage = string_replace(Part_webpage,TypeString[Type],'');
            Part_webpage = string_replace(Part_webpage,'<tr class="FunctionTableTitle"><td>Arguments</td><td>Type</td><td>Description</td></tr>','');
            
            rows = string_count('<tr',Part_webpage);
            for(i=0; i< rows; i++){
                if string_pos('<tr class="FunctionTableLineBis"',Part_webpage) = 1{
                    Part_webpage = string_replace(Part_webpage,'<tr class="FunctionTableLineBis">','');
                    }
                else{
                    Part_webpage = string_replace(Part_webpage,'<tr>','');
                    }
                //Part_webpage = string_delete(Part_webpage,1,string_pos('>',Part_webpage)+1);
                Part_webpage = string_replace(Part_webpage,'</tr>','');
                
                
                for(j=0;j<3; j++){
                    table_part[i,j] = string_copy(Part_webpage,string_pos('<td>',Part_webpage),string_pos('</td>',Part_webpage)+4);
                    table_part[i,j] = string_replace(table_part[i,j],'<td>','');
                    table_part[i,j] = string_replace(table_part[i,j],'</td>','');
                    
                    Part_webpage = string_delete(Part_webpage,string_pos('<td>',Part_webpage),string_pos('</td>',Part_webpage)+4);
                    }
                }
            Part_webpage = string_replace(Part_webpage,'</table>','');
            
            String_webpage = string_delete(String_webpage,string_pos(TypeString[Type],String_webpage),(string_pos('</table>',String_webpage)+8)-TypePosition);
            
            This_part = instance_create(room_width-(sprite_width/2),sprite_height*(0.5+instance_number(object_part)),object_part);
            This_part.ID = FUNCTION_TABLE;
            
            for(i=0; i< array_height_2d(table_part); i++){
                This_part.Final[i,0] = table_part[i,0];
                This_part.Final[i,1] = table_part[i,1];
                This_part.Final[i,2] = table_part[i,2];
                }
            
            break;
            
        case PICTURE:
            Part_webpage = string_copy(String_webpage,TypePosition, (string_pos('/>',String_webpage)+2)-TypePosition);
            Part_webpage = string_replace(Part_webpage,'<img class="Center" src="','');
            Part_webpage = string_replace(Part_webpage,'"/>','');
            Part_webpage = string_replace(Part_webpage,'../','');
            Part_webpage = string_replace(Part_webpage,'../','');
            Part_webpage = string_replace(Part_webpage,'images/','');
            
            String_webpage = string_delete(String_webpage,TypePosition, (string_pos('/>',String_webpage)+2)-TypePosition);
            
            if file_exists(IMG_DIR + Part_webpage){
                tmp_name = filename_name(IMG_DIR + Part_webpage);
                file_copy(IMG_DIR + Part_webpage, IMG_DIR + "tmp/" + tmp_name);
                
                file_rename(IMG_DIR + Part_webpage, IMG_DIR + Part_webpage + ".txt");
                file_delete(IMG_DIR + Part_webpage + ".txt")
                This_part = instance_create(room_width-(sprite_width/2),sprite_height*(0.5+instance_number(object_part)),object_part);
                This_part.ID = PICTURE;
                This_part.Final = tmp_name;
                
                }
            break;
            
        case CONSTANTS_TABLE:
            Part_webpage = string_copy(String_webpage,TypePosition, (string_pos('</table>',String_webpage)+8)-TypePosition);
            Part_webpage = string_replace(Part_webpage,TypeString[Type],'');
            Part_webpage = string_replace(Part_webpage,'<tr class="ConstantsTableTitle"><td>Constants</td><td>Description</td></tr>','');
            
            rows = string_count('<tr',Part_webpage);
            for(i=0; i< rows; i++){
                if string_pos('<tr class="ConstantsTableLineBis"',Part_webpage) = 1{
                    Part_webpage = string_replace(Part_webpage,'<tr class="ConstantsTableLineBis">','');
                    }
                else{
                    Part_webpage = string_replace(Part_webpage,'<tr>','');
                    }
                //Part_webpage = string_delete(Part_webpage,1,string_pos('>',Part_webpage)+1);
                Part_webpage = string_replace(Part_webpage,'</tr>','');
                
                
                for(j=0;j<2; j++){
                    table_part[i,j] = string_copy(Part_webpage,string_pos('<td>',Part_webpage),string_pos('</td>',Part_webpage)+4);
                    table_part[i,j] = string_replace(table_part[i,j],'<td>','');
                    table_part[i,j] = string_replace(table_part[i,j],'</td>','');
                    
                    Part_webpage = string_delete(Part_webpage,string_pos('<td>',Part_webpage),string_pos('</td>',Part_webpage)+4);
                    }
                }
            Part_webpage = string_replace(Part_webpage,'</table>','');
            
            String_webpage = string_delete(String_webpage,string_pos(TypeString[Type],String_webpage),(string_pos('</table>',String_webpage)+8)-TypePosition);
            
            This_part = instance_create(room_width-(sprite_width/2),sprite_height*(0.5+instance_number(object_part)),object_part);
            This_part.ID = CONSTANTS_TABLE;
            
            for(i=0; i< array_height_2d(table_part); i++){
                This_part.Final[i,0] = table_part[i,0];
                This_part.Final[i,1] = table_part[i,1];
                }
            
            break;
            
        }




    }
until(String_webpage = "");











///extract_webpage(File);
webpage = file_text_open_read(argument0);
String_webpage = file_text_read_string(webpage);
file_text_close(webpage);

Category_webpage = string_delete(argument0,1,string_pos('html/',argument0)+5);
if string_count('/',Category_webpage) > 0{
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

String_webpage = string_delete(String_webpage,string_pos(String_webpage,'<table class="FooterTable">'),string_length(String_webpage));

//Extract
Title_webpage = string_copy(String_webpage,string_pos(String_webpage,'<title>'),(string_pos(String_webpage,'</title>')+8)-string_pos(String_webpage,'<title>'));
Title_webpage = string_replace(Title_webpage,'<title>','');
Title_webpage = string_replace(Title_webpage,'-PPA Docs</title>','');

String_webpage = string_delete(String_webpage,string_pos(String_webpage,'<title>'),(string_pos(String_webpage,'</title>')+8)-string_pos(String_webpage,'<title>'));

do{
    
    var TypeString;
    TypeString[1] = '<p class="BigTitlePurple">';
    TypeString[2] = '<p class="SubTitlePurple">';
    TypeString[3] = '<p class="SubTitleDark">';
    TypeString[4] = '<p class="LittleTitlePurple">';
    TypeString[5] = '<p class="LittleTitle">';
    TypeString[6] = '<p class="Syntax">';
    TypeString[7] = '<table class="FunctionTable">';
    TypeString[8] = '<img';
    TypeString[9] = '<p>';
    
    
    

    var Type;
    var TypePosition;
    Type = 0;
    TypePosition = string_length(String_webpage);
        
    for(i=1; i<10; i++){
        if string_pos(TypeString[i],String_webpage) < TypePosition{
            Type = i;
            TypePosition = string_pos(TypeString[i],String_webpage);
            }
        }
        
    Part_webpage = "";
        
    switch(Type){
        
        case TITLE:
        case PURPLE_SUB_TITLE:
        case SUB_TITLE:
        case PURPLE_LITTLE_TITLE:
        case LITTLE_TITLE:
        case SYNTAX:
        case TEXT:
            Part_webpage = string_copy(String_webpage,string_pos(String_webpage, TypeString[Type]), (string_pos(String_webpage,'</p>')+4)-string_pos(String_webpage, TypeString[Type]));
            Part_webpage = string_replace(Title_webpage,TypeString[Type],'');
            Part_webpage = string_replace(Title_webpage,'</p>','');
            
            String_webpage = string_delete(String_webpage,string_pos(String_webpage,TypeString[Type]),(string_pos(String_webpage,'</p>')+4)-string_pos(String_webpage,TypeString[Type]));
            
        
        case FUNCTION_TABLE:
            Part_webpage = string_copy(String_webpage,string_pos(String_webpage, TypeString[Type]), (string_pos(String_webpage,'</table>')+8)-string_pos(String_webpage, TypeString[Type]));
            Part_webpage = string_replace(Title_webpage,TypeString[Type],'');
            Part_webpage = string_replace(Title_webpage,'<tr class="FunctionTableTitle"><td>Arguments</td><td>Type</td><td>Description</td></tr>','');
            
            for(i=0; i<string_count('<tr',Part_webpage);i++){
                Part_webpage = string_delete(Part_webpage,1,string_pos('>',Part_webpage)+1);
                Part_webpage = string_replace(Part_webpage,'</tr>','');
                
                
                for(j=0;j<3; j++){
                    table_part[i,j] = string_copy(Part_webpage,string_pos('<td>',Part_webpage),string_pos('</td>',Part_webpage)+5);
                    table_part[i,j] = string_replace(table_part[i,j],'<td>','');
                    table_part[i,j] = string_replace(table_part[i,j],'</td>','');
                    }
                }
            Part_webpage = string_replace(Title_webpage,'</table>','');
            
            String_webpage = string_delete(String_webpage,string_pos(String_webpage,TypeString[Type]),(string_pos(String_webpage,'</table>')+8)-string_pos(String_webpage,TypeString[Type]));
            break;
            
        case PICTURE:
            Part_webpage = string_copy(String_webpage,string_pos(String_webpage, TypeString[Type]), (string_pos(String_webpage,'/>')+2)-string_pos(String_webpage, TypeString[Type]));
            Part_webpage = string_replace(Part_webpage,'<img class="Center" src="','');
            Part_webpage = string_replace(Part_webpage,'"/>','');
            Part_webpage = string_replace(Part_webpage,'../','');
            Part_webpage = string_replace(Part_webpage,'../','');
            Part_webpage = string_replace(Part_webpage,'images/','');
            
            if file_exists(IMG_DIR + Part_webpage){
                file_copy(IMG_DIR + Part_webpage, IMG_DIR +"tmp/"
            
        
        
        }




    }
until(String_webpage = "");











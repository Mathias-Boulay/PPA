///extract_webpage(File);
webpage = file_text_open_read(argument0);
String_webpage = file_text_read_string(webpage);
file_text_close(webpage);

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
        
    switch(Type){
        
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 9:
            Part_webpage = string_copy(String_webpage,string_pos(String_webpage, TypeString[Type]), (string_pos(String_webpage,'</p>')+4)-string_pos(String_webpage, TypeString[Type]));
            Part_webpage = string_replace(Title_webpage,TypeString[Type],'');
            Part_webpage = string_replace(Title_webpage,'</p>','');
            
            String_webpage = string_delete(String_webpage,string_pos(String_webpage,TypeString[Type]),(string_pos(String_webpage,'</p>')+4)-string_pos(String_webpage,TypeString[Type]));
            
        
        
        
        
        }




    }
until(String_webpage = "");











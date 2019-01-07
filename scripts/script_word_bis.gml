var search = argument0;
var length = argument1;
//Par précaution mais peut mener à des erreur peu detectables.
ini_close();

ini_open("language.ini");
for(i=search;i<=length;i++){
    findstr[i-search] = string_replace_all(ini_read_string(global.langage, string(i), "No String Found!"), "*", "#");
    }

//var findstr = ini_read_string(global.langage, string(search), "No String Found!");

ini_close();
//findstr = string_replace_all(findstr, "*", "#");
return findstr;

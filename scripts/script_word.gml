var search = argument0;


ini_open("language.ini");

var findstr = ini_read_string(global.langage, string(search), "No String Found!");

ini_close();
findstr = string_replace_all(findstr, "*", "#");
return findstr;

///script_word(ValueToSearch)
var search = argument0;
//Par précaution mais peut mener à des erreur peu detectables.
ini_close();

ini_open("language.ini");

var findstr = ini_read_string(global.langage, string(search), "No String Found!");

ini_close();
findstr = string_replace_all(findstr, "*", "#");
return findstr;

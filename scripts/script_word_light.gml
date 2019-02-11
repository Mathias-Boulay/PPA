///script_word_light(StartValueToSearch , EndValueToSearch);
var search = argument0;
var length = argument1;
//Par précaution mais peut mener à des erreur peu detectables.
ini_close();

ini_open("language.ini");
for(i=search;i<=length;i++){
    findstr[i-search] = string_replace_all(ini_read_string(global.langage, string(i), "No String Found!"), "*", "#");
    }

ini_close();
return findstr;

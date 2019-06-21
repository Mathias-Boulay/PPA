///extract_string(ID,StrToExtract)
if variable_instance_exists(argument0,string(argument1)){
    extract=variable_instance_get(argument0,string(argument1));
    if string_replace_all(extract,",","") != ""{
        //First step: delete the first character. Should be either "(" or ",".
        extract=string_delete(extract,1,1);
        //Second step: take everything beetween the first "," or ")"
        if string_count(",",extract) >= 1{ //Si l'argument n'est pas le dernier:
            stop=string_pos(",",extract)-1;
            }
        else{
            stop=string_pos(")",extract)-1;
            }
        if stop != 0{
            //Extraire l'argument:
            extracted=string_copy(extract,1,stop);
            extract=string_delete(extract,1,stop);
            //Transmettre et mettre à jour les strings:
            print_debug("[EX STR] Argument found: "+extracted);
            variable_instance_set(argument0,argument1,extract);
            return real(extracted);
            }
        else{
            print_error("[EX STR] Empty argument found");
            return "";
            }
        
        }
    else{
        print_error("[EX STR] Empty String found");
        return "";
        }
    }
else{
    print_error("[EX STR] No String found");
    return "";
    }

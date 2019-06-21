///extract_real(ID,StrToExtract)
if variable_instance_exists(argument0,string(argument1)){
    extract=string(argument1);
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
            if extracted = string_digits(extracted) || extracted = string_insert("-",string_digits(extracted),1){
                //Transmettre et mettre à jour les strings:
                argument0.argument1=extract;
                return real(extracted);
                }
            else{
                print_error("The argument is cannot be turned into a real number");
                return "";
                }
            }
        else{
            print_error("Empty argument found");
            return "";
            }
        
        }
    else{
        print_error("Empty String found");
        return "";
        }
    }
else{
    print_error("No String found");
    return "";
    }

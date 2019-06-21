///check_integrity(ID,StrToCheck,NumOfArgs)
if variable_instance_exists(argument0,string(argument1)){
    check=variable_instance_get(argument0,string(argument1));
    check=string_replace_all(check," ","");
    argument0.argument1=check;
    if string_replace_all(check,",","") != ""{
        if string_count("(",check) = 1{
            if string_count(")",check) = 1{
                if string_count(",",check)=(argument3-1){
                    //L'intégrité est vérifiée:
                    return true;
                    }
                else{
                    print_error("Wrong number of arguments");
                    return false;
                    }
                }
            else{
                print_error("Wrong number of closing parentheses");
                return false;
                }
            }
        else{
            print_error("Wrong number of opening parentheses");
            return false;
            }
        }
    else{
        print_error("Empty string found");
        return false;
        }
    }
else{
    print_error("No string found");
    return false;
    }

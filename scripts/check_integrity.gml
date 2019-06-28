///check_integrity(ID,StrToCheck,NumOfArgs)
if variable_instance_exists(argument0,string(argument1)){
    check=variable_instance_get(argument0,string(argument1));
    check=string_replace_all(check," ","");
    variable_instance_set(argument0,string(argument1),check);
    if string_replace_all(check,",","") != ""{
        if string_count("(",check) = 1{
            if string_count(")",check) = 1{
                if string_count(",",check)=(argument2-1){
                    //L'intégrité est vérifiée:
                    print_debug("[IT] Integrity Verified");
                    variable_instance_set(argument0,"integrity",true);
                    }
                else{
                    print_error("[IT] Wrong number of arguments");
                    variable_instance_set(argument0,"integrity",false);
                    }
                }
            else{
                print_error("[IT] Wrong number of closing parentheses");
                variable_instance_set(argument0,"integrity",false);
                }
            }
        else{
            print_error("[IT] Wrong number of opening parentheses");
            variable_instance_set(argument0,"integrity",false);
            }
        }
    else{
        print_error("[IT] Empty string found");
        variable_instance_set(argument0,"integrity",false);
        }
    }
else{
    print_error("[IT] No string found");
    variable_instance_set(argument0,"integrity",false);
    }

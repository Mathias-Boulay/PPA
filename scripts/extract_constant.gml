///extract_constant(ID,ConstToExtract)
if variable_instance_exists(argument0,string(argument1)){
    extract = variable_instance_get(argument0,string(argument1));
    if string_replace_all(extract,",","") != ""{
    
        //First step: delete the first character. Should be either "(" or ",".
        extract=string_delete(extract,1,1);
        //Second step: take everything beetween the first "," or ")"
        if string_count(",",extract) >= 1{ //Si l'argument n'est pas le dernier:
            stop = string_pos(",",extract)-1;
            }
        else{
            stop = string_pos(")",extract)-1;
            }
        if stop != 0{
            //Extraire l'argument:
            extracted = string_upper(string_copy(extract,1,stop));
            
            extract = string_delete(extract,1,stop);
            variable_instance_set(argument0,string(argument1),extract);
            
            
            //Attribuer des constantes:
            switch(extracted){
            
                //Walls:
                case("TOP_LEFT"):
                    TranslatedConstant = 0;
                    break;
                    
                case("TOP"):
                    TranslatedConstant = 1;
                    break;
                    
                case("TOP_RIGHT"):
                    TranslatedConstant = 2;
                    break;
                
                case("LEFT"):
                    TranslatedConstant = 3;
                    break;
                    
                case("CENTER"):
                    TranslatedConstant = 4;
                    break;
                    
                case("RIGHT"):
                    TranslatedConstant = 5;
                    break;
                    
                case("BOTTOM_LEFT"):
                    TranslatedConstant = 6;
                    break;
                    
                case("BOTTOM"):
                    TranslatedConstant = 7;
                    break;
                    
                case("BOTTOM_RIGHT"):
                    TranslatedConstant = 8;
                    break;
                
                
                //Signs:
                case("WARNING"):
                    TranslatedConstant = 0;
                    break;
                    
                case("A"):
                    TranslatedConstant = 1;
                    break;
                    
                case("B"):
                    TranslatedConstant = 2;
                    break;
                    
                case("X"):
                    TranslatedConstant = 3;
                    break;
                    
                case("Y"):
                    TranslatedConstant = 4;
                    break;
                    
                case("BACK"):
                    TranslatedConstant = 5;
                    break;
                    
                case("WRITINGS"):
                    TranslatedConstant = 6;
                    break;
                
            
            
            
                default:
                    print_error("[EX CONSTANT] No constant found, are you sure that <" +extracted+ "> is actually a constant ?");
                    variable_instance_set(argument0,"integrity",false);
                    return "";
                    break;
                
                }
                
            print_debug("[EXT CONSTANT] Constant <" +extracted+ "> found --> " +string(TranslatedConstant));
            return TranslatedConstant;  
            
            }
        else{
            print_error("[EX CONSTANT] No End of argument found");
            variable_instance_set(argument0,"integrity",false);
            return "";
            }
        
        }
    else{
        print_error("[EX CONSTANT] Empty String found");
        variable_instance_set(argument0,"integrity",false);
        return "";
        }
    }
else{
    print_error("[EX CONSTANT] No String found");
    variable_instance_set(argument0,"integrity",false);
    return "";
    }

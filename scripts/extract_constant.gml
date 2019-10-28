///extract_constant(ID,ConstToExtract)

//Tableau de constante: [i,0] pour la constante, [i,1] pour la traduction en réel
var AvailableConstants;
//-----WALLS-----
AvailableConstants[0,0] = "TOP_LEFT";
AvailableConstants[0,1] = 0;

AvailableConstants[1,0] = "TOP";
AvailableConstants[1,1] = 1;

AvailableConstants[2,0] = "TOP_RIGHT";
AvailableConstants[2,1] = 2;

AvailableConstants[3,0] = "LEFT";
AvailableConstants[3,1] = 3;

AvailableConstants[4,0] = "CENTER";
AvailableConstants[4,1] = 4;

AvailableConstants[5,0] = "RIGHT";
AvailableConstants[5,1] = 5;

AvailableConstants[6,0] = "BOTTOM_LEFT";
AvailableConstants[6,1] = 6;

AvailableConstants[7,0] = "BOTTOM";
AvailableConstants[7,1] = 7;

AvailableConstants[8,0] = "BOTTOM_RIGHT";
AvailableConstants[8,1] = 8;

//-----SIGNS-----
AvailableConstants[9,0] = "WARNING";
AvailableConstants[9,1] = 0;

AvailableConstants[10,0] = "A";
AvailableConstants[10,1] = 1;

AvailableConstants[11,0] = "B";
AvailableConstants[11,1] = 2;

AvailableConstants[12,0] = "X";
AvailableConstants[12,1] = 3;

AvailableConstants[13,0] = "Y";
AvailableConstants[13,1] = 4;

AvailableConstants[14,0] = "BACK";
AvailableConstants[14,1] = 5;

AvailableConstants[15,0] = "WRITINGS";
AvailableConstants[15,1] = 6;

var TranslatedConstant;
TranslatedConstant = "";

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
            for(ConstantCount = 0; ConstantCount < array_height_2d(AvailableConstants); ConstantCount++){
                if extracted = AvailableConstants[ConstantCount,0]{
                    TranslatedConstant = AvailableConstants[ConstantCount,1];
                    print_debug("[EXT CONSTANT] Constant <" +extracted+ "> found --> " +string(TranslatedConstant));
                    break;
                    }
                }
                
            if TranslatedConstant = ""{
                if is_real(real(string_digits(extracted))){
                    print_warning("[EXT CONSTANT] Found a real instead of a constant, are you sure you want to keep this ?");
                    TranslatedConstant = real(string_digits(extracted));
                    }
                else{
                    print_error("[EX CONSTANT] No constant found, are you sure that <" +extracted+ "> is actually a constant ?");
                    variable_instance_set(argument0,"integrity",false);
                    }
                }
                
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

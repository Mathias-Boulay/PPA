///get_allowed_parts(LevelNameToCheck)

//*****   This function assumes the    *****\\
//***** global variable SELECTED_SAVE  *****\\
//*****   points towards something     *****\\

//*****   This function also assumes the   *****\\
//*****      array LevelParts exists       *****\\
//*****     points towards something       *****\\
var PossibleParts;
PossibleParts[5]="Boss";
PossibleParts[4]="PartFive";
PossibleParts[3]="PartFour";
PossibleParts[2]="PartThree";
PossibleParts[1]="PartTwo";
PossibleParts[0]="PartOne";


var PartsToCheck;
PartsToCheck = "";

//Avoid corruption
ini_close();

if variable_global_exists("SELECTED_SAVE"){
    if file_exists(global.SELECTED_SAVE){
        
        if variable_instance_exists(id,"LevelParts"){
            ini_open(global.SELECTED_SAVE);
            
            for(i=0; i<array_length_1d(LevelParts); i++){
                PartsToCheck[i] = ini_read_real(string(argument0),PossibleParts[LevelParts[i]]+"Allowed",0);
                }
                
            ini_close();
                
            if is_array(PartsToCheck){
                return PartsToCheck;
                }
            else{
                print_error("[SAVE PART PARSER] No Parts were checked");
                return "";
                }
            
            }
        else{
            print_error("[SAVE PART PARSER] LevelParts variable doesn't exist, unable to check if the player has allowed parts");
            return "";
            }
        }
    else{
        print_error("[SAVE PART PARSER] Save not found");
        return "";
        }
    }
else{
    print_error("[SAVE PART PARSER] No selected save");
    return "";
    }


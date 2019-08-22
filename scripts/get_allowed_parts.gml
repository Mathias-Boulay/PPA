///get_allowed_parts(LevelNameToCheck)

//*****   This function assumes the    *****\\
//***** global variable SELECTED_SAVE  *****\\
//*****   points towards something     *****\\
var PartsToCheck;

//Avoid corruption
ini_close();

if variable_global_exists("SELECTED_SAVE"){
    if file_exists(global.SELECTED_SAVE){
        ini_open(global.SELECTED_SAVE);
        
        PartsToCheck[0] = ini_read_real(string(argument0),"PartOneAllowed",0);
        PartsToCheck[1] = ini_read_real(string(argument0),"PartTwoAllowed",0);
        PartsToCheck[2] = ini_read_real(string(argument0),"PartThreeAllowed",0);
        PartsToCheck[3] = ini_read_real(string(argument0),"PartFourAllowed",0);
        PartsToCheck[4] = ini_read_real(string(argument0),"PartFiveAllowed",0);
        PartsToCheck[5] = ini_read_real(string(argument0),"BossAllowed",0); 
        
        ini_close();
        
        return PartsToCheck;   
        
        }
    else{
        print_error("[SAVE PART PARSER] Save not found !");
        return "";
        }
    
    }
else{
    print_error("[SAVE PART PARSER] No selected save !");
    return "";
    }


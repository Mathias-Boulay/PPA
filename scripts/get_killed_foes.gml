///get_killed_foes(LevelName)

//RETURN ONLY ZERO SINCE WE DON'T HAVE ANY FOES !

//*****   This function assumes the    *****\\
//***** global variable SELECTED_SAVE  *****\\
//*****   points towards something     *****\\
var Foes;

//Avoid corruption
ini_close();

if variable_global_exists("SELECTED_SAVE"){
    if file_exists(global.SELECTED_SAVE){
        ini_open(global.SELECTED_SAVE);
        
        Foes[0] = 0;
        Foes[1] = 0;
        Foes[2] = 0;
        Foes[3] = 0;
        Foes[4] = 0;
        Foes[5] = 0;
        
        ini_close();
        
        return Foes;   
        
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

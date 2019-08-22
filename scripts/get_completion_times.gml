///get_completion_times(LevelName)

//RETURN ZERO SINCE COMPLETION TIME ISN'T IMPLEMENTED YET !

//*****   This function assumes the    *****\\
//***** global variable SELECTED_SAVE  *****\\
//*****   points towards something     *****\\
var Time;

//Avoid corruption
ini_close();

if variable_global_exists("SELECTED_SAVE"){
    if file_exists(global.SELECTED_SAVE){
        ini_open(global.SELECTED_SAVE);
        
        Time[0] = 0;
        Time[1] = 0;
        Time[2] = 0;
        Time[3] = 0;
        Time[4] = 0;
        Time[5] = 0;
        
        ini_close();
        
        return Time;   
        
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
